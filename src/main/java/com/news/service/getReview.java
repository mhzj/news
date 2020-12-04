package com.news.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.news.dao.ReviewMapper;
import com.news.entity.Review;
import com.news.entity.vo.regai;

@Service("getr")
public class getReview {
	@Resource
	ReviewMapper rM;
	public List<regai> findreviewBynid(int nid){
		List<regai> rlist=rM.selectBynid(nid);
		return rlist;
	}
	public int savere(Review r){
		int n=rM.insertSelective(r);
		return n;
	}
	
	public int delreview(int rid){
		int i=rM.deleteByPrimaryKey(rid);
		return i;
	}
}
