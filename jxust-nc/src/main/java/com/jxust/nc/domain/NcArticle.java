package com.jxust.nc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jxust.common.annotation.Excel;
import com.jxust.common.core.domain.BaseEntity;

/**
 * 文章管理对象 nc_article
 * 
 * @author xuxiaoyang
 * @date 2023-03-28
 */
public class NcArticle extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 文章ID */
    @Excel(name = "文章ID")
    private Long articleId;

    /** 文章标题 */
    @Excel(name = "文章标题")
    private String articleTitle;

    /** 文章内容 */
    @Excel(name = "文章内容")
    private String articleContent;

    /** 封面 */
    @Excel(name = "封面")
    private String articleCover;

    /** 类型 */
    @Excel(name = "类型")
    private Long articleTypeId;

    /** 收藏量 */
    @Excel(name = "收藏量")
    private int articleStars;

    /** 喜欢量 */
    @Excel(name = "喜欢量")
    private int articleLikes;

    /** 浏览量 */
    @Excel(name = "浏览量")
    private int articleFlows;

    /** 轮播展示 */
    @Excel(name = "轮播展示")
    private String isCarousel;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    public void setArticleId(Long articleId) 
    {
        this.articleId = articleId;
    }

    public Long getArticleId() 
    {
        return articleId;
    }
    public void setArticleTitle(String articleTitle) 
    {
        this.articleTitle = articleTitle;
    }

    public String getArticleTitle() 
    {
        return articleTitle;
    }
    public void setArticleContent(String articleContent) 
    {
        this.articleContent = articleContent;
    }

    public String getArticleContent() 
    {
        return articleContent;
    }
    public void setArticleCover(String articleCover) 
    {
        this.articleCover = articleCover;
    }

    public String getArticleCover() 
    {
        return articleCover;
    }
    public void setArticleTypeId(Long articleTpyeId)
    {
        this.articleTypeId = articleTpyeId;
    }

    public Long getArticleTypeId()
    {
        return articleTypeId;
    }

    public int getArticleStars() {
        return articleStars;
    }

    public void setArticleStars(int articleStars) {
        this.articleStars = articleStars;
    }

    public int getArticleLikes() {
        return articleLikes;
    }

    public void setArticleLikes(int articleLikes) {
        this.articleLikes = articleLikes;
    }

    public int getArticleFlows() {
        return articleFlows;
    }

    public void setArticleFlows(int articleFlows) {
        this.articleFlows = articleFlows;
    }

    public void setIsCarousel(String isCarousel)
    {
        this.isCarousel = isCarousel;
    }

    public String getIsCarousel() 
    {
        return isCarousel;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("articleId", getArticleId())
            .append("articleTitle", getArticleTitle())
            .append("articleContent", getArticleContent())
            .append("articleCover", getArticleCover())
            .append("articleTypeId", getArticleTypeId())
            .append("articleStars", getArticleStars())
            .append("articleLikes", getArticleLikes())
            .append("articleFlows", getArticleFlows())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("isCarousel", getIsCarousel())
            .append("status", getStatus())
            .toString();
    }
}
