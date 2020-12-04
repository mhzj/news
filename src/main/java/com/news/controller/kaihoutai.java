package com.news.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.news.entity.Source;
import com.news.service.SourceService;
import com.news.util.FileUploadUtils;
import com.news.util.UploadFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.news.dao.NewsMapper;
import com.news.entity.News;
import com.news.entity.News_type;
import com.news.entity.vo.regai;
import com.news.service.getNews;
import com.news.service.getNewtype;
import com.news.service.getReview;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class kaihoutai {
	@Autowired
	getNewtype getnt;
	@Autowired
	getNews getnews;
	@Autowired
	getReview getr;
    @Autowired
    SourceService sourceService;
	NewsMapper newsMapper;
	@RequestMapping("xinwenguanli")

	public String xinwenguanli(HttpServletRequest req){
		String rul="";
		List<News> list=getnews.selectNews();
		req.getSession().setAttribute("newslist", list);
		List<News_type> list1=getnt.getnewstype();
		List<News_type> list2=getnt.getnewstype();
		req.getSession().setAttribute("newstypelist1", list1);
		req.getSession().setAttribute("newstypelist2", list2);
		String flag = req.getParameter("flag");
		if(flag==null)
		rul="redirect:houtai/design.jsp";
		else rul="redirect:design.jsp";
		return rul;
	}
	@RequestMapping("gainews")
	public String gainews(HttpServletRequest req){
		String rul="";
		List<News_type> list1=getnt.getnewstype();
		req.getSession().setAttribute("newstypelist1", list1);
		int nid=Integer.parseInt(req.getParameter("flag"));
		News n=getnews.findnewsByID(nid);
		req.getSession().setAttribute("gainews", n);
		if(n.getIsreview()==1){
		List<regai> list=getr.findreviewBynid(nid);
		req.getSession().setAttribute("pinglun", list);}
		rul="redirect:houtai/gaixinwen.jsp";
		return rul;
	}
	@RequestMapping("delre")
	public String delre(HttpServletRequest req){
		String url="";
		int rid=Integer.parseInt(req.getParameter("rid"));
		int i=getr.delreview(rid);
		String flag=req.getParameter("flag");
		url="gainews?flag="+flag;
		return url;
	}
	@RequestMapping("yeswes")
	public String yeswes(HttpServletRequest req){
		String rul="";
		List<News_type> list1=getnt.getnewstype();
		req.getSession().setAttribute("newstypelist1", list1);
		int nid=Integer.parseInt(req.getParameter("nid"));
		String title=req.getParameter("title");
		String ntext=req.getParameter("content");
		int hot;
		if(req.getParameter("hot")!=null)
		hot=Integer.parseInt(req.getParameter("hot"));
		else hot=1;
		int isreview;
		if(req.getParameter("isreview")!=null){
			isreview=Integer.parseInt(req.getParameter("isreview"));}
		else isreview=0;
		String author=req.getParameter("author");
		int ntid=Integer.parseInt(req.getParameter("typeid"));
		String sourcetype=req.getParameter("sourcetype");
		News n=new News();
		n.setNid(nid);
		n.setAuthor(author);
		n.setNtext(ntext);
		n.setNtid(ntid);
		n.setIsreview(isreview);
		n.setTitle(title);
		n.setHot(hot);
		n.setSourcetype(sourcetype);

		n.setNtime(new java.sql.Date(new java.util.Date().getTime()));
		int x= getnews.gainews(n);
		if(x>0){
				req.getSession().setAttribute("sussion", "yes");
		}else{req.getSession().setAttribute("sussion", "no");}
		rul="redirect:xinwenguanli";
		return rul;
	}
	@RequestMapping("jia")
	public String jia(HttpServletRequest req){
        List<News> list=getnews.selectNews();
        req.getSession().setAttribute("newslist", list);
		List<News_type> list1=getnt.getnewstype();
		req.getSession().setAttribute("newstypelist1", list1);
		return "redirect:insert.jsp";
	}
	@RequestMapping("insert")
	public String insert(HttpServletRequest req) throws UnsupportedEncodingException{
		String url="";
//        List<Source> list3=sourceService.findAllImg();
//        req.getSession().setAttribute("sourcelist", list3);
//        int iid=Integer.parseInt(req.getParameter("iid"));
        List<News> list=getnews.selectNews();
        req.getSession().setAttribute("newslist", list);
		List<News_type> list1=getnt.getnewstype();
		req.getSession().setAttribute("newstypelist1", list1);
		String title=req.getParameter("title");
		title=new String(title.getBytes("UTF-8"),"UTF-8");
		String ntext=req.getParameter("content");
		ntext=new String(ntext.getBytes("UTF-8"),"UTF-8");
		int hot;
		int src;
		if(req.getParameter("hot")!=null)
		hot=Integer.parseInt(req.getParameter("hot"));
		else hot=1;
		int isreview;
		if(req.getParameter("isreview")!=null){
			isreview=Integer.parseInt(req.getParameter("isreview"));}
		else isreview=0;
		String author=req.getParameter("author");
		author=new String(author.getBytes("UTF-8"),"UTF-8");
		int ntid=Integer.parseInt(req.getParameter("type"));
        String sourcetype=req.getParameter("sourcetype");
		News n=new News();
		n.setAuthor(author);
		n.setNtext(ntext);
		n.setNtid(ntid);
		n.setIsreview(isreview);
		n.setTitle(title);
		n.setHot(hot);
		n.setSourcetype(sourcetype);
		n.setNtime(new java.sql.Date(new java.util.Date().getTime()));
//		n.setSrc(iid);
		int x=getnews.insert(n);
		url="redirect:xinwenguanli";
		return url;
	}
	@RequestMapping("delnews")
	public String delnews(HttpServletRequest req){
	String url="";
	int nid=Integer.parseInt(req.getParameter("nid"));
	List<regai> r=getr.findreviewBynid(nid);
	if(r.size()!=0)
	for(int i=0;i<r.size();i++){
		getr.delreview(r.get(i).getRid());
	}
	int i=getnews.delnews(nid);
	url="redirect:xinwenguanli";
	return url;
	}
	@RequestMapping("tpchshihua")
	public String tpchushihua(HttpServletRequest req){
		String url="";
		List<News_type> list1=getnt.getnewstype();
		req.getSession().setAttribute("ntp", list1);
		List<News_type> list2=getnt.getnewstype();
		req.getSession().setAttribute("ntp2", list2);
		String flag=req.getParameter("flag");
		if(flag==null){
			url="redirect:fenglieguanli.jsp";
		}else {
		url="redirect:houtai/fenglieguanli.jsp";}
		return url;
	}
	@RequestMapping("gaitp")
	public String gaitp(HttpServletRequest req) throws UnsupportedEncodingException{
		String url="";
		req.setCharacterEncoding("utf-8");
		int ntid=Integer.parseInt(req.getParameter("id"));
		String ntname=req.getParameter("tpname");
		ntname=new String(ntname.getBytes("UTF-8"),"UTF-8");
		News_type t=new News_type();
		t.setNtid(ntid);
		t.setNtname(ntname);
		int i=getnt.gaitp(t);
		url="tpchshihua?flag=1";
		return url;
	}
	@RequestMapping("delnt")
	public String delnt(HttpServletRequest req){
		String url="";
		int i;
		int ntid=Integer.parseInt(req.getParameter("ntid"));
		List<News> list = getnews.findnewntid(ntid);
		if(list.size()==0){
			i=getnt.delnt(ntid);}
		else{
			i=0;
		}
		if(i==0){
			req.getSession().setAttribute("shibai", 1);
		}
		url="tpchshihua?flag=2";
		return url;
	}
	@RequestMapping("insertnt")
	public String insertnt(HttpServletRequest req) throws UnsupportedEncodingException{
		String url="";
		String ntname= req.getParameter("tpname");
		ntname=new String(ntname.getBytes("UTF-8"),"UTF-8");
		News_type r=new News_type();
		r.setNtname(ntname);
		int i= getnt.insertnt(r);
		url="tpchshihua?flag=1";
		return url;
	}

	@RequestMapping("searchNews")
	public String searchNews(HttpServletRequest request) throws UnsupportedEncodingException{
		String title=" ";
		String ntype=" ";
        String sourcetype=" ";
		title=request.getParameter("title");
		ntype=request.getParameter("search-sort");
		sourcetype=request.getParameter("sourcetype");
		List<News> list ;
		if(ntype.equals("0")){
		    if(sourcetype.equals(" ")){
		        if(title.equals(" ")){
		            list=getnews.selectNews();
                }
                else {
                    list = getnews.listBysearchTitle_noPage(title);
                }
            }
            else {
                if (title.equals(" ")){
                    list=getnews.listBySourcetype_noPage(sourcetype);
                }
                else {
                    list=getnews.findBySourcetypeandTitle(sourcetype,title);
                }

            }
        }
        else {
            if(sourcetype.equals(" ")){
                if (title.equals(" ")){
                    list=getnews.findnewntid(Integer.parseInt(ntype));
                }
                else {
                    list=getnews.findByTypeandTitle(Integer.parseInt(ntype),title);
                }
            }
            else {
                if (title.equals(" ")){
                    list=getnews.findByTypeandSourcetype(Integer.parseInt(ntype),sourcetype);
                }
                else {
                    list=getnews.findBySourcetypeTypeandTitle(Integer.parseInt(ntype),sourcetype,title);
                }
            }
        }

        request.getSession().setAttribute("searchList", list);
	
		return "houtai/design1.jsp";
	}
	
	@RequestMapping("moredel")
	public String moredel(HttpServletRequest req){
		String url="redirect:xinwenguanli";
		List<News> list=getnews.selectNews();
		for(int i=1;i<=list.size();i++){
			int box=0;
			    System.out.println(req.getParameter("id"+i));
			if(req.getParameter("id"+i)!=null){
		box=Integer.parseInt(req.getParameter("id"+i));}
		if(box==1){
			int nid=Integer.parseInt(req.getParameter("nid"+i));
			List<regai> r=getr.findreviewBynid(nid);
			if(r.size()!=0)
			for(int j=0;j<r.size();j++){
				getr.delreview(r.get(j).getRid());
			}
			int z=getnews.delnews(nid);
			}
		}
		url="redirect:xinwenguanli";
		return url;
	}
}
