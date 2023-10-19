package com.jxust.nc.domain;

import org.apache.http.client.CookieStore;

public class WxUser {
    private NcUser ncUser;
    private String token;

    private CookieStore cookieStore;
    private String kcb;

    public String getKcb() {
        return kcb;
    }

    public void setKcb(String kcb) {
        this.kcb = kcb;
    }

    public CookieStore getCookieStore() {
        return cookieStore;
    }

    public void setCookieStore(CookieStore cookieStore) {
        this.cookieStore = cookieStore;
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
