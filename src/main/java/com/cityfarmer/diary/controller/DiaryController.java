package com.cityfarmer.diary.controller;

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
import com.cityfarmer.diary.service.DiaryService;
import com.cityfarmer.repository.domain.diary.DiaryBoard;
import com.cityfarmer.repository.domain.diary.DiaryComment;
import com.cityfarmer.repository.domain.diary.DiaryFile;
import com.cityfarmer.repository.domain.diary.drPage;
import com.cityfarmer.repository.domain.diary.drPageResult;

@Controller
@RequestMapping("/diary")
public class DiaryController {

	@Autowired
	public DiaryService drservice;
	private String keyword ="";
	private String searchType ="";
	
	private List<DiaryFile> fileList = new ArrayList<>();
	
	@RequestMapping("/diarylist.cf")
	public void list(Model model, @RequestParam(value="pageNo", defaultValue="1") int pageNo) throws Exception {
		drPage drpage = new drPage();
		drpage.setPageNo(pageNo);
		
		model.addAttribute("list", drservice.list(drpage));
		model.addAttribute("pageResult", new drPageResult(pageNo, drservice.count()));
	}
	
	@RequestMapping("/diarysearch.cf")
	public void search(Model model, DiaryBoard diary, @RequestParam(value="pageNo", defaultValue="1") int pageNo) {
		
		if(diary.getKeyword() != null && diary.getKeyword() != null) {
			keyword = diary.getKeyword();
			searchType = diary.getSearchType();
		} else {
			diary.setKeyword(keyword);
			diary.setSearchType(searchType);
		}
		
		diary.setPageNo(pageNo);
		
		List<DiaryBoard> drList = drservice.searchDiaryBoard(diary);
		
		model.addAttribute("list", drservice.searchDiaryBoard(diary));
		model.addAttribute("pageResult", new PageResult(diary.getPageNo(), drservice.searchDiaryCount(diary)));
	}
	
	@RequestMapping("/diarywriterForm.cf") // value 속성을 사용
	public void writerForm() throws Exception {}
	
	@RequestMapping("/writer.cf")
	public String writer(DiaryBoard board) throws Exception {			
		drservice.writer(board, fileList);
		fileList = new ArrayList<>();
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "diarylist.cf";
	}
	
	@RequestMapping("/diarydetail.cf")
	public void detail(int no, Model model) throws Exception {
		model.addAttribute("board", drservice.detail(no));
	}
	
	@RequestMapping("/diaryupdateForm.cf")
	public void updateForm(int no, Model model) throws Exception {
		model.addAttribute("board", drservice.updateForm(no));
	}
	
	@RequestMapping("/diaryupdate.cf")
	public String update(DiaryBoard board) throws Exception {
		System.out.println(board.getDrContent());
		drservice.update(board, fileList);
		fileList = new ArrayList<>();
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "diarylist.cf"; 
	}
	
	@RequestMapping("/diarydelete.cf")
	public String delete(int no) throws Exception {
		drservice.delete(no);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "diarylist.cf";
	}
	
// 댓글 부분
	
	// 댓글 리스트
	@RequestMapping("/diarycommentlist.cf")
	@ResponseBody
	public List<DiaryComment> commentList(int no) {
		return drservice.commentList(no);
	}
	
	// 댓글 작성
	@RequestMapping("/diarycommentwriter.cf")
	@ResponseBody
	public void writerComment(DiaryComment comment) throws Exception {
		drservice.writerComment(comment);
	}
	
	@RequestMapping("/diarydeletecomment.cf")
	@ResponseBody
	public void deleteComment(int drcNo) throws Exception {
		drservice.deleteDiaryComment(drcNo);
	}
	
	@RequestMapping("/diaryupdatecomment.cf")
	@ResponseBody
	public void updateComment(DiaryComment comment) throws Exception {
		drservice.updateDiaryComment(comment);
	}
	
	@PostMapping("/diaryuploadfile.cf")
	@ResponseBody
	public DiaryFile uploadFile(@RequestParam("file") List<MultipartFile> attach) throws IllegalStateException, IOException {
		String uploadPath = "/app/upload";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String datePath = sdf.format(new Date());
		
		String newName = UUID.randomUUID().toString();
		newName = newName.replace("-", "");
		
		String fileExtension ="";
		String fileSysName = "";
		
		DiaryFile drFile = new DiaryFile();
		
		for(MultipartFile file : attach) {
			if(file.isEmpty() == true) continue;
			fileExtension = getExtension(file.getOriginalFilename());
			
			System.out.println("원본파일명" + file.getOriginalFilename());
			System.out.println("확장자:" + fileExtension);
			
			fileSysName = newName + "." + fileExtension;
			
			drFile.setDrfOriName(file.getOriginalFilename());
			drFile.setDrfSysName(fileSysName);
			drFile.setDrfPath(uploadPath + datePath);
			drFile.setDrfSize(file.getSize());
			
			File img = new File(uploadPath + datePath, fileSysName);
			
			if(img.exists() == false) {
				img.mkdirs();
			}
			file.transferTo(img);
//			drFile.setUrl("http://192.168.0.63:8000"+ uploadPath + datePath +"/"+ fileSysName);
			drFile.setUrl("http://localhost:8000"+ uploadPath + datePath +"/"+ fileSysName);
		}
		
		fileList.add(drFile);
		
		return drFile;
	}
	
	 private static String getExtension(String fileName) {
	        int dotPosition = fileName.lastIndexOf('.');
	        
	        if (dotPosition != -1 && fileName.length() - 1 > dotPosition) {
	            return fileName.substring(dotPosition + 1);
	        } else {
	            return "";
	        }
		 }
		 
}
	
