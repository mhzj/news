package com.news.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.news.entity.Source;
import com.news.service.SourceService;
import com.news.util.FileUploadUtils;
import com.news.util.UploadFile;

@Controller
public class uploadfiles {
	@Autowired
	SourceService sourceService;
	
	
	@RequestMapping("uploadfiles")
	public String test1(HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest mrequest = (MultipartHttpServletRequest) request;
		List<MultipartFile> files = mrequest.getFiles("duofile");//通过获取页面中文件域的name属性,得到对应的文件对象 ,装载成一个List集合
		//调用自己写的文件上传工具类 FileUploadUtils 的upLoadFile方法实现多文件上传到服务器的某个路径下
//		upLoadFile   param1  request对象 ,为了获取服务url路径的某些信息
//					param2   上传的多个文件对象
//			 		param3  上传的路径
		Map<String, UploadFile> upLoadFile = FileUploadUtils.upLoadFile(request,files , "newsimg");
		System.out.println(upLoadFile);
		for(Map.Entry<String, UploadFile> imgs :upLoadFile.entrySet()){
			System.out.println(imgs.getKey());
			System.out.println(imgs.getValue().getFileSize());
			System.out.println(imgs.getValue().getFileType());
			System.out.println(imgs.getValue().getNewFileName());
			System.out.println(imgs.getValue().getNewFilePath());
			System.out.println(imgs.getValue().getNewFileUrl());
			String url=imgs.getValue().getNewFileUrl();
			Source source=new Source();
			source.setSrc(url);
            if (imgs.getValue().getFileType().equals("video/mp4"))
                source.setType(2);
            else if (imgs.getValue().getFileType().equals("image/jpeg"))
                source.setType(1);
            else source.setType(3);
//			source.setType(1);
			source.setNid(Integer.parseInt(request.getParameter("nid")));
			int i=sourceService.insert(source);
			System.out.println("============"+i);
			//request.setAttribute("url", url);
			request.getSession().setAttribute("url", url);
			System.out.println(imgs.getValue().getOriginalFileName());
		}
		return "redirect:houtai/file.jsp";
	}

	@RequestMapping("uploadmovie")
	public String test2(HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest mrequest = (MultipartHttpServletRequest) request;
		List<MultipartFile> files = mrequest.getFiles("duofile");//通过获取页面中文件域的name属性,得到对应的文件对象 ,装载成一个List集合
		//调用自己写的文件上传工具类 FileUploadUtils 的upLoadFile方法实现多文件上传到服务器的某个路径下
//		upLoadFile   param1  request对象 ,为了获取服务url路径的某些信息
//					param2   上传的多个文件对象
//			 		param3  上传的路径
		Map<String, UploadFile> upLoadFile = FileUploadUtils.upLoadFile(request,files , "newsimg");
		System.out.println(upLoadFile);
		for(Map.Entry<String, UploadFile> imgs :upLoadFile.entrySet()){
			System.out.println(imgs.getKey());
			System.out.println(imgs.getValue().getFileSize());
			System.out.println(imgs.getValue().getFileType());
			System.out.println(imgs.getValue().getNewFileName());
			System.out.println(imgs.getValue().getNewFilePath());
			System.out.println(imgs.getValue().getNewFileUrl());
			String url=imgs.getValue().getNewFileUrl();
			Source source=new Source();
			source.setSrc(url);
			source.setType(2);
			source.setNid(Integer.parseInt(request.getParameter("nid")));
			int i=sourceService.insert(source);
			System.out.println("============"+i);
			//request.setAttribute("url", url);
			request.getSession().setAttribute("url", url);
			System.out.println(imgs.getValue().getOriginalFileName());
		}
		return "redirect:houtai/file.jsp";
	}
}
