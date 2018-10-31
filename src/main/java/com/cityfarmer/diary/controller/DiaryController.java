package com.cityfarmer.diary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.cityfarmer.diary.service.DiaryService;
import com.cityfarmer.repository.domain.diary.DiaryBoard;

@Controller
@RequestMapping("/diary")
public class DiaryController {

	@Autowired
	public DiaryService drservice;
	
	@RequestMapping("/diarylist.cf")
	public void list(Model model) throws Exception {
		model.addAttribute("list", drservice.list());
	}
	
	@RequestMapping("/diarywriterForm.cf") // value 속성을 사용
	public void writerForm() throws Exception {}
	
	@RequestMapping("/write.cf")
	public String write(DiaryBoard board) throws Exception {		
		board.setWriter("aaa");
		drservice.write(board); 		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "diarylist.cf";
	}
}
	
