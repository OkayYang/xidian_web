package com.jxust.nc.domain;

public class WxUser {
    private NcUser ncUser;
    private String token;

    public NcUser getNcUser() {
        return ncUser;
    }

    public void setNcUser(NcUser ncUser) {
        this.ncUser = ncUser;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
