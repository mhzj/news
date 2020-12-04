package com.news.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.news.dao.SupportMapper;
import com.news.entity.Support;

@Service("getsuppor")
public class getSupport {
	@Resource
	SupportMapper sum;
	public List<Support> getsup(){
		List<Support> list1=sum.selectByExample(null);
		Support s=new Support();
		s=list1.get(0);
		for(int i=0;i<list1.size()-1;i++){
			for(int j=0;j<=list1.size()-2;j++){
				if(Integer.parseInt(list1.get(j).getSmoney())<Integer.parseInt(list1.get(j+1).getSmoney())){
					s=list1.get(j);
					list1.set(j, list1.get(j+1));
					list1.set(j+1, s);
				}
			}
		}
		return list1;
	}

}
