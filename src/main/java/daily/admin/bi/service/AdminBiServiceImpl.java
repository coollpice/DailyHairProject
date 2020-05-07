package daily.admin.bi.service;


import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import daily.admin.bi.dao.AdminBiDao;
import daily.admin.bi.vo.AdminBiVO;

@Service
public class AdminBiServiceImpl implements AdminBiService{

	@Autowired
	AdminBiDao biDao;
	
	
	@Override
	public List<AdminBiVO> list() throws ParseException {
		List<AdminBiVO> result = biDao.list();
		return result;
	}


	@Override
	public List<Integer> reservationCnt() {
		return biDao.reservationCnt();
	}


	@Override
	public List<AdminBiVO> searchList(AdminBiVO biVO) {
		return biDao.searchList(biVO);
	}



}
