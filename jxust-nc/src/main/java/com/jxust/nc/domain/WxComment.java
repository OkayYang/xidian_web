package com.jxust.nc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jxust.common.annotation.Excel;
import com.jxust.common.core.domain.BaseEntity;

import java.util.ArrayList;
import java.util.List;

/**
 * VIEW对象 wx_comment
 *
 * @author ruoyi
 * @date 2023-03-31
 */
public class WxComment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 评论id */
    @Excel(name = "评论id")
    private Long discussId;

    /** 父id */
    @Excel(name = "父id")
    private Long parentId;

    /** 评论内容 */
    @Excel(name = "评论内容")
    private String discussContent;

    /** 评论图片 */
    @Excel(name = "评论图片")
    private String discussImages;

    /** 关联文章id */
    @Excel(name = "关联话题id")
    private Long relateTopicId;

    /** 评论赞 */
    @Excel(name = "评论赞")
    private Integer discussLikes;



    /** 用户UID */
    @Excel(name = "用户UID")
    private Long uid;

    /** 用户网名 */
    @Excel(name = "用户网名")
    private String uNick;

    /** 用户姓名 */
    @Excel(name = "用户姓名")
    private String uName;

    /** 用户性别（0男 1女 2未知） */
    @Excel(name = "用户性别", readConverterExp = "0=男,1=女,2=未知")
    private String uSex;

    /** 头像 */
    @Excel(name = "头像")
    private String uImage;

    /** 用户类别 */
    @Excel(name = "用户类别")
    private String uType;



    private WxComment parentComments;//    上一级父评论
    private List<WxComment> childrenComments = new ArrayList<>();// 子评论

    public WxComment getParentComments() {
        return parentComments;
    }

    public void setParentComments(WxComment parentComments) {
        this.parentComments = parentComments;
    }

    public List<WxComment> getChildrenComments() {
        return childrenComments;
    }

    public void setChildrenComments(List<WxComment> childrenComments) {
        this.childrenComments = childrenComments;
    }

    public void setDiscussId(Long discussId)
    {
        this.discussId = discussId;
    }

    public Long getDiscussId()
    {
        return discussId;
    }
    public void setParentId(Long parentId)
    {
        this.parentId = parentId;
    }

    public Long getParentId()
    {
        return parentId;
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

    public Long getRelateTopicId() {
        return relateTopicId;
    }

    public void setRelateTopicId(Long relateTopicId) {
        this.relateTopicId = relateTopicId;
    }


    public void setDiscussLikes(Integer discussLikes)
    {
        this.discussLikes = discussLikes;
    }

    public Integer getDiscussLikes()
    {
        return discussLikes;
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
    public void setuSex(String uSex)
    {
        this.uSex = uSex;
    }

    public String getuSex()
    {
        return uSex;
    }
    public void setuImage(String uImage)
    {
        this.uImage = uImage;
    }

    public String getuImage()
    {
        return uImage;
    }
    public void setuType(String uType)
    {
        this.uType = uType;
    }

    public String getuType()
    {
        return uType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("discussId", getDiscussId())
                .append("parentId", getParentId())
                .append("discussContent", getDiscussContent())
                .append("discussImages", getDiscussImages())
                .append("createTime", getCreateTime())
                .append("relateTopicId", getRelateTopicId())
                .append("discussLikes", getDiscussLikes())
                .append("uid", getUid())
                .append("uNick", getuNick())
                .append("uName", getuName())
                .append("uSex", getuSex())
                .append("uImage", getuImage())
                .append("uType", getuType())
                .toString();
    }
}

