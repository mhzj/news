package com.news.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.news.dao.News_typeMapper;
import com.news.entity.News_type;

@Service("getnt")
public class getNewtype {
	@Resource
	News_typeMapper getnte;
	public List<News_type> getnewstype(){
		List<News_type> list=getnte.selectByExample(null);
		return list;
	}
	
	public int gaitp(News_type t){
		int i=getnte.updateByPrimaryKey(t);
		return i;
	}
	public int delnt(int ntid){
		int i=getnte.deleteByPrimaryKey(ntid);
		return i;
	}
	public int insertnt(News_type record){
		int i=getnte.insert(record);
		return i;
	}
}
