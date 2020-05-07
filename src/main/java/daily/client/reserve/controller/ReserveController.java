package daily.client.reserve.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.designer.controller.DesignerController;
import daily.admin.designer.service.DesignerService;
import daily.admin.designer.vo.DesignerVO;
import daily.admin.style.service.StyleService;
import daily.admin.style.vo.StyleVO;
import daily.client.reserve.service.ReserveService;
import daily.client.reserve.vo.ReserveVo;
import daily.client.reservedetail.service.ReserveDetailService;

@Controller
@RequestMapping(value = "/reserve")
public class ReserveController {
	// view에서 controller로 service에 있는 기능 호출 - dao를 통해 DB조작
	
	private Logger log = LoggerFactory.getLogger(DesignerController.class);
	
	@Autowired
	private DesignerService designerService;
	
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private StyleService styleService;
	
	@Autowired 
	private ReserveDetailService reserveDetailService;
	
	// 01. 지점선택) [place > date] 왕십리 본점 선택 후 시술 일자 선택으로
	@RequestMapping(value = "/reserveSelectDate")
	public String reserveSelectDate(HttpSession session, HttpServletRequest request) {
		log.info("지점선택) 왕십리 본점 session 저장 완료");
		session.setAttribute("place", "왕십리 본점");
		
		log.info("지점선택) reserveSelectDate.do 호출 완료");
		return "client/reserve/reserveSelectDate";
	}
	
	// 02. 시술 일자) [date]  
	@RequestMapping(value = "/reserveSelectTime.do", method = RequestMethod.POST)
	@ResponseBody
	public List<ReserveVo> selectTime(@ModelAttribute ReserveVo rvo){ 
		log.info("(동적으로 버튼 생성");
		return reserveService.selectTime(rvo);
	}
	
	// 02. 시술 일자 back) 매장 선택으로 돌아갈 때 세션값 초기화
	@RequestMapping(value = "/backToSelectPlace")
	public String backToSelectPlace(HttpSession session) {
		log.info("이전단계) 매장 session 초기화");
		session.setAttribute("place", "(매장)입력 대기 중");
		session.setAttribute("date", "(시술 일시)입력 대기 중");
		session.setAttribute("designer", "(디자이너)입력 대기 중");
		session.setAttribute("sergery", "(시술)입력 대기 중");
		
		log.info("이전단계) reserveSelectPlace.do 호출 완료");
		return "client/reserve/reserveSelectPlace";
	}
	
	// 03. 디자이너) [date > designer] 디자이너 선택 이동 시 디자이너 목록 노출
	@RequestMapping(value = "/reserveSelectDesigner", method = RequestMethod.GET)
	public ModelAndView reserveSelectDesigner(@ModelAttribute ReserveVo rvo , HttpSession session) {
		session.setAttribute("date", "(시술 일시)임시 적용값"); 
		session.getAttribute("place");
		
		System.out.println(rvo.getRest_hairdate());
		System.out.println(rvo.getRest_time());
		
		ModelAndView mav = new ModelAndView();
		List<DesignerVO> desList = designerService.stylingDesigner(rvo);
		
		log.info("디자이너) 디자이너 목록 노출");
		mav.addObject("designerList", desList);
		mav.addObject("data",rvo);
		
		log.info("디자이너) reserveSelectDesigner.do 호출 완료");
		mav.setViewName("client/reserve/reserveSelectDesigner");
		
		return mav;
	}
	
	// 03. 디자이너) [designer] 디자이너 클릭 시 해당 디자이너 테이블 값 받아오기
	@RequestMapping(value = "/clickDesigner", method = RequestMethod.GET)
	public ModelAndView clickDesigner(@ModelAttribute DesignerVO dvo) {
		ModelAndView mav = new ModelAndView();
		DesignerVO designerVO = new DesignerVO();
		
		log.info("디자이너) 클릭한 디자이너 key값 전달 - ");
		designerVO = designerService.designerDetail(dvo.getDes_num());
		
		log.info("디자이너) reserveSelectDesigner.do 호출 완료");
		return mav;
	}
	
	// 03. 디자이너 back) 시술 일자 선택으로 돌아갈 때 세션값 초기화
	@RequestMapping(value = "/backToSelectDate")
	public String backToSelectDate(HttpSession session) {
		log.info("이전단계) 시술 일시 session 초기화");
		session.setAttribute("date", "(시술 일시)입력 대기 중");
		
		log.info("이전단계) reserveSelectDate.do 호출 완료");
		return "client/reserve/reserveSelectDate";
	}
	
	// 시술 선택으로 이동
	@RequestMapping(value = "/reserveSelectSergery.do", method = RequestMethod.POST)
	public String reserveSelectSergery(ReserveVo rvo , Model model) {
		List<StyleVO> styleList = styleService.stylingList(rvo.getDes_num());
		DesignerVO dvo = designerService.designerDetail(rvo.getDes_num());
		
		model.addAttribute("desname",dvo);
		model.addAttribute("styleList",styleList);
		model.addAttribute("data",rvo);
		
		return "client/reserve/reserveSelectSergery";
	}
	
	// 00. 결제하기로 이동
	@RequestMapping(value = "/reservePayment.do", method = RequestMethod.POST)
	public String reservePayment(@ModelAttribute ReserveVo rvo, Model model, @RequestParam("holy")String style_number) {
		
		List<StyleVO> styleList = styleService.stylingList(rvo.getDes_num());
		DesignerVO dvo = designerService.designerDetail(rvo.getDes_num());
		
		model.addAttribute("number",style_number);
		model.addAttribute("desname",dvo);
		model.addAttribute("styleList",styleList);
		model.addAttribute("data",rvo);
		
		return "client/reserve/payment";
	}
	
	// 최종단계 결제하기 -> DB에 인서트
	@RequestMapping(value = "/reserveInsert.do",method = RequestMethod.POST)
	public String insertReservation(@ModelAttribute ReserveVo rvo,@RequestParam("style_number")List<String> style_number){
			
		//예약테이블에 인서트
		int result = reserveService.insertReservation(rvo);
		
		//예약테이블에 인서트가 성공하면 예약상세테이블에 인서트
		if(result == 1 ) {
			for(String i : style_number) {
				reserveDetailService.insertReservationDetail(Integer.parseInt(i));
			}
			return "client/reserve/paymentFinal";
		}else {
			return "client/reserve/payment";
		}
				
	}
	
}
