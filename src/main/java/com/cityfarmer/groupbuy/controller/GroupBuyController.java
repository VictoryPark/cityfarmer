package com.cityfarmer.groupbuy.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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

import com.cityfarmer.common.PageResult;
import com.cityfarmer.groupbuy.service.GroupBuyService;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyBoard;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyComment;

@Controller
@RequestMapping("/groupbuy")
public class GroupBuyController {
	
	@Autowired
	private GroupBuyService service;
	
	@RequestMapping("/cf_main.cf")
	public void mainForm() {}
	
	@RequestMapping("/gb_board.cf")
	public void list(Model model, @RequestParam(value="pageNo", defaultValue="1") int pageNo) {
		GroupBuyBoard gbb = new GroupBuyBoard();
		gbb.setPageNo(pageNo);
		
		List<GroupBuyBoard> gbList =  service.list(gbb);
		
		List<Integer> cmtList = new ArrayList<>();
		
		for(int i=0; i<gbList.size(); i++) {
			cmtList.add(service.countComment(gbList.get(i).getGbNo()));
		}
		
//		Date today = new Date();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm");
//		model.addAttribute("today", sdf.format(today));
		
		model.addAttribute("comment", cmtList);
		model.addAttribute("list", service.list(gbb));
		model.addAttribute("pageResult", new PageResult(pageNo, service.listCount()));
	}
	
	// 게시글 상세
	@RequestMapping("/gb_detail.cf")
	public void detail(Model model, int no) {
		model.addAttribute("gbb", service.detail(no));
	}
	
	// 게시글 수정폼 이동
	@RequestMapping("/gb_updateForm.cf")
	public void updateForm(Model model, int no) {
		model.addAttribute("gbb", service.detail(no));
	}
	
	// 게시글 수정
	@RequestMapping("/gb_update.cf")
	public String update(GroupBuyBoard gbb) {
		String[] endArr = gbb.getGbEndDay().split(" "); // 2018-10-29 06:29 PM
		
		gbb.setGbEndDay(endArr[0]);
		
		String[] endTimeArr = endArr[1].split(":"); // 18:34 --> 18 split  34
		if(endArr[2].equals("PM")) {
			int hours = Integer.parseInt(endTimeArr[0]);
			if(hours==12) { 
				gbb.setGbEndTime(endArr[1]);
			} else {
				gbb.setGbEndTime(String.valueOf(hours + 12) + ":" + endTimeArr[1]);
			}
		} else {
			gbb.setGbEndTime(endArr[1]);
		}
		
		service.update(gbb);
		return "redirect:gb_board.cf";
	}
	
	// 게시글 삭제
	@RequestMapping("/gb_delete.cf")
	public String delete(int no) {
		service.delete(no);
		return "redirect:gb_board.cf";
	}
	
	
	// 게시글 작성폼 이동
	@RequestMapping("/gb_writeForm.cf")
	public void writeForm() {}
	
	//	게시글 작성
	@RequestMapping("/gb_write.cf")
	public String write(GroupBuyBoard gbb) {
		String[] endArr = gbb.getGbEndDay().split(" "); // 2018-10-29 06:29 PM
		
		gbb.setGbEndDay(endArr[0]);
		
		String[] endTimeArr = endArr[1].split(":"); // 18:34 --> 18 split  34
		if(endArr[2].equals("PM")) {
			int hours = Integer.parseInt(endTimeArr[0]);
			if(hours==12) { 
				gbb.setGbEndTime(endArr[1]);
			} else {
				gbb.setGbEndTime(String.valueOf(hours + 12) + ":" + endTimeArr[1]);
			}
		} else {
			gbb.setGbEndTime(endArr[1]);
		}
		
		Date start = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String[] startArr = sdf.format(start).split(" ");
		
		gbb.setGbStartDay(startArr[0]);
		gbb.setGbStartTime(startArr[1]);
		
		service.write(gbb);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "gb_board.cf";
	}
	
	// 댓글 리스트
	@RequestMapping("/gb_commentList.cf")
	@ResponseBody
	public List<GroupBuyComment> commentList(int no) {
		return service.commentList(no);
	}
	
	
	// 댓글 작성
	@RequestMapping("/gb_writeComment.cf")
	@ResponseBody
	public void writeComment(GroupBuyComment gbc) {
		service.writeComment(gbc);
	}
	
	// 댓글 삭제
	@RequestMapping("/gb_deleteComment.cf")
	@ResponseBody
	public void deleteComment(int cmtNo) {
		service.deleteComment(cmtNo);
	}
	
	// 댓글 수정
	@RequestMapping("/gb_updateComment.cf")
	@ResponseBody
	public void updateComment(GroupBuyComment gbc) {
		service.updateComment(gbc);
	}
	
	
	// 파일 미완성
	@PostMapping("/uploadfile.cf")
	@ResponseBody
	public String uploadFile(@RequestParam("file") List<MultipartFile> attach) throws IllegalStateException, IOException {
//		String uploadPath = "/app/tomcat-work/wtpwebapps/cityFarmer/img/groupbuy";
		String uploadPath = "/app/upload";
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
			
//			ef.setExfOriName(file.getOriginalFilename());
//			ef.setExfSysName(fileSysName);
//			ef.setExfPath(uploadPath + datePath);
//			ef.setExfSize(file.getSize());
			
			File img = new File(uploadPath + datePath, fileSysName);
			
			if(img.exists() == false) {
				img.mkdirs();
			}
			file.transferTo(img);
			//service.uploadFile(ef);
		}
		//source="org.eclipse.jst.jee.server:cityFarmer"
		return "http://localhost:8000"+ uploadPath + datePath +"/"+ fileSysName;
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
	 
	 
	
}
