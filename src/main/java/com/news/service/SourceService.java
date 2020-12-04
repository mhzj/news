package com.news.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.news.dao.SourceMapper;
import com.news.entity.Source;

@Service("sourceService")
public class SourceService {
	@Resource
	 SourceMapper sourceMapper;
	public int insert(Source source){
		return sourceMapper.insertSelective(source);
	}
	
	  public List<Source> findAllImg(){
		  return sourceMapper.selectByExample(null);
		  
	  }

}
