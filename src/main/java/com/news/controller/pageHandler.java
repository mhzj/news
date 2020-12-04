package com.news.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.news.dao.NewsMapper;
import com.news.entity.News;
import com.news.entity.User;
import com.news.service.getNews;

@Controller
public class pageHandler {
	@Autowired
	getNews getnews; // ��ȡ��һ��news��service
	@Resource
	NewsMapper newsMapper;

	@RequestMapping("queryAllItems")
	//�÷���ʵ�������ŷ����������ķ�����ʾ����
	public ModelAndView Limitlist(HttpServletRequest request) {
		String ntId=request.getParameter("ntid");
		System.out.println("===NTID====="+ntId);
		//request.getSession().setAttribute("ntid", Integer.parseInt(ntId));
		request.getSession().setAttribute("ntid", Integer.parseInt(ntId));
		int pageNum = 1;
		if (request.getParameter("pageNum") == null
				|| "".equals(request.getParameter("page"))) {
			pageNum = 1;
		} else {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		ModelAndView modelAndView = new ModelAndView();
		
		Integer ntid=(Integer)request.getAttribute("ntid");
		List<News> listByNtid = newsMapper.listByNtid(ntid);// ���Ƚ���������ѯ������һ��news��list
		List<News> listByNtid1 = getnews.list(pageNum, listByNtid).getList();// �Ը�������ѯ����һ����ҳ���list����
		// List<News> listByNtid1=getnews.list(pageNum,listByNtid);
		pageNum = getnews.list(pageNum, listByNtid).getPageNum();
		System.out.println(pageNum + "=1111===page");
		int totalPage1 = getnews.list(pageNum, listByNtid).getPages();
		System.out.println(pageNum + "==================");
		System.out.println(totalPage1 + "==================");
		request.getSession().setAttribute("pageNum", pageNum);// ��session�����д��ݵ�ǰҳ��
		request.getSession().setAttribute("totalPage", totalPage1);// ��ҳ��
		modelAndView.addObject("itemsList", listByNtid1);// ���뵽ģ�Ͷ�����
		modelAndView.setViewName("queryAllItems.jsp");// ����jspҳ�����ת

		return modelAndView;
	}
	
	@RequestMapping("searchByTitle")
	//�÷���ʵ�������Ű������ѯ��������ʾ����
	public ModelAndView searchByTitle(HttpServletRequest request) {
		boolean read=false;
		if(read==false){String title=request.getParameter("title");
		request.getSession().setAttribute("title", title);
		read=true;
		}
	
		int pageNum = 1;
		if (request.getParameter("pageNum") == null
				|| "".equals(request.getParameter("page"))) {
			pageNum = 1;
		} else {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		ModelAndView modelAndView = new ModelAndView();
		
		String title=(String)request.getSession().getAttribute("title");
		System.out.println("======"+title+"======");
		List<News> listByNtid = newsMapper.listBysearchTitle(title);// ���Ƚ���������ѯ������һ��news��list
		for(News n:listByNtid){
			System.out.println("==="+n.getTitle()+"===");
		}
		List<News> listByNtid1 = getnews.list(pageNum, listByNtid).getList();// �Ը�������ѯ����һ����ҳ���list����
		pageNum = getnews.list(pageNum, listByNtid).getPageNum();
		int totalPage1 = getnews.list(pageNum, listByNtid).getPages();
		request.getSession().setAttribute("pageNum", pageNum);// ��session�����д��ݵ�ǰҳ��
		request.getSession().setAttribute("totalPage", totalPage1);// ��ҳ��
		modelAndView.addObject("itemsList", listByNtid1);//���뵽ģ�Ͷ�����
		modelAndView.setViewName("searchByTitle.jsp");// ����jspҳ�����ת

		return modelAndView;
		
		
	}
	
	@RequestMapping("searchByTitle1")
	//�÷���ʵ�������Ű������ѯ��������ʾ����
	public String  searchByTitle1(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			Model model,HttpServletRequest request){
		// �ӵ�һ����ʼ ÿҳ��ѯ��������
		PageHelper.startPage(pn, 5);
		String title=request.getParameter("title");
		request.setAttribute("title", title);
		ModelAndView modelAndView = new ModelAndView();
		List<News> list = newsMapper.listBysearchTitle(title.replace("'", ""));// ���Ƚ���������ѯ������һ��news��list
		PageInfo page = new PageInfo(list, 5);
		model.addAttribute("pageInfo", page);
		return "searchByTitle1.jsp";

		
		
		
		
	}
	
	
	// ��ҳ��ѯ����
	@RequestMapping("NewsInfo")
	public String NewsInfo(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,	//����ע������ȡҳ��post������
			Model model,HttpServletRequest req) {
		// �ӵ�һ����ʼ ÿҳ��ѯ��������
		PageHelper.startPage(pn, 5);
		String ntid=null,ntid1 = null;
		ntid=req.getParameter("ntid");
		req.setAttribute("ntid", ntid);
		
		 List<News> listByNtid = newsMapper.listByNtid(Integer.parseInt(ntid.replace("'", "")));// ���Ƚ���������ѯ������һ��news��list
		// ���û���Ϣ����PageInfo������
		PageInfo page = new PageInfo(listByNtid, 5);
		model.addAttribute("pageInfo", page);
		return "queryAllItems1.jsp";
	}
	

	// ���غ�̨��ҳ
	@RequestMapping("home")
	public String index() {
		/*return "redirect:index.jsp";*/
		return "chushihuanewstype";
	}
	
}
