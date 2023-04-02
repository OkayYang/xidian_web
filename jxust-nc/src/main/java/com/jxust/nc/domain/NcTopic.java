package com.jxust.nc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jxust.common.annotation.Excel;
import com.jxust.common.core.domain.BaseEntity;

/**
 * 讨论话题对象 nc_topic
 * 
 * @author xuxiaoyang
 * @date 2023-03-30
 */
public class NcTopic extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 话题id */
    private Long topicId;

    /** 标题 */
    private String topicTitle;

    /** 内容 */
    @Excel(name = "内容")
    private String topicContent;

    /** 图片 */
    @Excel(name = "图片")
    private String topicImages;

    /** 视频 */
    private String topicVideos;

    /** 收藏量 */
    @Excel(name = "收藏量")
    private int topicStars;

    /** 点赞量 */
    @Excel(name = "点赞量")
    private int topicLikes;

    /** 浏览量 */
    @Excel(name = "浏览量")
    private int topicFlows;

    /** 所属类别 */
    @Excel(name = "所属类别")
    private Long topicTypeId;

    /** 创建者 */
    @Excel(name = "创建者")
    private Long createUid;

    /** 状态 */
    @Excel(name = "状态")
    private String status;


    public Long getTopicId() {
        return topicId;
    }

    public void setTopicId(Long topicId) {
        this.topicId = topicId;
    }

    public String getTopicTitle() {
        return topicTitle;
    }

    public void setTopicTitle(String topicTitle) {
        this.topicTitle = topicTitle;
    }

    public String getTopicContent() {
        return topicContent;
    }

    public void setTopicContent(String topicContent) {
        this.topicContent = topicContent;
    }

    public String getTopicImages() {
        return topicImages;
    }

    public void setTopicImages(String topicImages) {
        this.topicImages = topicImages;
    }

    public String getTopicVideos() {
        return topicVideos;
    }

    public void setTopicVideos(String topicVideos) {
        this.topicVideos = topicVideos;
    }

    public int getTopicStars() {
        return topicStars;
    }

    public void setTopicStars(int topicStars) {
        this.topicStars = topicStars;
    }

    public int getTopicLikes() {
        return topicLikes;
    }

    public void setTopicLikes(int topicLikes) {
        this.topicLikes = topicLikes;
    }

    public int getTopicFlows() {
        return topicFlows;
    }

    public void setTopicFlows(int topicFlows) {
        this.topicFlows = topicFlows;
    }

    public Long getTopicTypeId() {
        return topicTypeId;
    }

    public void setTopicTypeId(Long topicTypeId) {
        this.topicTypeId = topicTypeId;
    }

    public Long getCreateUid() {
        return createUid;
    }

    public void setCreateUid(Long createUid) {
        this.createUid = createUid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("topicId", getTopicId())
            .append("topicTitle", getTopicTitle())
            .append("topicContent", getTopicContent())
            .append("topicImages", getTopicImages())
            .append("topicVideos", getTopicVideos())
            .append("topicStars", getTopicStars())
            .append("topicLikes", getTopicLikes())
            .append("topicFlows", getTopicFlows())
            .append("topicTypeId", getTopicTypeId())
            .append("createTime", getCreateTime())
            .append("createUid", getCreateUid())
            .append("status", getStatus())
            .toString();
    }
}
