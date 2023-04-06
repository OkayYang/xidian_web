package com.jxust.nc.utils;

import com.alibaba.fastjson.JSONObject;
import com.jxust.common.utils.DateUtils;
import com.jxust.nc.domain.NcToken;
import com.jxust.nc.mapper.NcTokenMapper;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service("tokenTask")
public class NcTask {
    @Autowired
    private NcTokenMapper ncTokenMapper;
    @Value("${wx.appid}")
    private String appid;
    @Value("${wx.secret}")
    private String secret;

    /**
     * 获取微信token
     * @return token
     */
    public String getAccessToken(){
        String accessToken = null;
        StringBuilder url = new StringBuilder("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&");
        url.append("appid=" + appid);//appid设置
        url.append("&secret=" + secret);//secret设置

        try {
            HttpClient client = HttpClientBuilder.create().build();//构建一个Client
            HttpGet get = new HttpGet(url.toString());    //构建一个GET请求
            HttpResponse response = client.execute(get);//提交GET请求
            HttpEntity result = response.getEntity();//拿到返回的HttpResponse的"实体"
            String content = EntityUtils.toString(result);
            JSONObject res = JSONObject.parseObject(content);//把信息封装为json
            System.out.println(res);
            accessToken = (String) res.get("access_token");//拿到open-id
            if (accessToken!=null){
                NcToken ncToken = new NcToken();
                ncToken.setTokenValue(accessToken);
                ncToken.setTokenId(1L);
                ncToken.setUpdateTime(DateUtils.getNowDate());
                ncTokenMapper.updateNcToken(ncToken);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return accessToken;
    }
}
