package com.news.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.news.dao.ManagerMapper;
import com.news.entity.Manager;
import com.news.entity.User;


@Service("managerService")
public class ManagerService {
	@Resource
	 ManagerMapper managerMapper;
	//返回所有管理员列表
	public List<Manager> findAll(){
		List<Manager> list=managerMapper.selectByExample(null);
		return list;
	}
	
	public Manager findManager(Manager m){
		
		return managerMapper.findManager(m);
		
	}
	
	//增加管理员
	public void saveManager(Manager m) {
		managerMapper.insertSelective(m);
    }
	//更新管理员信息
	public boolean updateUser(Manager m) {
		int i=managerMapper.updateByPrimaryKeySelective(m);
		if(i>0){return true;}
		else return false;
    }
	
	//根据Id删除管理员
	public boolean deleteManager(int mid) {
		int i=managerMapper.deleteByPrimaryKey(mid);
		if(i>0){return true;}
		else return false;
       
    }
	//根据Id查找管理员
	 public Manager findUserById(int mid) {
		 Manager m = managerMapper.selectByPrimaryKey(mid);
	        return m;
	    }

}
