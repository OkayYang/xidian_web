package com.jxust.nc.service.impl;

import com.alibaba.fastjson.JSONObject;

import com.jxust.nc.service.ITencentService;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class ITencentServiceImpl implements ITencentService {
    private static final Logger LOG = LoggerFactory.getLogger(ITencentServiceImpl.class);


    @Value("${wx.appid}")
    private String appid;
    @Value("${wx.secret}")
    private String secret;



    /**
     * 微信用户登陆调用微信api
     * @param code 用户凭证code换取open-id
     * @return open-id
     */
    @Override
    public String getUserOpenId(String code) {
        StringBuilder url = new StringBuilder("https://api.weixin.qq.com/sns/jscode2session?");
        url.append("appid="+appid);//appid设置
        url.append("&secret="+secret);//secret设置
        url.append("&js_code=");//code设置
        url.append(code);
        url.append("&grant_type=authorization_code");
        String openId = null;
        try {
            HttpClient client = HttpClientBuilder.create().build();//构建一个Client
            HttpGet get = new HttpGet(url.toString());    //构建一个GET请求
            HttpResponse response = client.execute(get);//提交GET请求
            HttpEntity result = response.getEntity();//拿到返回的HttpResponse的"实体"
            String content = EntityUtils.toString(result);
            JSONObject res = JSONObject.parseObject(content);//把信息封装为json
            openId = (String) res.get("openid");//拿到open-id

        } catch (Exception e) {
            e.printStackTrace();
        }
        return openId;
    }



}
