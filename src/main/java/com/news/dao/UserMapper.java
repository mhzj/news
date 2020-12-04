package com.news.dao;

import com.news.entity.User;
import com.news.entity.UserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
	int countByExample(UserExample example);

	int deleteByExample(UserExample example);

	int deleteByPrimaryKey(Integer uid);

	int insert(User record);

	int insertSelective(User record);

	List<User> selectByExample(UserExample example);

	User selectByPrimaryKey(Integer uid);

	int updateByExampleSelective(@Param("record") User record,
                                 @Param("example") UserExample example);

	int updateByExample(@Param("record") User record,
                        @Param("example") UserExample example);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);

	User findUser(User u);

	List<User> findAll();

	Integer removeUser(Integer uid);
	
	User findUserByName(String name);

	User findUserById(Integer uid);

	int update(String uname, String pwd, Integer tel, String email, Integer uid);

	int updatePwd(Integer uid, String password);
	
	User findUserIsexist(int id, String pwd);
}