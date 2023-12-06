package com.jxust.nc.service;

import com.jxust.nc.domain.NcUser;
import org.apache.http.client.CookieStore;

public interface ISysXduService {

    public CookieStore login(String username, String password, String captchaValue);

    public NcUser getUserInfo(CookieStore cookieStore);

    public String getXsckb(CookieStore cookieStore,String term);





}
