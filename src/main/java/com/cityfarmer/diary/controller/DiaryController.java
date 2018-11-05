package com.cityfarmer.diary.controller;

import java.util.List;

import javax.activation.CommandMap;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.cityfarmer.diary.service.DiaryService;
import com.cityfarmer.repository.domain.diary.DiaryBoard;
import com.cityfarmer.repository.domain.diary.DiaryComment;
import com.cityfarmer.repository.domain.diary.drPage;
import com.cityfarmer.repository.domain.diary.drPageResult;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyComment;

@Controller
@RequestMapping("/diary")
public class DiaryController {

	@Autowired
	public DiaryService drservice;
	
	@RequestMapping("/diarylist.cf")
	public void list(Model model, @RequestParam(value="pageNo", defaultValue="1") int pageNo) throws Exception {
		drPage drpage = new drPage();
		drpage.setPageNo(pageNo);
		
		model.addAttribute("list", drservice.list(drpage));
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
		comment.setDrcWriter("test1");
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
}
	
