package daily.client.reserve.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import daily.client.reserve.vo.ReserveVo;

@Repository
public class ReserveDaoImpl implements ReserveDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ReserveVo> selectTime(ReserveVo rvo) {
		return sqlSession.selectList("selectTime",rvo);
	}
	
	//예약하기
	@Override
	public int insertReservation(ReserveVo rvo) {
		return sqlSession.insert("insertReservation",rvo);
	}

	@Override
	public List<ReserveVo> myreservationList(String m_id) {
		return sqlSession.selectList("myreservationList", m_id);
	}

	@Override
	public int confirmReservationCnt(String m_id) {
		return sqlSession.selectOne("confirmReservationCnt",m_id);
	}

	@Override
	public ReserveVo myReservationDetail(int rest_num) {
		return sqlSession.selectOne("myReservationDetail", rest_num);
	}

}
