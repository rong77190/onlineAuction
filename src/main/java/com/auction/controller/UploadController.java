package com.auction.controller;

import com.auction.util.MyResult;
import net.sf.json.JSONObject;
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
import java.util.*;
/**
 * Created by dell on 2016/7/19.
 */


@Controller
@RequestMapping("/file")
public class UploadController {
	
	@RequestMapping("/upload")
	@ResponseBody
	public Object addUser(@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request) throws IOException{
		System.out.println("fileName---->" + file.getOriginalFilename());
		//项目暂时只需要image
		HashMap<String, String> extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp");
		String dirName = "image";
		String fileName = file.getOriginalFilename();
		//检查扩展名
		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		System.out.println("<<<<<<<<<<<fileExt<<<<<<<<<<<<<"+fileExt);
		if (!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)) {
			return MyResult.getResult(0,"上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。","");
		}
		if(!file.isEmpty()){
			String basePath = "resources/upload";
			String savePath = request.getSession().getServletContext().getRealPath(basePath);
			System.out.println("savePath》》》》》》》》》》》》》》》》》》》》》"+savePath);
			String newImageName = new Date().getTime() + file.getOriginalFilename();
			String imagePath = savePath + "/"+ newImageName;
			System.out.println("imagePath》》》》》》》》》》》》》》》》》》》》》"+imagePath);
			try {
				FileOutputStream os = new FileOutputStream(imagePath);
				InputStream in = file.getInputStream();
				int b = 0;
				while((b=in.read()) != -1)	{
					os.write(b);
				}
				os.flush();
				os.close();
				in.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				return MyResult.getResult(0,"文件上传错误","");
			}
			Map<String , Object> map = new HashMap<String, Object>();
			map.put("image",basePath+"/"+newImageName);
			return MyResult.getResult(1,"",map);
		}else {
			return MyResult.getResult(0,"上传文件为空","");
		}

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

