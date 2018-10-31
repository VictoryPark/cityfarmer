package com.cityfarmer.tip.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.cityfarmer.repository.domain.tip.TipBoard;
import com.cityfarmer.tip.service.TipService;

@Controller
@RequestMapping("/tip")
public class TipController {
	@Autowired
	public TipService service;
	//	Tip�۵��
	@RequestMapping("MainPage.cf")
	public void list(Model model) throws Exception{
		System.out.println("list: " + service.selectBoard());
		model.addAttribute("list", service.selectBoard());
		
	}
	@RequestMapping("/writeBoard.cf")
	public void wirteForm() throws Exception{
		
	}
	@RequestMapping("/write.cf")
	public String write(TipBoard tipboard) throws Exception{
		tipboard.setWriter("aaa");//�α����Ѿ��̵�� �ٲپ����
		
		service.insertBoard(tipboard);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "MainPage.cf";
		
	}
	@RequestMapping("/detailBoard.cf")
	public void detail(int no, Model model)throws Exception{
		System.out.println(no);
		model.addAttribute("tipBoard", service.selectBoardByNo(no));
	}
	

}
