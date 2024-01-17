package com.jxust.nc.domain;

import org.apache.http.client.CookieStore;
import org.apache.http.cookie.Cookie;

import java.util.List;

public class WxUser {
    private NcUser ncUser;
    private String token;

    private List<Cookie> cookies;
    private String kcb;

    public String getKcb() {
        return kcb;
    }

    public void setKcb(String kcb) {
        this.kcb = kcb;
    }

    public List<Cookie> getCookies() {
        return cookies;
    }

    public void setCookies(List<Cookie> cookies) {
        this.cookies = cookies;
    }

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
