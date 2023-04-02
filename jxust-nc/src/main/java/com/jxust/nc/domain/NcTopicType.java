package com.jxust.nc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jxust.common.annotation.Excel;
import com.jxust.common.core.domain.BaseEntity;

import java.util.ArrayList;
import java.util.List;

/**
 * 话题类别对象 nc_topic_type
 * 
 * @author xuxiaoyang
 * @date 2023-03-29
 */
public class NcTopicType extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long ttId;

    /** 类别名称 */
    @Excel(name = "类别名称")
    private String ttName;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 封面 */
    @Excel(name = "封面")
    private String ttCover;

    private final int currentPage=1;
    private final boolean isEnding =false;

    private final String endText = "到底了";

    private final int pageCount=0;

    private List<WxTopic> wxTopics = new ArrayList<>();

    public int getPageCount() {
        return pageCount;
    }

    public List<WxTopic> getWxTopics() {
        return wxTopics;
    }

    public void setWxTopics(List<WxTopic> wxTopics) {
        this.wxTopics = wxTopics;
    }

    public String getEndText() {
        return endText;
    }

    public boolean isEnding() {
        return isEnding;
    }


    public int getCurrentPage() {
        return currentPage;
    }



    public void setTtId(Long ttId) 
    {
        this.ttId = ttId;
    }

    public Long getTtId() 
    {
        return ttId;
    }
    public void setTtName(String ttName) 
    {
        this.ttName = ttName;
    }

    public String getTtName() 
    {
        return ttName;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setTtCover(String ttCover) 
    {
        this.ttCover = ttCover;
    }

    public String getTtCover() 
    {
        return ttCover;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("ttId", getTtId())
            .append("ttName", getTtName())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("status", getStatus())
            .append("ttCover", getTtCover())
            .toString();
    }
}
