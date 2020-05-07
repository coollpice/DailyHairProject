package daily.client.member.service;

import daily.client.member.vo.MemberVO;

public interface MemberService {

	//회원 가입
	public void join(MemberVO vo) throws Exception;
	
	//아이디 중복체크
	public int idChk(MemberVO vo) throws Exception;
	
	//이메일 중복체크
	public int mailChk(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO login(MemberVO lvo);
	
	//마이페이지 본인확인
	public MemberVO mypage(MemberVO lvo);
	
	//회원정보 수정
	public void memberUpdateDo(MemberVO vo) throws Exception;
	
	//회원 비활성화
	public int clientUpdate(MemberVO mvo);
	
	//예약 취소
	public int cancleReservation(int rest_num);
	
	//아이디 찾기
	public MemberVO idFind(MemberVO vo) throws Exception;

	//패스워드 찾기
	public MemberVO pwFind(MemberVO pvo);
	
	//패스워드 수정
	public void pwModify(MemberVO vo) throws Exception;
	
	//이메일인증시 사용
	public int emailupdateState(String m_id);
		
	
}
