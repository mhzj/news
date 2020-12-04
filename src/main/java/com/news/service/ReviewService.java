package com.news.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.news.dao.ReviewMapper;
import com.news.entity.Review;
@Service("reviewService")
public class ReviewService {
	@Resource
	ReviewMapper reviewMapper;
	 public List<Review> selectByuid(int uid){
		 List<Review> list = reviewMapper.selectByuid(uid);
		 return list;
	 }
}
