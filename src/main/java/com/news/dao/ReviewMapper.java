package com.news.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.news.entity.Review;
import com.news.entity.ReviewExample;
import com.news.entity.vo.regai;

public interface ReviewMapper {
    int countByExample(ReviewExample example);

    int deleteByExample(ReviewExample example);

    int deleteByPrimaryKey(Integer rid);

    int insert(Review record);

    int insertSelective(Review record);

    List<Review> selectByExample(ReviewExample example);

    Review selectByPrimaryKey(Integer rid);

    int updateByExampleSelective(@Param("record") Review record, @Param("example") ReviewExample example);

    int updateByExample(@Param("record") Review record, @Param("example") ReviewExample example);

    int updateByPrimaryKeySelective(Review record);

    int updateByPrimaryKey(Review record);
    
    List<regai> selectBynid(int nid);
    
    List<Review> selectByuid(int uid);
    
}