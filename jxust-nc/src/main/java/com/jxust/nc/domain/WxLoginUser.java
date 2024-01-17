package com.jxust.nc.domain;

public class WxLoginUser {
    private String code;
    private String avatarUrl;
    private String nickName;
    private String gender;
    private String openId;
    private String username;
    private String password;
    private String cookies;
    private String ltValue ;
    private String clltValue ;
    private String dlltValue ;
    private String exeValue ;

    public String getLtValue() {
        return ltValue;
    }

    public void setLtValue(String ltValue) {
        this.ltValue = ltValue;
    }

    public String getClltValue() {
        return clltValue;
    }

    public void setClltValue(String clltValue) {
        this.clltValue = clltValue;
    }

    public String getDlltValue() {
        return dlltValue;
    }

    public void setDlltValue(String dlltValue) {
        this.dlltValue = dlltValue;
    }

    public String getExeValue() {
        return exeValue;
    }

    public void setExeValue(String exeValue) {
        this.exeValue = exeValue;
    }

    public String getCookies() {
        return cookies;
    }

    public void setCookies(String cookies) {
        this.cookies = cookies;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    @Override
    public String toString() {
        return "WeChatModel{" +
                "code='" + code + '\'' +
                ", avatarUrl='" + avatarUrl + '\'' +
                ", nickName='" + nickName + '\'' +
                ", gender='" + gender + '\'' +
                ", openId='" + openId + '\'' +
                '}';
    }
}
