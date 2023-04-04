package com.jxust.nc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jxust.common.annotation.Excel;
import com.jxust.common.core.domain.BaseEntity;

/**
 * 发布比赛对象 nc_contest
 * 
 * @author xuxiaoyang
 * @date 2023-04-03
 */
public class NcContest extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 比赛ID */
    private Long contestId;

    /** 标题 */
    @Excel(name = "标题")
    private String contestName;

    /** 封面 */
    @Excel(name = "封面")
    private String contestCover;

    /** 描述 */
    private String contestDesc;

    /** 比赛时间 */
    @Excel(name = "比赛时间")
    private String[] contestTime;

    private int contestFlows;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    public void setContestId(Long contestId) 
    {
        this.contestId = contestId;
    }

    public Long getContestId() 
    {
        return contestId;
    }
    public void setContestName(String contestName) 
    {
        this.contestName = contestName;
    }

    public String getContestName() 
    {
        return contestName;
    }
    public void setContestCover(String contestCover)
    {
        this.contestCover = contestCover;
    }

    public String getContestCover()
    {
        return contestCover;
    }
    public void setContestDesc(String contestDesc)
    {
        this.contestDesc = contestDesc;
    }

    public String getContestDesc() 
    {
        return contestDesc;
    }

    public String[] getContestTime() {
        return contestTime;
    }

    public void setContestTime(String[] contestTime) {
        this.contestTime = contestTime;
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
            .append("contestId", getContestId())
            .append("contestName", getContestName())
            .append("contestCover", getContestCover())
            .append("contestDesc", getContestDesc())
            .append("contestTime", getContestTime())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("status", getStatus())
            .toString();
    }
}
