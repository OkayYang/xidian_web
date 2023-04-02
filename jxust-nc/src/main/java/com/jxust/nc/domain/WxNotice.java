package com.jxust.nc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jxust.common.annotation.Excel;
import com.jxust.common.core.domain.BaseEntity;

/**
 * VIEW对象 wx_notice
 *
 * @author xuxiaoyang
 * @date 2023-04-02
 */
public class WxNotice extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 评论id */
    @Excel(name = "评论id")
    private Long discussId;

    /** 评论内容 */
    @Excel(name = "评论内容")
    private String discussContent;

    /** 用户UID */
    @Excel(name = "用户UID")
    private Long uid;

    /** 用户网名 */
    @Excel(name = "用户网名")
    private String commentNick;

    /** 用户姓名 */
    @Excel(name = "用户姓名")
    private String commentName;

    /** 头像 */
    @Excel(name = "头像")
    private String uImage;

    /** 话题id */
    @Excel(name = "话题id")
    private Long topicId;

    /** 话题内容 */
    @Excel(name = "话题内容")
    private String topicContent;

    /** 话题图片 */
    @Excel(name = "话题图片")
    private String topicImages;

    /** 浏览量 */
    @Excel(name = "浏览量")
    private Long topicFlows;

    /** 创建者 */
    @Excel(name = "创建者")
    private Long topicUid;

    /** 父亲评论id */
    @Excel(name = "评论id")
    private Long parentCommentId;

    /** 评论内容 */
    @Excel(name = "评论内容")
    private String parentCommentContent;

    /** 用户UID */
    @Excel(name = "用户UID")
    private Long parentCommentUid;

    /** 用户网名 */
    @Excel(name = "用户网名")
    private String parentCommentNick;

    /** 用户姓名 */
    @Excel(name = "用户姓名")
    private String parentCommentName;

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
    public void setUid(Long uid)
    {
        this.uid = uid;
    }

    public Long getUid()
    {
        return uid;
    }
    public void setCommentNick(String commentNick)
    {
        this.commentNick = commentNick;
    }

    public String getCommentNick()
    {
        return commentNick;
    }
    public void setCommentName(String commentName)
    {
        this.commentName = commentName;
    }

    public String getCommentName()
    {
        return commentName;
    }
    public void setuImage(String uImage)
    {
        this.uImage = uImage;
    }

    public String getuImage()
    {
        return uImage;
    }
    public void setTopicId(Long topicId)
    {
        this.topicId = topicId;
    }

    public Long getTopicId()
    {
        return topicId;
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
    public void setTopicFlows(Long topicFlows)
    {
        this.topicFlows = topicFlows;
    }

    public Long getTopicFlows()
    {
        return topicFlows;
    }
    public void setTopicUid(Long topicUid)
    {
        this.topicUid = topicUid;
    }

    public Long getTopicUid()
    {
        return topicUid;
    }
    public void setParentCommentId(Long parentCommentId)
    {
        this.parentCommentId = parentCommentId;
    }

    public Long getParentCommentId()
    {
        return parentCommentId;
    }
    public void setParentCommentContent(String parentCommentContent)
    {
        this.parentCommentContent = parentCommentContent;
    }

    public String getParentCommentContent()
    {
        return parentCommentContent;
    }
    public void setParentCommentUid(Long parentCommentUid)
    {
        this.parentCommentUid = parentCommentUid;
    }

    public Long getParentCommentUid()
    {
        return parentCommentUid;
    }
    public void setParentCommentNick(String parentCommentNick)
    {
        this.parentCommentNick = parentCommentNick;
    }

    public String getParentCommentNick()
    {
        return parentCommentNick;
    }
    public void setParentCommentName(String parentCommentName)
    {
        this.parentCommentName = parentCommentName;
    }

    public String getParentCommentName()
    {
        return parentCommentName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("discussId", getDiscussId())
                .append("discussContent", getDiscussContent())
                .append("createTime", getCreateTime())
                .append("uid", getUid())
                .append("commentNick", getCommentNick())
                .append("commentName", getCommentName())
                .append("uImage", getuImage())
                .append("topicId", getTopicId())
                .append("topicContent", getTopicContent())
                .append("topicImages", getTopicImages())
                .append("topicFlows", getTopicFlows())
                .append("topicUid", getTopicUid())
                .append("parentCommentId", getParentCommentId())
                .append("parentCommentContent", getParentCommentContent())
                .append("parentCommentUid", getParentCommentUid())
                .append("parentCommentNick", getParentCommentNick())
                .append("parentCommentName", getParentCommentName())
                .toString();
    }
}
