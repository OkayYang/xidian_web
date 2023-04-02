package com.jxust.nc.service;

/**
 * 调用腾讯一些api服务
 */
public interface ITencentService {



    /**
     * 微信用户登陆调用微信api
     * @param code 用户凭证code换取open-id
     * @return open-id
     */
    public  String getUserOpenId(String code);


}
