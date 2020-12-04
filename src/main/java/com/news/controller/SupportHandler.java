package com.news.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.news.entity.Manager;
import com.news.entity.Support;
import com.news.service.SupportService;

@Controller
@RequestMapping("support")
public class SupportHandler{
	
	 @Autowired
	 SupportService supportService;

	     //��ת������û�����
	   
	    @RequestMapping("toAddSupport")
	    public String toAddUser(){
	        return "houtai/allSupport.jsp";
	    }

	     // ����������ض���  
	    @RequestMapping("addSupport") 
	    public String addManager(HttpServletRequest req){
	    	String  name=req.getParameter("SupportName");
	    	String money=req.getParameter("addMoney");
	    	String text=req.getParameter("addText");
	    	Support support=new Support();
	    	support.setSname(name);
	    	support.setSmoney(money);
	    	support.setText(text);
	        if(support != null){
	        	supportService.savaSupport(support);
	        }
	        return "redirect:SupportInfo";
	    }

	     
	    
	     // �޸�������Ϣ
	    @RequestMapping("editSupport")  
	    public String editUser(HttpServletRequest req){
	          String name=req.getParameter("editSupportname");
	          String money=req.getParameter("editMoney");
	          String id=req.getParameter("editSupportId");
	          String text=req.getParameter("editText");
	          System.out.println("==="+name);
	          System.out.println("==="+money);
	          System.out.println("==="+id);
	          System.out.println("==="+text);
	         Support support = supportService.findSupportById(Integer.parseInt(id));
	       
	         support.setSname(name);
	         support.setSmoney(money);
	         support.setText(text);
	          supportService.updateSupport(support);
	          //managerService.deleteManager(Integer.parseInt(id));
	          
	         return "redirect:SupportInfo";  
	    }

	
	    // ��ѯ��������
	 
	    @RequestMapping("getAllSupport")  
	    public String getAllUser(Model model){
	        List<Support> manager = supportService.findAll();
	        model.addAttribute("managerList",manager);
	        return "houtai/support.jsp";
	    }

	     // ��ѯ��������
	    @RequestMapping("getSupport")  
	    public String getUser(int mid,Model model){
	        model.addAttribute("user", supportService.findSupportById(mid));
	        return "editSupport";
	    }
	
	    
	    @RequestMapping("delSupport") 
	    public String deleteUser(HttpServletRequest req) {
	     Integer mid=Integer.parseInt(req.getParameter("id"));
	     supportService.deleteSupport(mid);
	        return "redirect:SupportInfo";
	    }

	     // ��ҳ��ѯ������Ϣ
	    @RequestMapping("SupportInfo")
	    public String getUsers(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
	        //�ӵ�һ����ʼ ÿҳ��ѯ��������
	        PageHelper.startPage(pn, 5);
	        List<Support> support = supportService.findAll();
	        //���û���Ϣ����PageInfo������
	        PageInfo page = new PageInfo( support,5);
	        model.addAttribute("pageInfo", page);
//	        return "houtai/support.jsp";
	        return "houtai/support.jsp";
	    }
	    
	    //���غ�̨��ҳ
	    @RequestMapping("index")
	    public String index(){
	        return "redirect:houtai/index.jsp";
	    }
}
