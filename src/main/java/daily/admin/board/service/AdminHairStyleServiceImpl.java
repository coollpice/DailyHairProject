package daily.admin.board.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import daily.admin.board.dao.AdminHairStyleDAO;
import daily.admin.board.vo.AdminHairStyleVO;
import daily.common.util.FileUploadUtil;

@Service
public class AdminHairStyleServiceImpl implements AdminHairStyleService {

	@Autowired
	AdminHairStyleDAO hairStyleDao;
	
	@Override
	public List<AdminHairStyleVO> hairStylelist(AdminHairStyleVO hsvo) {
		return hairStyleDao.hairStylelist(hsvo);
	}

	@Override
	public AdminHairStyleVO hairStyledetail(int hg_num) {
		return hairStyleDao.hairStyledetail(hg_num);
	}
	
	@Override
	public int hairStyleupdate(AdminHairStyleVO hsvo, HttpServletRequest request) throws IOException {
		/* 이미지파일 수정 */
		/* 썸네일 이미지 변경 */
		if (!hsvo.getUploadFile().isEmpty()) { // 이미지가 있을때
			FileUploadUtil.fileDelete(hsvo.getHs_thumb(), request); // 기존 파일 삭제
			String hg_thumb = FileUploadUtil.fileUpload(hsvo.getUploadFile(), request, "HairStyle"); // 새로운파일 업로드
			hsvo.setHs_thumb(hg_thumb);
		} else { // 이미지가 없을때
			hsvo.setHs_thumb("400");// 400=쿼리에서 구분할 값
		}
		/* 상세이미지 변경 */
		// 상세이미지1
		if (!hsvo.getUploadFile2().isEmpty()) {
			if (!hsvo.getHs_img1().isEmpty()) { // 이미지가 있으면 파일 삭제
				FileUploadUtil.fileDelete(hsvo.getHs_img1(), request);
			}
			String hs_img1 = FileUploadUtil.fileUpload(hsvo.getUploadFile2(), request, "HairStyle"); // 새로운 파일 업로드
			hsvo.setHs_img1(hs_img1);
		} else { // 이미지가 없으면
			hsvo.setHs_img1("400"); // 400=쿼리에서 구분할 값
		}
		// 상세이미지2
		if (!hsvo.getUploadFile3().isEmpty()) {
			if (!hsvo.getHs_img2().isEmpty()) { // 이미지가 있으면 파일 삭제
				FileUploadUtil.fileDelete(hsvo.getHs_img2(), request);
			}
			String hs_img2 = FileUploadUtil.fileUpload(hsvo.getUploadFile3(), request, "HairStyle"); // 새로운 파일 업로드
			hsvo.setHs_img2(hs_img2);
		} else { // 이미지가 없으면
			hsvo.setHs_img2("400"); // 400=쿼리에서 구분할 값
		}
		// 상세이미지3
		if (!hsvo.getUploadFile4().isEmpty()) {
			if (!hsvo.getHs_img3().isEmpty()) { // 이미지가 있으면 파일 삭제
				FileUploadUtil.fileDelete(hsvo.getHs_img3(), request);
			}
			String hs_img3 = FileUploadUtil.fileUpload(hsvo.getUploadFile4(), request, "HairStyle"); // 새로운 파일 업로드
			hsvo.setHs_img3(hs_img3);
		} else { // 이미지가 없으면
			hsvo.setHs_img3("400"); // 400=쿼리에서 구분할 값
		}
		// 상세이미지4
		if (!hsvo.getUploadFile5().isEmpty()) {
			if (!hsvo.getHs_img4().isEmpty()) { // 이미지가 있으면 파일 삭제
				FileUploadUtil.fileDelete(hsvo.getHs_img4(), request);
			}
			String hs_img4 = FileUploadUtil.fileUpload(hsvo.getUploadFile5(), request, "HairStyle"); // 새로운 파일 업로드
			hsvo.setHs_img4(hs_img4);
		} else { // 이미지가 없으면
			hsvo.setHs_img4("400"); // 400=쿼리에서 구분할 값
		}

		return hairStyleDao.hairStyleupdate(hsvo);
	}

	@Override
	public int hairStyleinsert(AdminHairStyleVO hsvo, HttpServletRequest request) throws IOException {

		//파일업로드. (파일이 없으면 업로드되지 않고 null반환)
		String hs_thumb = FileUploadUtil.fileUpload(hsvo.getUploadFile(), request, "HairStyle");
		hsvo.setHs_thumb(hs_thumb);

		String hs_img1 = FileUploadUtil.fileUpload(hsvo.getUploadFile2(), request, "HairStyle");
		hsvo.setHs_img1(hs_img1);

		String hs_img2 = FileUploadUtil.fileUpload(hsvo.getUploadFile3(), request, "HairStyle");
		hsvo.setHs_img2(hs_img2);
		
		String hs_img3 = FileUploadUtil.fileUpload(hsvo.getUploadFile4(), request, "HairStyle");
		hsvo.setHs_img3(hs_img3);
		
		String hs_img4 = FileUploadUtil.fileUpload(hsvo.getUploadFile5(), request, "HairStyle");
		hsvo.setHs_img4(hs_img4);
		
		//파일 유무에 따른 쿼리처리를 위해 임의의 값 넣어주기
		if (hsvo.getHs_img1() == null) {
			hsvo.setHs_img1("400");
		}
		if (hsvo.getHs_img2() == null) {
			hsvo.setHs_img2("400");
		}
		if (hsvo.getHs_img3() == null) {
			hsvo.setHs_img3("400");
		}
		if (hsvo.getHs_img4() == null) {
			hsvo.setHs_img4("400");
		}
		return hairStyleDao.hairStyleinsert(hsvo);
	}

	@Override
	public int hairStyledelete(AdminHairStyleVO hsvo, HttpServletRequest request) throws IOException {
		FileUploadUtil.fileDelete(hsvo.getHs_thumb(), request);
		if (!hsvo.getHs_img1().isEmpty()) {
			FileUploadUtil.fileDelete(hsvo.getHs_img1(), request);
		}
		if (!hsvo.getHs_img2().isEmpty()) {
			FileUploadUtil.fileDelete(hsvo.getHs_img2(), request);
		}
		if (!hsvo.getHs_img3().isEmpty()) {
			FileUploadUtil.fileDelete(hsvo.getHs_img3(), request);
		}
		if (!hsvo.getHs_img4().isEmpty()) {
			FileUploadUtil.fileDelete(hsvo.getHs_img4(), request);
		}
		return hairStyleDao.hairStyledelete(hsvo.getHs_num());
	}

	@Override
	public int boardListCnt(AdminHairStyleVO hsvo) {
		return hairStyleDao.hairStyleCnt(hsvo);
	}

	@Override
	public List<AdminHairStyleVO> categoryList(int hs_category) {
		return hairStyleDao.categoryList(hs_category);
	}

}
