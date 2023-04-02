package com.jxust.nc.domain;

import java.util.List;

public class WxArticle {
    private Long atpId;
    private String name;
    private List<NcArticle> ncArticles;

    public Long getAtpId() {
        return atpId;
    }

    public void setAtpId(Long atpId) {
        this.atpId = atpId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<NcArticle> getNcArticles() {
        return ncArticles;
    }

    public void setNcArticles(List<NcArticle> ncArticles) {
        this.ncArticles = ncArticles;
    }
}
