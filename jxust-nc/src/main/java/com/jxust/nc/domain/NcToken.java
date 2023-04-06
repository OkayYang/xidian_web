package com.jxust.nc.domain;


import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jxust.common.annotation.Excel;
import com.jxust.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 nc_token
 *
 * @author ruoyi
 * @date 2023-04-04
 */
public class NcToken extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    private Long tokenId;



    private String tokenName;

    private String tokenValue;


    private String status;

    public void setTokenId(Long tokenId)
    {
        this.tokenId = tokenId;
    }

    public Long getTokenId()
    {
        return tokenId;
    }
    public void setTokenName(String tokenName)
    {
        this.tokenName = tokenName;
    }

    public String getTokenName()
    {
        return tokenName;
    }
    public void setTokenValue(String tokenValue)
    {
        this.tokenValue = tokenValue;
    }

    public String getTokenValue()
    {
        return tokenValue;
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
                .append("tokenId", getTokenId())
                .append("tokenName", getTokenName())
                .append("tokenValue", getTokenValue())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .append("status", getStatus())
                .toString();
    }
}
