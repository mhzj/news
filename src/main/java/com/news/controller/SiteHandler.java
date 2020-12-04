package com.news.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.news.entity.Site;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.news.service.SiteService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("site")
public class SiteHandler {
	
	 @Autowired
	 SiteService siteService;

	   
	    @RequestMapping("toAddSite")
	    public String toAddUser(){
	        return "houtai/allSite.jsp";
	    }

	    @RequestMapping("addSite")
	    public String addManager(HttpServletRequest req){
	    	String  name=req.getParameter("SiteName");
	    	String surl=req.getParameter("addSurl");
	    	Site site=new Site();
	    	site.setSname(name);
	    	site.setSurl(surl);
	        if(site != null){
	        	siteService.savaSite(site);
	        }
	        return "redirect:SiteInfo";
	    }


	    @RequestMapping("editSite")
	    public String editUser(HttpServletRequest req){
	          String name=req.getParameter("editSitename");
	          String surl=req.getParameter("editSurl");
	          String id=req.getParameter("editSiteId");
	          System.out.println("==="+name);
	          System.out.println("==="+surl);
	          System.out.println("==="+id);
	         Site site = siteService.findSiteById(Integer.parseInt(id));
	         site.setSname(name);
	        site.setSurl(surl);

	          siteService.updateSite(site);
	          //managerService.deleteManager(Integer.parseInt(id));
	          
	         return "redirect:SiteInfo";
	    }


	 
	    @RequestMapping("getAllSite")
	    public String getAllUser(Model model){
	        List<Site> manager = siteService.findAll();
	        model.addAttribute("managerList",manager);
	        return "houtai/site.jsp";
	    }

	    @RequestMapping("getSite")
	    public String getUser(int mid,Model model){
	        model.addAttribute("user", siteService.findSiteById(mid));
	        return "editSite";
	    }
	
	    
	    @RequestMapping("delSite")
	    public String deleteUser(HttpServletRequest req) {
	     Integer mid=Integer.parseInt(req.getParameter("id"));
	     siteService.deleteSite(mid);
	        return "redirect:SiteInfo";
	    }
	    @RequestMapping("SiteInfo")
	    public String getUsers(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
	        PageHelper.startPage(pn, 5);
	        List<Site> site = siteService.findAll();
	        PageInfo page = new PageInfo( site,5);
	        model.addAttribute("pageInfo", page);
	        return "houtai/site.jsp";
	    }

	    @RequestMapping("index")
	    public String index(){
	        return "redirect:houtai/index.jsp";
	    }
}
