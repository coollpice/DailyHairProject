package daily.admin.bi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.bi.vo.AdminBiVO;

@Repository
@Transactional
public class AdminBiDaoImpl implements AdminBiDao {

	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<AdminBiVO> list() {
		return sqlsession.selectList("WeekList");
	}

	@Override
	public List<Integer> reservationCnt() {
		return sqlsession.selectList("reservationCnt");
	}

	@Override
	public List<AdminBiVO> searchList(AdminBiVO biVO) {
		return sqlsession.selectList("searchList",biVO);
	}


}
