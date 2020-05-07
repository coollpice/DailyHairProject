package daily.client.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import daily.client.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	//마이바티스
	@Inject
	private SqlSession sql;

	//회원가입
	@Override
	public void join(MemberVO vo) throws Exception {
		sql.insert("join", vo);
	}
	
	//아이디 중복체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("idChk", vo);
		return result;
	}
	
	//이메일 중복체크
	@Override
	public int mailChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("mailChk", vo);
		return result;
	}
	
	//로그인
	@Override
	public MemberVO login(MemberVO lvo) {
		return (MemberVO)sql.selectOne("login", lvo);
	}
	
	//마이페이지 본인확인
	@Override
	public MemberVO mypage(MemberVO lvo) {
		return (MemberVO)sql.selectOne("mypage", lvo);
	}
	
	//회원정보 수정
	@Override
	public void memberUpdateDo(MemberVO vo) throws Exception {
		sql.update("memberUpdateDo", vo);
	}

	//회원 비활성화
	@Override
	public int clientUpdate(MemberVO mvo) {
		return sql.update("clientUpdate", mvo);
	}
	
	//예약 취소
	@Override
	public int cancleReservation(int  rest_num) {
		return sql.update("cancleReservation", rest_num);
	}

	//아이디 찾기
	@Override
	public MemberVO idFind(MemberVO vo) throws Exception {
		return sql.selectOne("idFind", vo);
	}

	//패스워드 찾기
	@Override
	public MemberVO pwFind(MemberVO pvo) {
		return (MemberVO)sql.selectOne("pwFind", pvo);
	}

	//패스워드 수정
	@Override
	public void pwModify(MemberVO vo) throws Exception {
		sql.update("pwModify", vo);
	}

	//이메일 인증시 사용
	@Override
	public int emailupdateState(String m_id) {
		return sql.update("emailupdateState",m_id);
	}
	
}
