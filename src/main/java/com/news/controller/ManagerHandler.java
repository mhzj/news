package com.news.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.news.entity.Manager;
import com.news.service.ManagerService;


@Controller
@RequestMapping("manager")
public class ManagerHandler{
	
	 @Autowired
	    ManagerService managerService;


	     // ��ӹ���Ա���ض���  
	    @RequestMapping("addManager") 
	    public String addManager(HttpServletRequest req){
	    	String  name=req.getParameter("managerName");
	    	String pwd=req.getParameter("managerPassword");
	    	Manager manager=new Manager();
	    	manager.setMname(name);
	    	manager.setPwd(pwd);
	        if(manager != null){
	        	managerService.saveManager(manager);
	        }
	        return "redirect:ManagerInfo";
	    }

	     
	    
	     // �޸Ĺ���Ա��Ϣ
	    @RequestMapping("editManager")  
	    public String editUser(HttpServletRequest req){
	           String id=req.getParameter("editManagerid");
	           String pwd=req.getParameter("editPassword");
	          String name=req.getParameter("editManagername");
	          Manager manager = managerService.findUserById(Integer.parseInt(id));
	       
	          manager.setMname(name);
	          manager.setPwd(pwd);
	          managerService.updateUser(manager);
	          //managerService.deleteManager(Integer.parseInt(id));
	          
	         return "redirect:ManagerInfo";  
	    }

	 
	     // ��ѯ���й���Ա
	  
	    @RequestMapping("getAllManager")  
	    public String getAllUser(Model model){
	        List<Manager> manager = managerService.findAll();
	        model.addAttribute("managerList",manager);
	        return "houtai/allManager.jsp";
	    }

	   
	     // ��ѯ��������Ա
	   
	    @RequestMapping("getManager")  
	    public String getUser(int mid,Model model){
	        model.addAttribute("user", managerService.findUserById(mid));  
	        return "editUser";
	    }
	
	    
	    @RequestMapping("delManager") 
	    public String deleteUser(HttpServletRequest req) {
	     Integer mid=Integer.parseInt(req.getParameter("id"));
	     managerService.deleteManager(mid);
	        return "redirect:ManagerInfo";
	    }

	    
	     ///��ҳ��ѯ����Ա��Ϣ
	 
	    @RequestMapping("ManagerInfo")
	    public String getUsers(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
	        //�ӵ�һ����ʼ ÿҳ��ѯ��������
	        PageHelper.startPage(pn, 5);
	        List<Manager> manager = managerService.findAll();
	        //���û���Ϣ����PageInfo������
	        PageInfo page = new PageInfo( manager,5);
	        model.addAttribute("pageInfo", page);
	        return "houtai/allManager.jsp";
	       /* return "houtai/test.jsp";*/
	    }
	    
	    //���غ�̨��ҳ
	    @RequestMapping("index")
	    public String index(){
	        return "houtai/index.jsp";
	    }
	    
	    //����������֤
	    @RequestMapping("check")
	    public String check(HttpServletRequest req){
	    	String password=req.getParameter("managerPassword");
	    	if("erjimima".equals(password)){
	    		 return "manager/ManagerInfo";
	    	}
	    	
	    	else {
	    		return "houtai/index.jsp";
	    				
	    	}
	    }
}
