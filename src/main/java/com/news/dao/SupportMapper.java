package com.news.dao;

import com.news.entity.Support;
import com.news.entity.SupportExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SupportMapper {
    int countByExample(SupportExample example);

    int deleteByExample(SupportExample example);

    int deleteByPrimaryKey(Integer sid);

    int insert(Support record);

    int insertSelective(Support record);

    List<Support> selectByExample(SupportExample example);

    Support selectByPrimaryKey(Integer sid);

    int updateByExampleSelective(@Param("record") Support record, @Param("example") SupportExample example);

    int updateByExample(@Param("record") Support record, @Param("example") SupportExample example);

    int updateByPrimaryKeySelective(Support record);

    int updateByPrimaryKey(Support record);
}