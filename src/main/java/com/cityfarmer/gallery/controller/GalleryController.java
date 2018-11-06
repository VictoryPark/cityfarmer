package com.cityfarmer.gallery.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.cityfarmer.gallery.service.GalleryService;
import com.cityfarmer.repository.domain.gallery.GFormVO;
import com.cityfarmer.repository.domain.gallery.GalleryBoard;
import com.cityfarmer.repository.domain.gallery.GalleryComment;
import com.cityfarmer.repository.domain.gallery.GalleryFile;
import com.cityfarmer.repository.domain.gallery.RecVO;

@Controller
@RequestMapping("/gallery")
public class GalleryController {

	
	@Autowired
	public GalleryService gaService;
	
	//갤러리 조회
	@RequestMapping("/gallerylist1.cf")
	public void list(Model model, GalleryBoard galleryboard,@RequestParam(value="pageNo", defaultValue="1")int pageNo) throws Exception {

		Map<String,Object> map = gaService.list(pageNo);
		model.addAttribute("map",map);
	}
	
	//등록 폼
	@RequestMapping("/gallerywrite.cf")
	public void writeForm() throws Exception {
	}
	
	//등록
	@RequestMapping("/write.cf")
	public String write(GFormVO form,GalleryBoard galleryboard, GalleryFile file) throws Exception {
		
		System.out.println(form.getGaTitle());
		System.out.println(form.getGaContent());
		System.out.println(form.getWriter());
		galleryboard.setGaTitle(form.getGaTitle());
		galleryboard.setGaContent(form.getGaContent());
		galleryboard.setWriter(form.getWriter());
		file.setGafOriName(form.getOriName());
		file.setGafSysName(form.getSysName());
		file.setGafPath(form.getPath());
		file.setGafSize(form.getSize());
		
		gaService.write(galleryboard, file);
		
		return "redirect:gallerylist1.cf";
			}
	
	@RequestMapping("/gallerydetail.cf")
	public void detail(int no, Model model) throws Exception {
		model.addAttribute("map", gaService.detail(no));
		
	}
	@RequestMapping("/gallerydelete.cf")
	public String delete(int no) {
		gaService.delete(no);
		return "redirect:gallerylist1.cf";
	}
	
	@RequestMapping("/galleryupdate.cf")
	public void updateForm(int no, Model model) throws Exception {
		model.addAttribute("b", gaService.updateForm(no));
	}
	
	
	@RequestMapping("/update.cf")
	public String update(GalleryBoard galleryboard) throws Exception {
		gaService.update(galleryboard);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "gallerylist1.cf";
	}
	
//------------------------추천---------------------------------------
	@RequestMapping("/insertRec.cf")
	@ResponseBody
	public int insertRec(RecVO recVO, @RequestParam("gaNo")int gaNo) {
		gaService.insertRec(recVO);
		gaService.updateRec(gaNo);
		return gaService.recCount(recVO);
	}
	@RequestMapping("/deleteRec.cf")
	@ResponseBody
	public int deleteRec(RecVO recVO, @RequestParam("gaNo")int gaNo) {
		gaService.cancelRec(gaNo);
		gaService.deleteRec(recVO);;
		return gaService.recCount(recVO);
	}
	@RequestMapping("/rec.cf")
	@ResponseBody
	public int rec(int gaNo) {
		return gaService.rec(gaNo);
	}
	@RequestMapping("/recount.cf")
	@ResponseBody
	public int recount(RecVO recVO) {
		return gaService.recCount(recVO);
	}
	
	
//--------------------------------------------------------------
	@PostMapping("/uploadfile.cf")
	@ResponseBody
	public GalleryFile uploadFile(@RequestParam("file") List<MultipartFile> attach, GalleryFile gaFile) throws IllegalStateException, IOException {
		String uploadPath = "/app/upload";
//		String uploadPath = "/app/upload";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String datePath = sdf.format(new Date());
		
		String newName = UUID.randomUUID().toString();
		newName = newName.replace("-", "");
		
		String fileExtension ="";
		String fileSysName = "";

		System.out.println(attach);
		
		for(MultipartFile file : attach) {
			if(file.isEmpty()==true) continue;
			fileExtension = getExtension(file.getOriginalFilename());
			fileSysName = newName + "." + fileExtension;
			System.out.println(uploadPath + datePath + "/"+fileSysName);
			
			gaFile.setGafOriName(file.getOriginalFilename());
			gaFile.setGafSysName(fileSysName);
			gaFile.setGafPath(uploadPath + datePath);
			gaFile.setGafSize(file.getSize());
			
			File img = new File(uploadPath + datePath, fileSysName);
			
			if(img.exists() == false) {
				img.mkdirs();
			}
			file.transferTo(img);
			//service.uploadFile(ef);
			gaFile.setUrl("http://localhost:8000"+ uploadPath + datePath +"/"+ fileSysName);

		}
		//source="org.eclipse.jst.jee.server:cityFarmer"
		return gaFile;
	}
	
	 private static String getExtension(String fileName) {
        int dotPosition = fileName.lastIndexOf('.');
        
        if (dotPosition != -1 && fileName.length() - 1 > dotPosition) {
            return fileName.substring(dotPosition + 1);
        } else {
            return "";
        }
	 }
	 
	 private static String getParentUrl(String fileUrl) {
		 int dotPosi = fileUrl.lastIndexOf('/');
		 
		 if(dotPosi != -1 && fileUrl.length() -1 > dotPosi) {
			 return fileUrl.substring(0,dotPosi);
		 } else {
			 return "";
		 }
	 }
	 //----------------------------------------------------------------
	 	@PostMapping("/comment/list.cf")
		@ResponseBody
		public List<GalleryComment> listComment(@RequestParam("gano")int gaNo) throws ParseException {
			return convertDate(gaService.listComment(gaNo));
		}

		@PostMapping("/comment/write.cf")
		@ResponseBody
		public List<GalleryComment> writeComment(GalleryComment comment) throws ParseException {
			return convertDate(gaService.writeComment(comment));
		}
		@PostMapping("/comment/delete.cf")
		@ResponseBody
		public List<GalleryComment> deleteComment(GalleryComment comment) throws ParseException {
			return convertDate(gaService.deleteComment(comment));
		}//deleteComment
		
		
		//--------------------------------------------------------------------------
		private List<GalleryComment> convertDate(List<GalleryComment> list) throws ParseException {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			for(GalleryComment co : list) {
				String date = sdf.format(co.getGacRegDate());
				co.setRegDateString(date);
			}
			return list;
		}
	
	
}
