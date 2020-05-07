package daily.admin.bi.dao;

import java.util.List;

import daily.admin.bi.vo.AdminBiVO;

public interface AdminBiDao {
	public List<AdminBiVO> list();

	public List<Integer> reservationCnt();

	public List<AdminBiVO> searchList(AdminBiVO biVO);
}
