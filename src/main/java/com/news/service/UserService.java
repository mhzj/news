package com.news.service;

import java.util.List;

import javax.annotation.Resource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.news.dao.UserMapper;
import com.news.entity.User;


@Service("userService")
public class UserService {
	User loginUser;
	
	@Resource
	 UserMapper userMapper;
	public int addUser(User u){
		int i = userMapper.insertSelective(u);
		return i;
	}

	
	public int updateUser(User u){
		int i=userMapper.updateByPrimaryKeySelective(u);
		return i;
	}
	
	public int deleteUser(User u){
		int i=userMapper.deleteByPrimaryKey(u.getUid());
		return i;
	}
	
	public List<User> findAllUser(User u){
		List<User> list = userMapper.selectByExample(null);
		return list;
		
	}
	
	
	public User findUser(User u){
		loginUser=userMapper.findUser(u);
		return loginUser;
		
	}
	
	public List<User> findAll() {
		return userMapper.findAll();
	}

	public Integer removeUser(Integer uid) {
		
		return userMapper.removeUser(uid);
	}
	
	public User findUserById(Integer uid) {
		return userMapper.findUserById(uid);
	}

	public int update(String uname, String pwd, Integer tel, String email,
			Integer uid) {
		return userMapper.update(uname, pwd, tel, email, uid);
	}

	public int updatePwd(Integer uid, String password) {
		return userMapper.updatePwd(uid, password);

	}
	

	public User findUserByName(String name) {
		return userMapper.findUserByName(name);
	}
	
	public User findUserIsexist(int id,String pwd){
		return userMapper.findUserIsexist(id, pwd);
	}

}
