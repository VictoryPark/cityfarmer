package com.cityfarmer.gallery.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.cityfarmer.gallery.service.GalleryService;

@Controller
@RequestMapping("/gallery")
public class GalleryController {

	
	@Autowired
	public GalleryService gaservice;
	
	@RequestMapping("/gallerylist1.cf")
	public void list(Model model) throws Exception {
		model.addAttribute("list", gaservice.list());
	}
	
}
