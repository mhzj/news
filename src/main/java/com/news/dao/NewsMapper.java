package com.news.dao;

import com.news.entity.News;
import com.news.entity.NewsExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface NewsMapper {
    int countByExample(NewsExample example);

    int deleteByExample(NewsExample example);

    int deleteByPrimaryKey(Integer nid);

    int insert(News record);

    int insertSelective(News record);

    List<News> selectByExample(NewsExample example);

    News selectByPrimaryKey(Integer nid);

    int updateByExampleSelective(@Param("record") News record, @Param("example") NewsExample example);

    int updateByExample(@Param("record") News record, @Param("example") NewsExample example);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);
    
    List<News> findNewsByRedu(int hot, int id);
    
    List<News> findNewsByhot(int hot);
    
    List<News> findNewsByntid(int id);
    
    public int add(News news); 
    
    public void delete(int nid); 
        
    public News get(int nid); 
      
    public int update(News news);  
        
    public List<News> list();
    
    public List<News> listByNtid(int ntid);

    public List<News> listBySourcetype(String sourcetype);
    
    public List<News> listBysearchTitle(String title);
     
  // public List<News> list(Page page);
    
   //  public List<News> list(@Param("page")Page page,@Param("ntid")int ntid);
     
    public int total(int ntid); 
    
    public List<News> findByTypeandTitle(int ntid, String title);

    public List<News> findByTypeandSourcetype(int ntid, String sourcetype);

    public List<News> findBySourcetypeandTitle(String sourcetype, String title);

    public List<News> findByTypeandAuthor(int ntid, String author);

    public List<News> findBySourcetypeTypeandTitle(int ntid, String sourcetype, String title);
}