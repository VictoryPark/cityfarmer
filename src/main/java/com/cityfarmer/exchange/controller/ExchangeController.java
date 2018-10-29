package com.cityfarmer.exchange.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cityfarmer.exchange.service.ExchangeService;
import com.cityfarmer.repository.domain.ExchangeBoard;

@Controller
@RequestMapping("/exchange")
public class ExchangeController {

	@Autowired
	private ExchangeService service;
//	@RequestMapping("/main.cf")
//	public void main() {
//		
//	}
	
	@RequestMapping("/list.cf")
	public void list() {
		
	}
	
	@RequestMapping("/writeform.cf")
	public void writeForm() {
		
	}
	
	@RequestMapping("/write.cf")
	public String write(ExchangeBoard ex) {
		if(service.write(ex)!=0) {
			return "redirect:list.cf";
		}
		return "redirect:write.cf";
	}
	
	public void updateForm() {
		
	}
	
	public void update() {
		
	}
	
	public void delete() {
		
	}
	
} //end class
