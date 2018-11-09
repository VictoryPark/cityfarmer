package com.cityfarmer.tip.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.cityfarmer.repository.domain.tip.TFormVO;
import com.cityfarmer.repository.domain.tip.TipBoard;
import com.cityfarmer.repository.domain.tip.TipBoardComment;
import com.cityfarmer.repository.domain.tip.TipFile;
import com.cityfarmer.repository.domain.tip.TipPageResult;
import com.cityfarmer.tip.service.TipService;

@Controller
@RequestMapping("/tip")
public class TipController {
	@Autowired
	public TipService service;

	//페이징용 list
	  @RequestMapping("MainPage.cf")
	public void list(Model model,@RequestParam(value="pageNo", defaultValue="1")int pageNo ){
		TipBoard board = new TipBoard();
		board.setPageNo(pageNo);
		/*List<TipBoard> selectBoard = service.selectBoard(board);*/
		model.addAttribute("selectCount", service.selectBoardCount());
		model.addAttribute("pageResult", new TipPageResult(pageNo, service.selectBoardCount()));
		model.addAttribute("list", service.selectBoard(board));
		
		
	}
/*	@RequestMapping("MainPage.cf")
	public void list(Model model) throws Exception{
	
		System.out.println("list: " + service.selectBoard());
		model.addAttribute("list", service.selectBoard());
		
		
	}*/
	
	
	@RequestMapping("/writeBoard.cf")
	public void wirteForm() throws Exception{
		
	}
	
	
/*	@RequestMapping("/write.cf")
	public String write(TipBoard tipboard, TFormVO form, TipFile file) throws Exception{
		file.setTipfOriName(form.getOriName());

	if(file.getTipfOriName()=="") {
		service.insertBoard(tipboard);
	}else {
		tipboard.setTipTitle(form.getTipTitle());
		tipboard.setTipContent(form.getTipContent());
		file.setTipfOriName(form.getOriName());
		file.setTipfSysName(form.getSysName());
		file.setTipfPath(form.getPath());
		file.setTipfSize(form.getSize());
		System.out.println(file.getTipfSize());
		
		
		service.insertBoardAll(tipboard, file);
	}
	return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "MainPage.cf";
	
	}*/
	
	@RequestMapping("/write.cf")
	public String write(TipBoard tipboard, TipFile file) throws Exception{
		System.out.println("-----------------");
		System.out.println(file.getTipfOriName());	
		System.out.println("-----------------");
		
	/*	
		tipboard.setTipTitle(form.getTipTitle());
		tipboard.setTipContent(form.getTipContent());
		file.setTipfOriName(form.getOriName());
		file.setTipfSysName(form.getSysName());
		file.setTipfPath(form.getPath());
		file.setTipfSize(form.getSize());
		System.out.println(file.getTipfSize());*/
	

	if(file.getTipfOriName()==null) {
		service.insertBoard(tipboard);
	}else {
		
		
		
		service.insertBoardAll(tipboard, file);
	}
	return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "MainPage.cf";
	
	}
	
	
	@RequestMapping("/detailBoard.cf")
	public void detail(int no, Model model)throws Exception{
		System.out.println("컨트롤러까지 들어옴을 확인");
		System.out.println(no);
	/*	HttpSession session = request.getSession();
		Member m =(Member) session.getAttribute("user");
		LikeTip liketip = new LikeTip();
		liketip.setLikeNo(no);
		liketip.setUserId(m.getId());
		model.addAttribute("like", service.CountLike(liketip));
		*/
		model.addAttribute("commentCount", service.selectCommentCountNo(no));
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
	/*	tipBoardComment.setTipcWriter("아란누나");*/
		service.insertComment(tipBoardComment);
		
	}
	//댓글 삭제
	@RequestMapping("/deleteComment.cf")
	@ResponseBody
	public void deleteComment(int cNo) {
		
		service.deleteComment(cNo);
	}
	@RequestMapping("/insertFile.cf")
	@ResponseBody
	public TipFile insertFile(@RequestParam("file") List<MultipartFile> attach, TipFile tipFile) throws IllegalStateException, IOException {
		String uploadPath = "/app/upload";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String datePath = sdf.format(new Date());
		String newName = UUID.randomUUID().toString();
		newName = newName.replace("-", "");
		System.out.println(newName);
		//?
		String fileExtension ="";
		String fileSysName = "";
		
		for(MultipartFile file : attach) {
			if(file.isEmpty() == true) continue;
			fileExtension = getExtension(file.getOriginalFilename());
			fileSysName = newName + "." + fileExtension;
			System.out.println(uploadPath+datePath+"/"+fileSysName);
			
			
			tipFile.setTipfOriName(file.getOriginalFilename());
			
			tipFile.setTipfSysName(fileSysName);
			tipFile.setTipfPath(uploadPath+datePath);
			tipFile.setTipfSize(file.getSize());
			
			File img = new File(uploadPath + datePath, fileSysName);
			
			
			if(img.exists() == false) {
				img.mkdirs();
			}
			file.transferTo(img);
			//service.uploadFile(ef);
			tipFile.setUrl("http://localhost:8000"+ uploadPath + datePath +"/"+ fileSysName);
//			tipFile.setUrl("http://192.168.0.63:8000"+ uploadPath + datePath +"/"+ fileSysName);

			
		}
		
		
		return tipFile;
	}
	
	
	 private static String getExtension(String fileName) {
       int dotPosition = fileName.lastIndexOf('.');
       
       if (dotPosition != -1 && fileName.length() - 1 > dotPosition) {
           return fileName.substring(dotPosition + 1);
       } else {
           return "";
       }
	 }
	 
	
	
	//댓글수정
/*	@RequestMapping("/updateComment.cf")
	@ResponseBody
	public void updateComment(TipBoardComment tipBoardComment) {
		service.updateComment(tipBoardComment);
	}*/
	

}
