package com.news.service;

import com.news.dao.SiteMapper;
import com.news.entity.Site;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("getsite")
public class getSite {
	@Resource
    SiteMapper sum;
	public List<Site> getsite(){
		List<Site> list1=sum.selectByExample(null);
		Site s=new Site();
		s=list1.get(0);
		for(int i=0;i<list1.size()-1;i++){
					s=list1.get(i);
					list1.set(i, s);
			}
		return list1;
	}

}
