package com.news.service;

import com.news.dao.SiteMapper;
import com.news.entity.Site;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("siteService")
public class SiteService {
	@Resource
    SiteMapper siteMapper;

	public List<Site> findAll(){
		List<Site> list=siteMapper.selectByExample(null);
		return list;
	}
	

	public void savaSite(Site s) {
		siteMapper.insertSelective(s);
    }

	public boolean updateSite(Site s) {
		int i=siteMapper.updateByPrimaryKeySelective(s);
		if(i>0){return true;}
		else return false;
    }
	

	public boolean deleteSite(int mid) {
		int i=siteMapper.deleteByPrimaryKey(mid);
		if(i>0){return true;}
		else return false;
       
    }

	 public Site findSiteById(int mid) {
		Site s= siteMapper.selectByPrimaryKey(mid);
	        return s;
	    }

}