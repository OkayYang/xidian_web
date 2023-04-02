package com.jxust.nc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jxust.common.annotation.Excel;
import com.jxust.common.core.domain.TreeEntity;

/**
 * 评论专区对象 nc_discuss
 * 
 * @author xuxiaoyang
 * @date 2023-03-30
 */
public class NcDiscuss extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long discussId;


    /** 评论内容 */
    @Excel(name = "评论内容")
    private String discussContent;

    /** 评论图片 */
    @Excel(name = "评论图片")
    private String discussImages;

    /** 关联文章 */
    @Excel(name = "关联文章")
    private Long relateId;

    /** 评论者 */
    @Excel(name = "评论者")
    private Long createUid;

    /** 评论赞 */
    @Excel(name = "评论赞")
    private int discussLikes;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    public void setDiscussId(Long discussId) 
    {
        this.discussId = discussId;
    }

    public Long getDiscussId() 
    {
        return discussId;
    }

    public void setDiscussContent(String discussContent) 
    {
        this.discussContent = discussContent;
    }

    public String getDiscussContent() 
    {
        return discussContent;
    }
    public void setDiscussImages(String discussImages) 
    {
        this.discussImages = discussImages;
    }

    public String getDiscussImages() 
    {
        return discussImages;
    }
    public void setRelateId(Long relateId) 
    {
        this.relateId = relateId;
    }

    public Long getRelateId() 
    {
        return relateId;
    }
    public void setCreateUid(Long createUid) 
    {
        this.createUid = createUid;
    }

    public Long getCreateUid() 
    {
        return createUid;
    }
    public void setDiscussLikes(int discussLikes)
    {
        this.discussLikes = discussLikes;
    }

    public int getDiscussLikes()
    {
        return discussLikes;
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
            .append("discussId", getDiscussId())
            .append("parentId", getParentId())
            .append("ancestors", getAncestors())
            .append("discussContent", getDiscussContent())
            .append("discussImages", getDiscussImages())
            .append("createTime", getCreateTime())
            .append("relateId", getRelateId())
            .append("createUid", getCreateUid())
            .append("discussLikes", getDiscussLikes())
            .append("status", getStatus())
            .toString();
    }
}
