package com.cityfarmer.exchange.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cityfarmer.exchange.service.ExchangeService;
import com.cityfarmer.repository.domain.exchange.ExchangeBoard;
import com.cityfarmer.repository.domain.exchange.ExchangeFile;

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
	
	@PostMapping("/uploadfile.cf")
	@ResponseBody
	public String uploadFile(@RequestParam("file") List<MultipartFile> attach, ExchangeFile ef) throws IllegalStateException, IOException {
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
			
			ef.setExfOriName(file.getOriginalFilename());
			ef.setExfSysName(fileSysName);
			ef.setExfPath(uploadPath + datePath);
			ef.setExfSize(file.getSize());
			
			File img = new File(uploadPath + datePath, fileSysName);
			
			if(img.exists() == false) {
				img.mkdirs();
			}
//			service.uploadFile(ef);
			file.transferTo(img);
		}
		//source="org.eclipse.jst.jee.server:cityFarmer"
		return "http://localhost:8000/file"+ datePath +"/"+ fileSysName;
	}
	
	 public static String getExtension(String fileName) {
	        int dotPosition = fileName.lastIndexOf('.');
	        
	        if (dotPosition != -1 && fileName.length() - 1 > dotPosition) {
	            return fileName.substring(dotPosition + 1);
	        } else {
	            return "";
	        }
	    }
	
} //end class
