package com.cityfarmer.gallery.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.cityfarmer.gallery.service.GalleryService;
import com.cityfarmer.repository.domain.gallery.GaPageResult;
import com.cityfarmer.repository.domain.gallery.GalleryBoard;

@Controller
@RequestMapping("/gallery")
public class GalleryController {

	
	@Autowired
	public GalleryService gaService;
	
	@RequestMapping("/gallerylist1.cf")
	public void list(Model model, GalleryBoard galleryboard,@RequestParam(value="pageNo", defaultValue="1")int pageNo) throws Exception {
		galleryboard.setPageNo(pageNo);
		model.addAttribute("list", gaService.list(galleryboard));
		model.addAttribute("pageResult", new GaPageResult(pageNo, gaService.count()));
//		model.addAttribute("count", gaService.count());
	}
	@RequestMapping("/gallerywrite.cf")
	public void writeForm() throws Exception {
	}
	
	@RequestMapping("/write.cf")
	public String write(GalleryBoard galleryboard) throws Exception {
		gaService.write(galleryboard);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "gallerylist1.cf";
	}
}
