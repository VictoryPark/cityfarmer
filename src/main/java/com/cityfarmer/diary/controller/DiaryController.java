package com.cityfarmer.diary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.cityfarmer.common.PageResult;
import com.cityfarmer.diary.service.DiaryService;
import com.cityfarmer.repository.domain.Page;
import com.cityfarmer.repository.domain.diary.DiaryBoard;
import com.cityfarmer.repository.domain.diary.drPageResult;

@Controller
@RequestMapping("/diary")
public class DiaryController {

	@Autowired
	public DiaryService drservice;
	
	@RequestMapping("/diarylist.cf")
	public void list(Model model, @RequestParam(value="pageNo", defaultValue="1") int pageNo) throws Exception {
		Page page = new Page();
		page.setPageNo(pageNo);
		
		model.addAttribute("list", drservice.list(page));
		model.addAttribute("pageResult", new drPageResult(pageNo, drservice.count()));
	}
	
	@RequestMapping("/diarywriterForm.cf") // value 속성을 사용
	public void writerForm() throws Exception {}
	
	@RequestMapping("/writer.cf")
	public String writer(DiaryBoard board) throws Exception {			
		drservice.writer(board); 		
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
		drservice.update(board);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "diarylist.cf"; 
	}
	
	@RequestMapping("/diarydelete.cf")
	public String delete(int no) throws Exception {
		drservice.delete(no);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "diarylist.cf";
	}
	
}
	
