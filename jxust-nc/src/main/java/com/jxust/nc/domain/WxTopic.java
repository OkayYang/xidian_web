package com.jxust.nc.domain;


import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jxust.common.annotation.Excel;
import com.jxust.common.core.domain.BaseEntity;

/**
 * VIEW对象 wx_topic
 *
 * @author xuxiaoyang
 * @date 2023-03-30
 */
public class WxTopic extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 话题id */

    private Long topicId;

    /** 话题标题 */

    private String topicTitle;

    /** 话题内容 */

    private String topicContent;

    /** 话题图片 */

    private String topicImages;

    /** 话题视频 */

    private String topicVideos;

    /** 收藏量 */

    private int topicStars;

    /** 点赞量 */

    private int topicLikes;

    /** 浏览量 */

    private int topicFlows;

    /** 所属类别 */

    private Long topicTypeId;



    /** 用户UID */

    private Long uid;

    /** 用户网名 */

    private String uNick;

    /** 用户姓名 */

    private String uName;

    /** 头像 */

    private String uImage;

    /** 评论数量 */

    private Long commentCount;

    private String ttName;

    public String getTtName() {
        return ttName;
    }

    public void setTtName(String ttName) {
        this.ttName = ttName;
    }

    public void setTopicId(Long topicId)
    {
        this.topicId = topicId;
    }



    public Long getTopicId()
    {
        return topicId;
    }
    public void setTopicTitle(String topicTitle)
    {
        this.topicTitle = topicTitle;
    }

    public String getTopicTitle()
    {
        return topicTitle;
    }
    public void setTopicContent(String topicContent)
    {
        this.topicContent = topicContent;
    }

    public String getTopicContent()
    {
        return topicContent;
    }
    public void setTopicImages(String topicImages)
    {
        this.topicImages = topicImages;
    }

    public String getTopicImages()
    {
        return topicImages;
    }
    public void setTopicVideos(String topicVideos)
    {
        this.topicVideos = topicVideos;
    }

    public String getTopicVideos()
    {
        return topicVideos;
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

    public void setUid(Long uid)
    {
        this.uid = uid;
    }

    public Long getUid()
    {
        return uid;
    }
    public void setuNick(String uNick)
    {
        this.uNick = uNick;
    }

    public String getuNick()
    {
        return uNick;
    }
    public void setuName(String uName)
    {
        this.uName = uName;
    }

    public String getuName()
    {
        return uName;
    }
    public void setuImage(String uImage)
    {
        this.uImage = uImage;
    }

    public String getuImage()
    {
        return uImage;
    }
    public void setCommentCount(Long commentCount)
    {
        this.commentCount = commentCount;
    }

    public Long getCommentCount()
    {
        return commentCount;
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
                .append("uid", getUid())
                .append("uNick", getuNick())
                .append("uName", getuName())
                .append("uImage", getuImage())
                .append("commentCount", getCommentCount())
                .toString();
    }
}
