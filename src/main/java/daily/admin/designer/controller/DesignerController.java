package daily.admin.designer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.designer.service.DesignerService;
import daily.admin.designer.vo.DesignerVO;
import daily.admin.reservation.service.AdminReservationService;
import daily.common.util.FileUploadUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "/admin")
public class DesignerController {
	private Logger log = LoggerFactory.getLogger(DesignerController.class);

	@Autowired
	private DesignerService designerService;
	
	@Autowired
	private AdminReservationService reservationService;

	// 디자이너 리스트 출력
	@RequestMapping(value = "/designer/designerList.do", method = RequestMethod.GET)
	public ModelAndView designerList() {

		log.info("designerList.do 호출완료");

		ModelAndView mav = new ModelAndView();

		List<DesignerVO> desList = designerService.designerList();

		mav.addObject("designerList", desList);
		mav.setViewName("admin/designer/designerList");
		return mav;
	}
	
	//디자이너 리스트 출력(선택시 변경)
	@RequestMapping(value = "/designer/desAjaxList.do", method = RequestMethod.POST)
	@ResponseBody
	public List<DesignerVO> designerAjaxList(int des_state){
		
		log.info("designerAjaxList 호출완료");
		return designerService.designerAjaxList(des_state);
		
	}

	// 디자이너 등록폼
	@RequestMapping(value = "/designer/designerJoinForm.do", method = RequestMethod.GET)
	public String designerInsertForm() {
		log.info("designerInsertForm 호출 성공");
		return "admin/designer/pop/designerJoin_pop";
	}

	// 디자이너 등록하기
	@RequestMapping(value = "/designer/designerJoin.do", method = RequestMethod.POST)
	@ResponseBody
	public String designerInsert(@ModelAttribute DesignerVO dvo ,HttpServletRequest request) throws IOException {
		log.info("designerInsert 호출 성공");

		String msg = "0";
		
		//첨부된파일이 있을경우 폴더생성후 저장
		if(dvo.getFile()!=null) {
			String des_file = FileUploadUtil.fileUpload(dvo.getFile(), request, "designer");
			dvo.setDes_file(des_file);
		}
		//첨부된파일이 있을경우 폴더생성후 저장
		if(dvo.getFile2()!=null) {
			String des_file2 = FileUploadUtil.fileUpload(dvo.getFile2(), request, "designer");
			dvo.setDes_image(des_file2);
		}
		int result = designerService.insertDesigner(dvo);
		
		if (result == 1) {
			msg = "1";
		} else {
			msg = "0";
		}
		return msg;
	}

	// 디자이너 정보 수정폼
	@RequestMapping(value = "/designer/designerUpdateForm.do", method = RequestMethod.GET)
	public ModelAndView designerUpdateForm(@ModelAttribute DesignerVO dvo) throws IOException {
		log.info("designerupdateForm 호출 성공" + dvo.getDes_num());

		ModelAndView mav = new ModelAndView();

		DesignerVO updateDesigner = new DesignerVO();
		updateDesigner = designerService.designerDetail(dvo.getDes_num());
		
		if (updateDesigner != null) {
			mav.addObject("des", updateDesigner);
			mav.setViewName("admin/designer/pop/designerModify_pop");
			return mav;
		} else {
			mav.addObject("msg", "에러에염");
			mav.setViewName("admin/designer/designerList");
			return mav;
		}
	}

