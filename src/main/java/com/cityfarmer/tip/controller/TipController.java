package com.cityfarmer.tip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.cityfarmer.repository.domain.tip.TipBoard;
import com.cityfarmer.repository.domain.tip.TipBoardComment;
import com.cityfarmer.tip.service.TipService;

@Controller
@RequestMapping("/tip")
public class TipController {
	@Autowired
	public TipService service;

	/*페이징용 list
	 * @RequestMapping("MainPage.cf")
	public void list(Model model,TipBoard board,@RequestParam(value="pageNo", defaultValue="1")int pageNo ) throws Exception{
		board.setPageNo(pageNo);
		model.addAttribute("pageResult", new TipPageResult(pageNo, service.selectBoardCount()));
		model.addAttribute("list", service.selectBoard());
		
	}*/
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
		tipboard.setWriter("aaa");
		
		service.insertBoard(tipboard);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "MainPage.cf";
		
	}
	@RequestMapping("/detailBoard.cf")
	public void detail(int no, Model model)throws Exception{
	
		model.addAttribute("tipBoard", service.selectBoardByNo(no));
	}
	@RequestMapping("/deleteBoard.cf")
	public String delete(int no) {
		service.deleteBoard(no);
		return  UrlBasedViewResolver.REDIRECT_URL_PREFIX + "MainPage.cf";
	}
	@RequestMapping("/updateBoard.cf")
	public void updateForm(Model model, int no) throws Exception{
		model.addAttribute("tipBoard", service.selectBoardByNo(no));
	}
	@RequestMapping("/update.cf")
	public String update(TipBoard tipboard) throws Exception{
		service.update(tipboard);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "MainPage.cf";
		
	}
	
	
	// 댓글 기능 구현
	@RequestMapping("/listComment.cf")
	@ResponseBody
	public List<TipBoardComment> listComment(int no){
		System.out.println(no);
		return service.selectComment(no);
	}
	

	@RequestMapping("/insertComment.cf")
	@ResponseBody
	public void writeComment(TipBoardComment tipBoardComment) {
		tipBoardComment.setTipcWriter("아란누나");
		service.insertComment(tipBoardComment);
		
	}
	//댓글 삭제
	@RequestMapping("/deleteComment.cf")
	@ResponseBody
	public void deleteComment(int cNo) {
		
		service.deleteComment(cNo);
	}
	
	//댓글수정
/*	@RequestMapping("/updateComment.cf")
	@ResponseBody
	public void updateComment(TipBoardComment tipBoardComment) {
		service.updateComment(tipBoardComment);
	}*/
	

}
