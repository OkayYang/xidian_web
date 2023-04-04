package com.jxust.nc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jxust.common.annotation.Excel;
import com.jxust.common.core.domain.BaseEntity;

/**
 * VIEW对象 view_enroll
 *
 * @author xuxiaoyang
 * @date 2023-04-03
 */
public class ViewEnroll extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 申请表ID */
    @Excel(name = "申请表ID")
    private Long enrollId;

    /** 比赛ID */
    private Long contestId;

    /** 比赛标题 */
    @Excel(name = "比赛标题")
    private String contestName;

    /** 用户UID */
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

    /** 学号 */
    @Excel(name = "学号")
    private Long uXh;

    /** 学院 */
    @Excel(name = "学院")
    private String uDepartment;

    /** 专业 */
    @Excel(name = "专业")
    private String uMajor;

    /** 班级 */
    @Excel(name = "班级")
    private String uClassname;

    /** 头像 */
    @Excel(name = "头像")
    private String uImage;

    /** 用户类别 */
    @Excel(name = "用户类别")
    private String uType;

    /** 申请状态(0申请中1同意2驳回3取消申请） */
    @Excel(name = "申请状态(0申请中1同意2驳回3取消申请）")
    private String status;

    /** 审核员 */
    private String Auditor;

    public void setEnrollId(Long enrollId)
    {
        this.enrollId = enrollId;
    }

    public Long getEnrollId()
    {
        return enrollId;
    }
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
    public void setuXh(Long uXh)
    {
        this.uXh = uXh;
    }

    public Long getuXh()
    {
        return uXh;
    }
    public void setuDepartment(String uDepartment)
    {
        this.uDepartment = uDepartment;
    }

    public String getuDepartment()
    {
        return uDepartment;
    }
    public void setuMajor(String uMajor)
    {
        this.uMajor = uMajor;
    }

    public String getuMajor()
    {
        return uMajor;
    }
    public void setuClassname(String uClassname)
    {
        this.uClassname = uClassname;
    }

    public String getuClassname()
    {
        return uClassname;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("enrollId", getEnrollId())
                .append("contestId", getContestId())
                .append("contestName", getContestName())
                .append("uid", getUid())
                .append("uNick", getuNick())
                .append("uName", getuName())
                .append("uSex", getuSex())
                .append("uXh", getuXh())
                .append("uDepartment", getuDepartment())
                .append("uMajor", getuMajor())
                .append("uClassname", getuClassname())
                .append("uImage", getuImage())
                .append("uType", getuType())
                .append("createTime", getCreateTime())
                .append("status", getStatus())
                .append("Auditor", getAuditor())
                .toString();
    }
}
