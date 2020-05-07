package daily.admin.qna.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.qna.service.AdminQnaService;
import daily.admin.qna.vo.replyVO;
import daily.client.qna.vo.QnaVO;
import daily.common.page.Paging;
import daily.common.util.FileUploadUtil;

@Controller
@RequestMapping(value = "/admin")
public class AdminQnaController {
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	AdminQnaService qnaService;

	@RequestMapping(value = "/qna/qnaList.do", method = RequestMethod.GET)
	public ModelAndView qnaList(@ModelAttribute QnaVO qvo, Model model) {
		log.info("QnA List 호출 메소드 실행");
		ModelAndView mav = new ModelAndView();

		// 페이징 세팅
		Paging.setPage(qvo);
		int total = qnaService.boardListCnt(qvo);

		List<QnaVO> qnaList = qnaService.List(qvo);
		mav.addObject("qnaList", qnaList);
		mav.addObject("total", total);
		mav.addObject("data", qvo);

		mav.setViewName("admin/qna/adminQnaList");

		return mav;
	}
	
	
	//상세보기
	@RequestMapping(value = "/qna/qnaDetail.do")
	public ModelAndView qnaDetail(@ModelAttribute QnaVO qvo) {
		log.info("QnA Detail 호출 메소드 실행");
		log.info("Detail >>> " + qvo.getQna_num());

		ModelAndView mav = new ModelAndView();
		QnaVO detail = qnaService.detail(qvo);

		if (detail.getQna_state() == 1) {
			replyVO reply = qnaService.selectReply(detail.getQna_num());
			mav.addObject("reply", reply);
		}
		mav.addObject("detail", detail);
		mav.setViewName("admin/qna/adminQnaDetail");
		log.info("QnA Detail 호출 메소드 종료");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/qna/qnaReplyInsert.do", method = RequestMethod.POST)
	public int qnaReplyInsert(@ModelAttribute replyVO repVO, HttpServletRequest request) throws IOException {
		log.info("QnA Reply Insert 호출 메소드 실행");

		System.out.println(repVO.getUploadFile());

		// 답변작성시 첨부파일이 있으면 파일업로드
		if (!repVO.getUploadFile().isEmpty()) {
			String rep_file = FileUploadUtil.fileUpload(repVO.getUploadFile(), request, "reply");
			repVO.setRep_file(rep_file);
		}

		int result = qnaService.insertReply(repVO); // 답변테이블에 insert
		if (result == 1) { // insert성공시
			int updateState = qnaService.updateState(repVO); // 답변이 달린 게시물의 답변여부 컬럼값 바꿔주기 (기본값 : 0 (답변대기) -> 1 (답변완료))
			System.out.println(updateState);
			return updateState;
		}
		/*
		 * if (result == 1) { url = "/admin/qna/qnaList.do";
		 * log.info("QnA Reply Update 호출 메소드 종료"); } else { url =
		 * "/admin/qna/adminQnaDetail" + repVO.getQna_num();
		 * 
		 * }
		 */
		return 0;
	}

	// 답변글 삭제 메소드
	@ResponseBody
	@RequestMapping(value = "/qna/qnaReplyDelete.do")
	public int qnaDelete(@ModelAttribute replyVO repVO, HttpServletRequest request) throws IOException {
		log.info("delete 메소드 진입");

		System.out.println(repVO.getQna_num()+"가 들어감");
		int result = qnaService.delete(repVO);
		System.out.println( result +"가 리턴됨");
		if (result == 1) {
			// 첨부파일이 있으면 파일 삭제
			if (!repVO.getRep_file().isEmpty()) {
				FileUploadUtil.fileDelete(repVO.getRep_file(), request);
			}
			qnaService.updateStateDel(repVO); // 답변여부 상태 1로 바꿔주기
			return result;
		} else {
			return 0;
		}

	}
}
