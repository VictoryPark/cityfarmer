package com.cityfarmer.exchange.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import com.cityfarmer.repository.domain.exchange.ExchangeBoard;
import com.cityfarmer.repository.domain.exchange.ExchangeComment;
import com.cityfarmer.repository.domain.exchange.ExchangeFile;
import com.cityfarmer.repository.domain.exchange.FormVO;

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
	
	@RequestMapping("/writeform.cf")
	public void writeForm() {
		
	}
	
	@RequestMapping("/write.cf")
	public String write(FormVO form, ExchangeBoard board, ExchangeFile file) {
		//System.out.println(form);
		board.setExTitle(form.getTitle());
		board.setExContent(form.getContent());
		board.setWriter(form.getWriter());
		file.setExfOriName(form.getOriName());
		file.setExfSysName(form.getSysName());
		file.setExfPath(form.getPath());
		file.setExfSize(form.getSize());
		
		service.write(board, file);
		
		return "redirect:list.cf";
	}
	
	@RequestMapping("/updateform.cf")
	public void updateForm(@RequestParam("exno")int exNo,  Model model) {
		model.addAttribute("board",service.detail(exNo));
	}
	
	@RequestMapping("/detail.cf")
	public void detail(@RequestParam("exno")int exNo, Model model) {
		model.addAttribute("map",service.detail(exNo));
	}
	
	@RequestMapping("/update.cf")
	public String update(ExchangeBoard board) {
		service.update(board);
	
		return "redirect:detail.cf?exno=" + board.getExNo();
	}
	
	@RequestMapping("/delete.cf")
	public String delete(@RequestParam("exno")int exNo) {
		service.delete(exNo);
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.cf";
	}
	
	@PostMapping("/uploadfile.cf")
	@ResponseBody
	public ExchangeFile uploadFile(@RequestParam("file") List<MultipartFile> attach, ExchangeFile exFile) throws IllegalStateException, IOException {
//		String uploadPath = "/app/tomcat-work/wtpwebapps/cityFarmer/img/exchange";
		String uploadPath = "/app/upload";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String datePath = sdf.format(new Date());
		
		String newName = UUID.randomUUID().toString();
		newName = newName.replace("-", "");
		
		String fileExtension ="";
		String fileSysName = "";

		System.out.println(attach);
		
		for(MultipartFile file : attach) {
			if(file.isEmpty()==true) continue;
			fileExtension = getExtension(file.getOriginalFilename());
			fileSysName = newName + "." + fileExtension;
			System.out.println(uploadPath + datePath + "/"+fileSysName);
			
			exFile.setExfOriName(file.getOriginalFilename());
			exFile.setExfSysName(fileSysName);
			exFile.setExfPath(uploadPath + datePath);
			exFile.setExfSize(file.getSize());
			
			File img = new File(uploadPath + datePath, fileSysName);
			
			if(img.exists() == false) {
				img.mkdirs();
			}
			file.transferTo(img);
			//service.uploadFile(ef);
			exFile.setUrl("http://localhost:8000"+ uploadPath + datePath +"/"+ fileSysName);
		} //enhanced for문
		
		//source="org.eclipse.jst.jee.server:cityFarmer"
		return exFile;
	}
	
	@PostMapping("/comment/list.cf")
	@ResponseBody
	public List<ExchangeComment> listComment(ExchangeComment comment) throws ParseException {
		return convertDate(service.listComment(comment));
	}

	@PostMapping("/comment/write.cf")
	@ResponseBody
	public List<ExchangeComment> writeComment(ExchangeComment comment) throws ParseException {
		return convertDate(service.writeComment(comment));
	}

	@GetMapping("/comment/delete.cf")
	@ResponseBody
	public List<ExchangeComment> deleteComment(ExchangeComment comment) throws ParseException {
		return convertDate(service.deleteComment(comment));
	}
	
	private List<ExchangeComment> convertDate(List<ExchangeComment> list) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		for(ExchangeComment co : list) {
			String date = sdf.format(co.getExcRegDate());
			co.setRegDateString(date);
		}
		return list;
	}
	private static String getExtension(String fileName) {
        int dotPosition = fileName.lastIndexOf('.');
        
        if (dotPosition != -1 && fileName.length() - 1 > dotPosition) {
            return fileName.substring(dotPosition + 1);
        } else {
            return "";
        }
	 }
	 
	 private static String getParentUrl(String fileUrl) {
		 int dotPosi = fileUrl.lastIndexOf('/');
		 
		 if(dotPosi != -1 && fileUrl.length() -1 > dotPosi) {
			 return fileUrl.substring(0,dotPosi);
		 } else {
			 return "";
		 }
	 }
	 
	
	
} //end class
