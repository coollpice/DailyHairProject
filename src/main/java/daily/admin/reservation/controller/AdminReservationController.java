package daily.admin.reservation.controller;

import java.util.List;

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

import daily.admin.designer.service.DesignerService;
import daily.admin.designer.vo.DesignerVO;
import daily.admin.member.service.AdminMemberService;
import daily.admin.reservation.service.AdminReservationService;
import daily.admin.style.service.StyleService;
import daily.admin.style.vo.StyleVO;
import daily.client.member.vo.MemberVO;
import daily.client.reserve.vo.ReserveVo;
import daily.common.page.Paging;

@Controller
@RequestMapping(value = "/admin")
public class AdminReservationController {
	private Logger log = LoggerFactory.getLogger(AdminReservationController.class);

	@Autowired
	private AdminReservationService adminReservationService;

	@Autowired
	private DesignerService designerService;

	@Autowired
	private AdminMemberService AdminmemberService;

	@Autowired
	private StyleService styleService;

	// 예약내역 리스트출력
	@RequestMapping(value = "/reservation/adminReservationList.do")
	public ModelAndView reservationList() {
		log.info("reservationList 호출완료");

		ModelAndView mav = new ModelAndView();

		List<ReserveVo> reservationList = adminReservationService.reservationList();
		List<DesignerVO> designerList = designerService.designerAjaxList(1);

		mav.addObject("desList", designerList);
		mav.addObject("restList", reservationList);
		mav.setViewName("admin/reservation/reservationList");

		return mav;
	}

	// 예약상세보기
	@RequestMapping(value = "/reservation/reservationDetailForm.do")
	public ModelAndView reservationDetailForm(ReserveVo rvo1) {
		log.info("reservationDeatilForm 호출");

		ModelAndView mav = new ModelAndView();
		//회원상세보기
		MemberVO mvo = AdminmemberService.memberDetailForm(rvo1.getM_id());
		//예약상세보기
		ReserveVo rvo = adminReservationService.reservationDetail(rvo1.getRest_num());
		//시술이름리스트
		List<StyleVO> svoList = styleService.stylingnameList(rvo1.getRest_num());

		//이전예약리스트
		List<ReserveVo> resultList = adminReservationService.resultList(rvo1);

		if (rvo != null) {
			mav.addObject("resultList", resultList);
			mav.addObject("nameList", svoList);
			mav.addObject("reservation", rvo);
			mav.addObject("member", mvo);
			mav.setViewName("admin/reservation/pop/adminReservationDetail_pop");
			return mav;
		}

		return mav;
	}

	// 날짜선택시마다 리스트 동적으로 변경
	@RequestMapping(value = "/reservation/dateList.do", method = RequestMethod.POST)
	@ResponseBody
	public List<ReserveVo> dateList(@ModelAttribute ReserveVo rvo) {

		log.info("dateList 호출완료");

		return adminReservationService.dateList(rvo);

	}

	// 예약상태값 수정
	@RequestMapping(value = "/reservation/updateReservation.do", method = RequestMethod.POST)
	@ResponseBody
	public int updateReservation(ReserveVo rvo) {

		log.info("updateReservation 호출완료");
		
		//예약 상태를 변경하는 메소드
		int result = adminReservationService.updateReservation(rvo);

		return result;

	}

	// 이전시술내역 상세보기
	@RequestMapping(value = "/reservation/detailLastReservation.do", method = RequestMethod.POST)
	@ResponseBody
	public List<StyleVO> detailLastReservation(int rest_num) {

		log.info("detailLastReservation 호출완료");

		List<StyleVO> styleList = styleService.stylingnameList(rest_num);

		return styleList;

	}

	// 예약완료(시술완료)리스트출력
	@RequestMapping(value = "/reservation/resultReservationList.do")
	public String resultReservationList(ReserveVo rvo, Model model) {
		log.info("resultReservationList 호출완료");

		// 페이지세팅 - ReserveVO 는 CommonVO 를 상속하고있음
		Paging.setPage(rvo);

		rvo.setRest_state(2);

		// 전체 레코드수 구하기
		int total = adminReservationService.searchListCnt(rvo);
		log.info(total + "<<레코드수");

		List<ReserveVo> resultList = adminReservationService.resultSearchList(rvo);

		model.addAttribute("data", rvo);
		model.addAttribute("total", total);
		model.addAttribute("resultList", resultList);

		return "admin/reservation/adminReservationResultList";
	}

	// 시술완료 상세보기 출력
	@RequestMapping(value = "/reservation/resultReservationDetail.do")
	public String resultReservationDetail(int rest_num, String m_id, Model model) {
		log.info("resultReservationDetail 호출완료");
		
		//예약상세보기
		ReserveVo resultDetail = adminReservationService.reservationDetail(rest_num);
		//시술이름리스트
		List<StyleVO> styleList = styleService.stylingnameList(rest_num);
		//회원상세보기
		MemberVO mvo = AdminmemberService.memberDetailForm(m_id);
		
		model.addAttribute("reservation", resultDetail);
		model.addAttribute("nameList", styleList);
		model.addAttribute("member", mvo);

		return "admin/reservation/pop/resultReservationDetail_pop";
	}

	// 예약 취소내역 리스트 출력
	@RequestMapping(value = "/reservation/reservationCancleList.do")
	public String reservationCancleList(ReserveVo rvo, Model model) {
		log.info("reservationCancleList 호출완료");

		// 페이지세팅 - ReserveVO 는 CommonVO 를 상속하고있음
		Paging.setPage(rvo);

		rvo.setRest_state(0);

		// 전체 레코드수 구하기
		int total = adminReservationService.searchListCnt(rvo);
		log.info(total + "<<레코드수");
		
		//취소내역리스트
		List<ReserveVo> cancleList = adminReservationService.reservationCancleList(rvo);

		model.addAttribute("data", rvo);
		model.addAttribute("total", total);
		model.addAttribute("cancleList", cancleList);

		return "admin/reservation/adminReservationCancleList";
	}
}
