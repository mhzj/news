package com.news.entity;

public class News_type {
    private Integer ntid;

    private String ntname;

    public Integer getNtid() {
        return ntid;
    }

    public void setNtid(Integer ntid) {
        this.ntid = ntid;
    }

    public String getNtname() {
        return ntname;
    }

    public void setNtname(String ntname) {
        this.ntname = ntname == null ? null : ntname.trim();
    }
}