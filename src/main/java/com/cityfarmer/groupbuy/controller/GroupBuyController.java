package com.cityfarmer.groupbuy.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.cityfarmer.groupbuy.service.GroupBuyService;
import com.cityfarmer.repository.domain.GroupBuyBoard;

@Controller
@RequestMapping("/groupbuy")
public class GroupBuyController {
	
	@Autowired
	private GroupBuyService service;
	
	@RequestMapping("/cf_main.cf")
	public void mainForm() {}
	
	@RequestMapping("/gb_board.cf")
	public void list(Model model) {
		model.addAttribute("list", service.list());
	}
	
	@RequestMapping("/gb_writeForm.cf")
	public void writeForm() {}

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
		
		gbb.setWriter("test"); //  로그인한사람으로 바꿔야함
		gbb.setGbStartDay(startArr[0]);
		gbb.setGbStartTime(startArr[1]);
		
		service.write(gbb);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "gb_board.cf";
	}

}
