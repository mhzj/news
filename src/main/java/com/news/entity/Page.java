package com.news.entity;

public class Page {
	   private int startPage;
	    private int pageSize;
	    public int getStartPage() {

	        return startPage;
	    }
	    public void setStartPage(int startPage) {
	        this.startPage = startPage;
	    }
	    public int getPageSize() {

	        return pageSize;
	    }
	    public void setPageSize(int pageSize) {
	        this.pageSize = pageSize;
	    }
	    public Page(int startPage, int pageSize) {
	        super();
	        this.startPage = startPage;
	        this.pageSize = pageSize;
	    }
	    public Page() {
	        super();
	        // TODO Auto-generated constructor stub

	    }
}
