package com.jxust.nc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jxust.common.annotation.Excel;
import com.jxust.common.core.domain.BaseEntity;

/**
 * 文章类目对象 nc_article_type
 * 
 * @author xuxiaoyang
 * @date 2023-03-28
 */
public class NcArticleType extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long atId;

    /** 父ID */
    private Long parentId;

    /** 类目名称 */
    @Excel(name = "类目名称")
    private String atName;

    /** 状态 */
    @Excel(name = "状态")
    private String status;



    public void setAtId(Long atId)
    {
        this.atId = atId;
    }

    public Long getAtId() 
    {
        return atId;
    }
    public void setParentId(Long parentId) 
    {
        this.parentId = parentId;
    }

    public Long getParentId() 
    {
        return parentId;
    }
    public void setAtName(String atName) 
    {
        this.atName = atName;
    }

    public String getAtName() 
    {
        return atName;
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
            .append("atId", getAtId())
            .append("parentId", getParentId())
            .append("atName", getAtName())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("status", getStatus())
            .toString();
    }
}
