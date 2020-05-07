package daily.client.mypage.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.member.service.AdminMemberService;
import daily.admin.style.service.StyleService;
import daily.admin.style.vo.StyleVO;
import daily.client.member.service.MemberService;
import daily.client.member.vo.MemberVO;
import daily.client.reserve.service.ReserveService;
import daily.client.reserve.vo.ReserveVo;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {

	private Logger log = LoggerFactory.getLogger(MypageController.class);
	
	@Inject
	private MemberService service;
	
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private StyleService styleService;
	
	@Inject
	private BCryptPasswordEncoder pwencoder;
	
	//마이페이지
	@RequestMapping(value="/mypage.do", method = RequestMethod.GET)
	public String getMypage() throws Exception{
		log.info("mypage.do 호출");
		
		return "mypage/mypage";
	}
	
	//마이페이지 본인확인
	@RequestMapping(value = "/mypage.do",method = RequestMethod.POST)
	public ModelAndView postMypage(@ModelAttribute("MemberVO") MemberVO lvo, HttpSession session, HttpServletRequest request) {
		log.info("마이페이지 본인확인 처리 성공");
		
		ModelAndView mav = new ModelAndView();
		
		MemberVO vo = service.mypage(lvo);
		
		boolean passMatch = pwencoder.matches(lvo.getM_pwd(), vo.getM_pwd());
		
		if(vo != null && passMatch) {
			session.setAttribute("mypage", "사용자");
			mav.setViewName("mypage/mypage");
			return mav;
		}else{
			mav.addObject("msg","패스워드를 정확하게 입력 해주시길 바랍니다.");
			mav.setViewName("mypage/mypage");
			return mav;
		}	
		
	}
		
	//마이페이지 회원정보 수정창
	@RequestMapping(value = "/memberUpdate.do", method = RequestMethod.GET)
	public String memberUpdate() throws Exception {
		log.info("회원정보 수정창");
		
		return "mypage/memberUpdate";
	}
	
	//마이페이지 회원정보 수정 처리
	@RequestMapping(value = "/mymemberUpdate.do", method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute MemberVO vo, HttpSession session) throws Exception {
		log.info("회원정보 수정 성공");
		
		service.memberUpdateDo(vo);
		
		// 세션 초기화
		session.invalidate();
		
		return "client/main/main";
	}
	
	//계정 비활성화창
	@RequestMapping(value="/deactivation.do", method = RequestMethod.GET)
	public String getdeactivation() throws Exception{
		log.info("deactivation.do 호출 성공");
			
		return "mypage/deactivation";
	}
	
	//계정 비활성화 처리
	@RequestMapping(value = "/memberDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public int memberDelete(@ModelAttribute MemberVO mvo, HttpSession session) {
		log.info("계정 비활성화 성공");

		int reservationCnt = reserveService.confirmReservationCnt(mvo.getM_id());
		
		if(reservationCnt>0) {
			return 0;
		}else {
			 service.clientUpdate(mvo);
			 session.invalidate();
			 return 1;
		}
		
	}
	
	//예약 현황창
	@RequestMapping(value="/reserveState.do", method = RequestMethod.GET)
	public String reserveState(HttpSession session , Model model) throws Exception{
		log.info("reserveState.do 호출 성공");
		
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		String m_id = mvo.getM_id();
		
		List<ReserveVo> List = reserveService.myreservationList(m_id);
		
		model.addAttribute("myList", List);
		
		return "mypage/reserveState";
	}

	//예약현황 상세
	@RequestMapping(value = "/reservDetail.do", method = RequestMethod.GET)
	public String reservDetail(@RequestParam int rest_num, Model model, HttpSession session) {
	
	// 수정할 곳
	ReserveVo List = reserveService.myReservationDetail(rest_num);
	List<StyleVO> styleList = styleService.stylingnameList(rest_num);
	
	model.addAttribute("detail", List);
	model.addAttribute("styleList", styleList);
		
	return "mypage/reservDetail";
	}
	
	//에약 취소
		@RequestMapping(value = "/cancleReservation.do", method = RequestMethod.POST)
		@ResponseBody
		public int cancleReservation(@RequestParam int rest_num) {
			log.info("에약 취소 성공");

			int result = service.cancleReservation(rest_num);

			if (result == 1) {
				return 1;
			} else {
				return 0;
			}
			
		}
	
}
