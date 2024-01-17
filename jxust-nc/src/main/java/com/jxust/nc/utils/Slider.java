package com.jxust.nc.utils;

import org.apache.http.cookie.Cookie;

import java.util.List;
import java.util.Map;

public class Slider {
    String bigImage;
    String smallImage;
    List<Cookie> cookies;

    public Slider() {

    }

    public List<Cookie> getCookies() {
        return cookies;
    }

    public void setCookies(List<Cookie> cookies) {
        this.cookies = cookies;
    }

    public String getBigImage() {
        return bigImage;
    }

    public void setBigImage(String bigImage) {
        this.bigImage = bigImage;
    }

    public String getSmallImage() {
        return smallImage;
    }

    public void setSmallImage(String smallImage) {
        this.smallImage = smallImage;
    }
}
