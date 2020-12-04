package com.news.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.news.dao.SupportMapper;
import com.news.entity.Manager;
import com.news.entity.Support;

@Service("supportService")
public class SupportService {
	@Resource
	SupportMapper supportMapper;
	//返回所有赞助列表
	public List<Support> findAll(){
		List<Support> list=supportMapper.selectByExample(null);
		return list;
	}
	
	//增加赞助
	public void savaSupport(Support s) {
		supportMapper.insertSelective(s);
    }
	//更新赞助信息
	public boolean updateSupport(Support s) {
		int i=supportMapper.updateByPrimaryKeySelective(s);
		if(i>0){return true;}
		else return false;
    }
	
	//根据Id删除管理员
	public boolean deleteSupport(int mid) {
		int i=supportMapper.deleteByPrimaryKey(mid);
		if(i>0){return true;}
		else return false;
       
    }
	//根据Id查找管理员
	 public Support  findSupportById(int mid) {
		Support s= supportMapper.selectByPrimaryKey(mid);
	        return s;
	    }

}