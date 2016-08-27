package com.auction.controller;

import com.auction.util.MyResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Date;
import java.util.Iterator;

@Controller
@RequestMapping("/file")
public class UploadController {
	
	@RequestMapping("/upload")
	@ResponseBody
	public Object addUser(@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request) throws IOException{
		System.out.println("fileName---->" + file.getOriginalFilename());

		if(!file.isEmpty()){
			try {
				String savePath = request.getSession().getServletContext().getRealPath("resources/upload");
				FileOutputStream os = new FileOutputStream(savePath +"/"+ new Date().getTime() + file.getOriginalFilename());
				InputStream in = file.getInputStream();
				int b = 0;
				while((b=in.read()) != -1)	{
					os.write(b);
				}
				os.flush();
				os.close();
				in.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return MyResult.getResult();
	}
	
	@RequestMapping("/upload2")
	public String upload2(HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException{
		CommonsMultipartResolver multipartResolver  = new CommonsMultipartResolver(request.getSession().getServletContext());
		System.out.println("________________________________________"+request.getSession().getServletContext()
		);
		if(multipartResolver.isMultipart(request)){
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
			
			Iterator<String>  iter = multiRequest.getFileNames();
			while(iter.hasNext()){
					MultipartFile file = multiRequest.getFile((String)iter.next());
				if(file != null){
					String fileName = "demoUpload" + file.getOriginalFilename();
					String path = "D:/" + fileName;
					
					File localFile = new File(path);
					
					file.transferTo(localFile);
				}
				
			}
			
			
			
		}
		return "/success";
	}
	
	@RequestMapping("/toUpload")
	public String toUpload(){
		return "/upload";	}

}

