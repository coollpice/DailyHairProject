package daily.client.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import daily.client.member.service.MailService;
import daily.client.member.service.MemberService;
import daily.client.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private MemberService service;
	
	@Inject
	private BCryptPasswordEncoder pwencoder;
	
	@Autowired
	private MailService mailService;
	
	//이용약관
	@RequestMapping(value = "/clause.do", method = RequestMethod.GET)
	public String getClause() throws Exception {
		logger.info("clause.do 호출 성공");
		
		return "member/join/clause";
	}
	
	//회원가입
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String getJoin() throws Exception {
		logger.info("join.do 호출 성공");
		
		return "member/join/join";
	}

	//회원가입 처리
	   @RequestMapping(value = "/join.do", method = RequestMethod.POST)
	   public String postJoin(@ModelAttribute MemberVO vo ,  HttpServletRequest request) throws Exception {
	      logger.info("회원가입 처리 성공");

	      int result = service.idChk(vo);
	      try {
	         if(result == 1) {
	            return "member/join/join";
	         }else if(result == 0) {
	            String secPwd = pwencoder.encode(vo.getM_pwd());
	            vo.setM_pwd(secPwd);

	            service.join(vo);
	            mailService.mailSendWithUserKey(vo.getM_email(), vo.getM_id(), request);
	         }
	         //입력된 아이디가 존재한다면 다시 회원가입 페이지로 돌아간다
	      } catch(Exception e) {
	         throw new RuntimeException();
	      }
	      return "member/join/joinSuccess";
	   }
	   
	 //이메일인증시 사용
	   @RequestMapping(value = "/updateState.do")
	   public String updateState(@RequestParam String m_id) {
		   
		   service.emailupdateState(m_id);
		   
		   return "member/login/login";
	   }
	
	//아이디 중복체크
	@RequestMapping(value = "/idChk.do", method = RequestMethod.POST)
	@ResponseBody
	public int idChk(MemberVO vo) throws Exception {
		logger.info("아이디 중복체크 성공");
		
		int result = service.idChk(vo);
		
		return result;
	}
	
	//이메일 중복체크
	@RequestMapping(value = "/mailChk.do", method = RequestMethod.POST)
	@ResponseBody
	public int mailChk(MemberVO vo) throws Exception {
		logger.info("이메일 중복체크 성공");
		
		int result = service.mailChk(vo);
		
		return result;
	}
	


	
}