	// 디자이너 정보 수정하기
	@RequestMapping(value = "/designer/designerUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String designerUpdate(@ModelAttribute DesignerVO dvo ,HttpServletRequest request) throws IOException {
		log.info("designerUpdate 호출 성공");
		String msg = "0";
		//수정할떄 파일이 변경되면 기존 파일은 삭제되고 새로운파일로 등록됨
		if(!dvo.getFile().isEmpty()) {
			if(!dvo.getDes_file().isEmpty()) {
				FileUploadUtil.fileDelete(dvo.getDes_file(), request);
			}
			String des_file = FileUploadUtil.fileUpload(dvo.getFile(), request, "designer");
			dvo.setDes_file(des_file);
		}
		
		//수정할떄 파일이 변경되면 기존 파일은 삭제되고 새로운파일로 등록됨
		if(!dvo.getFile2().isEmpty()) {
			if(!dvo.getDes_image().isEmpty()) {
				FileUploadUtil.fileDelete(dvo.getDes_image(), request);
			}
			String des_file2 = FileUploadUtil.fileUpload(dvo.getFile2(), request, "designer");
			dvo.setDes_image(des_file2);
		}
		//파일선택을 안했을시에는 전에있던 파일명으로 파일이름을 설정한다.
		//DB에는 파일이름이 스트링으로 들어감 다운로드시 파일이름으로 접근해서 다운로드받으므로 
		//파일 수정없이 내용만수정해도 전에 파일이름이 들어가기때문에 다운로드가능
		if(dvo.getFile().isEmpty()) {
			dvo.setDes_file(dvo.getDes_file());
		}
		
		if(dvo.getFile2().isEmpty()) {
			dvo.setDes_image(dvo.getDes_image());
		}
		
		int result = designerService.updateDesigner(dvo);
		
		if (result == 1) {
			msg = "1";
			return msg;
		} else {
			msg = "0";
			return msg;
		}

	}

	// 디자이너 비활성화하기
	@RequestMapping(value = "/designer/designerDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String designerDelete(@ModelAttribute DesignerVO dvo) {
		//비활성화 하기전에 현재 예약건이있는 디자이너인지 확인합니다
		int count = reservationService.cofirmReservation(dvo.getDes_num());	 
		
		if(count>0) {
			return "0";
		}else{
			designerService.deleteDesigner(dvo.getDes_num());
			return "1";
		}
	}

	// 디자이너 활성화 하기
	@RequestMapping(value = "/designer/designerOpen.do", method = RequestMethod.POST)
	@ResponseBody
	public String designerOpen(@ModelAttribute DesignerVO dvo) {

		String msg = "0";

		int result = designerService.openDesigner(dvo.getDes_num());

		if (result == 1) {
			msg = "1";
			return msg;
		} else {
			msg = "0";
			return msg;
		}
	}
	
	//첨부파일 다운로드
	  @RequestMapping(value = "/designer/download.do") 
	  public void fileDown(@ModelAttribute DesignerVO dvo, HttpServletResponse response, HttpServletRequest request) throws IOException {
		  log.info("fileDown 호출성공");
		  
	 DesignerVO down = designerService.designerDetail(dvo.getDes_num());
	 String downRoot = down.getDes_file(); 
	 
	 byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File(request.getSession().getServletContext().getRealPath("/uploadStorage/designer/")+downRoot));
	 
	 
	 response.setContentType("application/octet-stream");
	 response.setContentLength(fileByte.length);
	 response.setHeader("Content-Disposition","attachment; fileName=\""+URLEncoder.encode(downRoot,"UTF-8")+"\";");
	 response.getOutputStream().write(fileByte);
	 response.getOutputStream().flush();
	 response.getOutputStream().close();
	 }
	 
	  
	//이미지 파일 다운로드
	  @RequestMapping(value = "/designer/downloadImage.do") 
	  public void fileDownImage(@ModelAttribute DesignerVO dvo, HttpServletResponse response, HttpServletRequest request) throws IOException {
		  log.info("fileDownImage 호출성공");
		  
	 DesignerVO down = designerService.designerDetail(dvo.getDes_num());
	 String downImage = down.getDes_image();
	 
	 byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File(request.getSession().getServletContext().getRealPath("/uploadStorage/designer/")+downImage));
	 
	 
	 response.setContentType("application/octet-stream");
	 response.setContentLength(fileByte.length);
	 response.setHeader("Content-Disposition","attachment; fileName=\""+URLEncoder.encode(downImage,"UTF-8")+"\";");
	 response.getOutputStream().write(fileByte);
	 response.getOutputStream().flush();
	 response.getOutputStream().close();
	 }
	  
	 
}
