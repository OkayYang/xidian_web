package com.jxust.nc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.jxust.common.annotation.Excel;
import com.jxust.common.core.domain.BaseEntity;

/**
 * 用户管理对象 nc_user
 * 
 * @author ruoyi
 * @date 2023-03-29
 */
public class NcUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户UID */
    private Long uid;

    /** 网名 */
    @Excel(name = "网名")
    private String uNick;

    /** 姓名 */
    @Excel(name = "姓名")
    private String uName;

    /** 性别 */
    @Excel(name = "性别")
    private String uSex;

    /** 学号 */
    @Excel(name = "学号")
    private Long uXh;

    /** 介绍 */
    private String uDesc;

    /** 密码 */
    private String uPassword;

    /** 学院 */
    @Excel(name = "学院")
    private String uDepartment;

    /** 专业 */
    @Excel(name = "专业")
    private String uMajor;

    /** 班级 */
    @Excel(name = "班级")
    private String uClassname;

    /** QQ */
    @Excel(name = "QQ")
    private String uQq;

    /** 身份证 */
    private String uIdcard;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String uEmail;

    /** 头像 */
    @Excel(name = "头像")
    private String uImage;

    /** 身份 */
    @Excel(name = "身份")
    private String uType;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** wx小程序标识用户id */
    private String openid;


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
    public void setuDesc(String uDesc) 
    {
        this.uDesc = uDesc;
    }

    public String getuDesc() 
    {
        return uDesc;
    }
    public void setuPassword(String uPassword) 
    {
        this.uPassword = uPassword;
    }

    public String getuPassword() 
    {
        return uPassword;
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
    public void setuQq(String uQq) 
    {
        this.uQq = uQq;
    }

    public String getuQq() 
    {
        return uQq;
    }
    public void setuIdcard(String uIdcard) 
    {
        this.uIdcard = uIdcard;
    }

    public String getuIdcard() 
    {
        return uIdcard;
    }
    public void setuEmail(String uEmail) 
    {
        this.uEmail = uEmail;
    }

    public String getuEmail() 
    {
        return uEmail;
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
    public void setOpenid(String openid) 
    {
        this.openid = openid;
    }

    public String getOpenid() 
    {
        return openid;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("uid", getUid())
            .append("uNick", getuNick())
            .append("uName", getuName())
            .append("uSex", getuSex())
            .append("uXh", getuXh())
            .append("uDesc", getuDesc())
            .append("uPassword", getuPassword())
            .append("uDepartment", getuDepartment())
            .append("uMajor", getuMajor())
            .append("uClassname", getuClassname())
            .append("uQq", getuQq())
            .append("uIdcard", getuIdcard())
            .append("uEmail", getuEmail())
            .append("uImage", getuImage())
            .append("uType", getuType())
            .append("createTime", getCreateTime())
            .append("status", getStatus())
            .append("openid", getOpenid())
            .toString();
    }
}
