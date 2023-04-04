package com.jxust.nc.domain;

import java.util.List;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jxust.common.annotation.Excel;
import com.jxust.common.core.domain.BaseEntity;

/**
 * 报名记录对象 nc_enroll
 * 
 * @author xuxiaoyang
 * @date 2023-04-03
 */
public class NcEnroll extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 申请表ID */
    private Long enrollId;

    /** 申请者ID */
    @Excel(name = "申请者ID")
    private Long enrollUid;

    /** 申请项目 */
    @Excel(name = "申请项目")
    private Long enrollCid;

    /** 申请状态(0申请中1同意2驳回3取消申请） */
    @Excel(name = "申请状态(0申请中1同意2驳回3取消申请）")
    private String status;

    /** 审核员 */
    @Excel(name = "审核员")
    private String Auditor;

    /** 用户管理信息 */
    private List<NcUser> ncUserList;

    public void setEnrollId(Long enrollId) 
    {
        this.enrollId = enrollId;
    }

    public Long getEnrollId() 
    {
        return enrollId;
    }
    public void setEnrollUid(Long enrollUid) 
    {
        this.enrollUid = enrollUid;
    }

    public Long getEnrollUid() 
    {
        return enrollUid;
    }
    public void setEnrollCid(Long enrollCid) 
    {
        this.enrollCid = enrollCid;
    }

    public Long getEnrollCid() 
    {
        return enrollCid;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setAuditor(String Auditor) 
    {
        this.Auditor = Auditor;
    }

    public String getAuditor() 
    {
        return Auditor;
    }

    public List<NcUser> getNcUserList()
    {
        return ncUserList;
    }

    public void setNcUserList(List<NcUser> ncUserList)
    {
        this.ncUserList = ncUserList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("enrollId", getEnrollId())
            .append("enrollUid", getEnrollUid())
            .append("enrollCid", getEnrollCid())
            .append("createTime", getCreateTime())
            .append("status", getStatus())
            .append("Auditor", getAuditor())
            .append("ncUserList", getNcUserList())
            .toString();
    }
}
