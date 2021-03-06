package com.cityfarmer.exchange.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.cityfarmer.exchange.service.ExchangeService;
import com.cityfarmer.repository.domain.Member;
import com.cityfarmer.repository.domain.exchange.ExchangeBoard;
import com.cityfarmer.repository.domain.exchange.ExchangeComment;
import com.cityfarmer.repository.domain.exchange.ExchangeFile;
import com.cityfarmer.repository.domain.exchange.FormVO;
import com.cityfarmer.repository.domain.exchange.SearchVO;

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
	public void list(@RequestParam(value="pageNo",defaultValue = "1")
					int pageNo, Model model) {
		Map<String, Object>  map = service.list(pageNo);
		model.addAttribute("map", map);
	}
	
	@RequestMapping("/listsearch.cf")
	public void searchList(SearchVO search, Model model) {
		model.addAttribute("map", service.searchList(search));
	} //searchList
	
	@RequestMapping("/writeform.cf")
	public void writeForm() {
		
	}
	
	@RequestMapping("/write.cf")
	public String write(ExchangeBoard board, ExchangeFile file) {
		if(file.getExfOriName() =="") {
			service.write(board);
		} else {
			service.writeAll(board, file);			
		}
		
		return "redirect:list.cf";
	}
	
	@RequestMapping("/updateform.cf")
	public void updateForm(@RequestParam("exno")int exNo,  Model model) {
		model.addAttribute("board",service.updateForm(exNo));
	}
	
	@RequestMapping("/detail.cf")
	public void detail(@RequestParam("exno")int exNo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("user");
		model.addAttribute("map",service.detail(exNo, m.getId()));
	}
	
	@RequestMapping("/update.cf")
	public String update(ExchangeBoard board) {
		service.update(board);
	
		return "redirect:detail.cf?exno=" + board.getExNo();
	}

	@PostMapping("/updatey.cf")
	@ResponseBody
	public int updateY(@RequestParam("exno")int exNo) {
		System.out.println("exNo : " + exNo);
		return service.updateY(exNo);
	}
	
	@PostMapping("/updaten.cf")
	@ResponseBody
	public int updateN(@RequestParam("exno")int exNo) {
		return service.updateN(exNo);
	}
	
	@RequestMapping("/delete.cf")
	public String delete(@RequestParam("exno")int exNo) {
		service.delete(exNo);
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.cf";
	}
	
	@PostMapping("/uploadfile.cf")
	@ResponseBody
	public ExchangeFile uploadFile(@RequestParam("file") MultipartFile attach) throws IllegalStateException, IOException {
//		String uploadPath = "/app/tomcat-work/wtpwebapps/cityFarmer/img/exchange";
		String uploadPath = "/app/upload";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String datePath = sdf.format(new Date());
		
		String newName = UUID.randomUUID().toString();
		newName = newName.replace("-", "");
		
		String fileExtension ="";
		String fileSysName = "";

		System.out.println("attach : " +attach);
		
		ExchangeFile exFile = new ExchangeFile();
		
		
		if(attach.isEmpty() == false) {
			fileExtension = getExtension(attach.getOriginalFilename());
			fileSysName = newName + "." + fileExtension;
			System.out.println(uploadPath + datePath + "/"+fileSysName);
			
			exFile.setExfOriName(attach.getOriginalFilename());
			exFile.setExfSysName(fileSysName);
			exFile.setExfPath(uploadPath + datePath);
			exFile.setExfSize(attach.getSize());
			
			File img = new File(uploadPath + datePath, fileSysName);
			
			if(img.exists() == false) {
				img.mkdirs();
			}
			attach.transferTo(img);
			//service.uploadFile(ef);
			//<Context docBase="/app/upload" path="/app/upload" reloadable="true"/>
//			exFile.setUrl("http://192.168.0.63:8000"+ uploadPath + datePath +"/"+ fileSysName);
			exFile.setUrl("http://localhost:8000"+ uploadPath + datePath +"/"+ fileSysName);
		} //enhanced for문
		
		//source="org.eclipse.jst.jee.server:cityFarmer"
		return exFile;
	}
	
	@PostMapping("/comment/list.cf")
	@ResponseBody
	public List<ExchangeComment> listCommentByRegister(@RequestParam("exno")int exNo) {
		List<ExchangeComment> list = service.listCommentByRegister(exNo);
//		for( ExchangeComment ec : list) {
//			System.out.println(ec.getExcRef() +" - "+ ec.getExcParentNo());
//		}
		
		return list;
	}

	@PostMapping("/comment/write.cf")
	@ResponseBody
	public Map<String, Object> writeComment(ExchangeComment comment) {
		return service.writeComment(comment);
	}

	@GetMapping("/comment/delete.cf")
	@ResponseBody
	public Map<String, Object> deleteComment(ExchangeComment comment)  {
		return service.deleteComment(comment);
	}//deleteComment
	
	@PostMapping("/comment/updateform.cf")
	@ResponseBody
	public List<ExchangeComment> updateFormComment(@RequestParam("exno")int exNo){
		return service.listCommentByRegister(exNo);
	} //updateFormComment
	
	@PostMapping("/comment/update.cf")
	@ResponseBody
	public Map<String, Object> updateComment(ExchangeComment comment) { 
		//comment.setExcRegDate(new Date());
		return service.updateComment(comment);
	} // updateComment
	
	@PostMapping("/comment/order.cf")
	@ResponseBody
	public List<ExchangeComment> listCommentByDate(@RequestParam("exno")int exNo){
		return service.listCommentByDate(exNo);
	}
	
	@PostMapping("/comment/writerepl.cf")
	@ResponseBody
	public Map<String, Object> writeReply(ExchangeComment comment) {
		return service.writeReply(comment);
	}
	
	@PostMapping("/comment/deleterepl.cf")
	@ResponseBody
	public Map<String, Object> deleteReply(ExchangeComment comment){
		return service.deleteComment(comment);
	}
	
	@PostMapping("/comment/updateformrepl.cf")
	@ResponseBody
	public List<ExchangeComment> updateFormReply(@RequestParam("exno")int exNo) {
		return service.listCommentByRegister(exNo);
	} //updateFormComment
	
	@PostMapping("/comment/updaterepl.cf")
	@ResponseBody
	public Map<String, Object> updateReply(ExchangeComment comment) {
		return service.updateComment(comment);
	}
	
//	private List<ExchangeComment> convertDate(List<ExchangeComment> list) throws ParseException {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//		for(ExchangeComment co : list) {
//			String date = sdf.format(co.getExcRegDate());
//			co.setRegDateString(date);
//		}
//		return list;
//	}
	private static String getExtension(String fileName) {
        int dotPosition = fileName.lastIndexOf('.');
        
        if (dotPosition != -1 && fileName.length() - 1 > dotPosition) {
            return fileName.substring(dotPosition + 1);
        } else {
            return "";
        }
	 }
	 
//	 private static String getParentUrl(String fileUrl) {
//		 int dotPosi = fileUrl.lastIndexOf('/');
//		 
//		 if(dotPosi != -1 && fileUrl.length() -1 > dotPosi) {
//			 return fileUrl.substring(0,dotPosi);
//		 } else {
//			 return "";
//		 }
//	 }
	 
	
	
} //end class
