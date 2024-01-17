package com.jxust.nc.service;

import com.jxust.nc.domain.NcUser;
import com.jxust.nc.domain.WxLoginUser;
import com.jxust.nc.utils.LoginFormEntity;
import com.jxust.nc.utils.Slider;
import com.jxust.nc.utils.Span;
import com.jxust.nc.utils.XduCookie;
import org.apache.http.client.CookieStore;

import java.io.IOException;
import java.util.List;

import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.BasicCookieStore;

public interface ISysXduService {
    public LoginFormEntity isNeedCaptcha(String username);
    public Slider openSliderCaptcha(String username) throws IOException;

    public boolean verifySlider(Span span) throws IOException, ClassNotFoundException;



    public List<Cookie> login(WxLoginUser wxUserModel);

    public NcUser getUserInfo(List<Cookie> cookies);

    public String getXsckb(List<Cookie> cookies,String term);
    public BasicCookieStore deserializeCookiesToStore(String serializedCookies);
    public List<Cookie> xduCookiesToHttpCookies(List<XduCookie> cookies);





}
