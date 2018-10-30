package com.cityfarmer.tip.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cityfarmer.tip.service.TipService;

@Controller
@RequestMapping("/tip")
public class TipController {
	@Autowired
	public TipService service;
	//	Tip±Ûµî·Ï
	@RequestMapping("MainPage.cf")
	public void list(Model model) throws Exception{
		System.out.println("list: " + service.selectBoard());
		model.addAttribute("list", service.selectBoard());
		
	}
	/*@RequestMapping("/wirteForm.cf")
	public void wirteForm() throws Exception{
		
	}*/
	/*@RequestMapping("/write.cf")
	public String write(TipBoard tipboard) throws Exception{
		service.insertBoard(tipboard);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.cf";
		
	}*/
	

}
