package com.jxust.nc.service.impl;

import com.alibaba.fastjson.JSONObject;

import com.jxust.nc.domain.NcToken;
import com.jxust.nc.domain.WxMediaSensitiveCheckVo;
import com.jxust.nc.domain.WxTextSensitiveCheckVo;
import com.jxust.nc.mapper.NcTokenMapper;
import com.jxust.nc.service.ITencentService;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.nio.charset.Charset;

@Service
public class ITencentServiceImpl implements ITencentService {
    private static final Logger LOG = LoggerFactory.getLogger(ITencentServiceImpl.class);
    @Autowired
    private NcTokenMapper ncTokenMapper;


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
    /**
     * 敏感词汇检测
     * @param text 检测文本
     * @param openid 用户openid
     * @param scene 场景枚举值（1 资料；2 评论；3 论坛；4 社交日志）
     * @return label 命中标签枚举值，100 正常；10001 广告；20001 时政；20002 色情；20003 辱骂；20006 违法犯罪；20008 欺诈；20012 低俗；20013 版权；21000 其他
     */
    @Override
    public int checkText(String text,String openid,int scene) {
        int label = 100;
        NcToken ncToken = ncTokenMapper.selectNcTokenByTokenId(1L);
        String accessToken = ncToken.getTokenValue();
        StringBuilder url = new StringBuilder("https://api.weixin.qq.com/wxa/msg_sec_check?");
        url.append("access_token="+accessToken);
        WxTextSensitiveCheckVo wxTextSensitiveCheckVo = new WxTextSensitiveCheckVo();
        wxTextSensitiveCheckVo.setContent(text);
        wxTextSensitiveCheckVo.setOpenid(openid);
        wxTextSensitiveCheckVo.setScene(scene);
        String json = JSONObject.toJSONString(wxTextSensitiveCheckVo);
        try {
            HttpClient client = HttpClientBuilder.create().build();//构建一个Client
            HttpPost postMethod = new HttpPost(url.toString());//传入URL地址
            //设置请求头 指定为json
            postMethod.addHeader("Content-type", "application/json;charset=UTF-8");
            postMethod.setEntity(new StringEntity(json, Charset.forName("UTF-8")));
            HttpResponse response = client.execute(postMethod);
            HttpEntity result = response.getEntity();//拿到返回的HttpResponse的"实体"
            String content = EntityUtils.toString(result);
            JSONObject res = JSONObject.parseObject(content);//把信息封装为json
            int errcode = (Integer) res.get("errcode");//拿到open-id
            if (errcode==0){
                JSONObject rest = res.getJSONObject("result");
                label = (Integer)rest.get("label");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return label;

    }
    /**
     * 敏感词汇检测
     * @param imageUrl 检测media的url
     * @param openid 用户openid
     * @param scene 场景枚举值（1 资料；2 评论；3 论坛；4 社交日志）
     * @return label 命中标签枚举值，100 正常；10001 广告；20001 时政；20002 色情；20003 辱骂；20006 违法犯罪；20008 欺诈；20012 低俗；20013 版权；21000 其他
     */
    @Override
    public int checkMedia(String imageUrl, String openid, int scene) {
        int label = 100;
        NcToken ncToken = ncTokenMapper.selectNcTokenByTokenId(1L);
        String accessToken = ncToken.getTokenValue();
        StringBuilder url = new StringBuilder("https://api.weixin.qq.com/wxa/media_check_async?");
        url.append("access_token="+accessToken);
        WxMediaSensitiveCheckVo wxMediaSensitiveCheckVo = new WxMediaSensitiveCheckVo();
        wxMediaSensitiveCheckVo.setOpenid(openid);
        wxMediaSensitiveCheckVo.setScene(scene);
        wxMediaSensitiveCheckVo.setMedia_url(imageUrl);
        String json = JSONObject.toJSONString(wxMediaSensitiveCheckVo);
        try {
            HttpClient client = HttpClientBuilder.create().build();//构建一个Client
            HttpPost postMethod = new HttpPost(url.toString());//传入URL地址
            //设置请求头 指定为json
            postMethod.addHeader("Content-type", "application/json;charset=UTF-8");
            postMethod.setEntity(new StringEntity(json, Charset.forName("UTF-8")));
            HttpResponse response = client.execute(postMethod);
            HttpEntity result = response.getEntity();//拿到返回的HttpResponse的"实体"
            String content = EntityUtils.toString(result);
            JSONObject res = JSONObject.parseObject(content);//把信息封装为json
            int errcode = (Integer) res.get("errcode");//拿到open-id
            if (errcode==0){
                JSONObject rest = res.getJSONObject("result");
                label = (Integer)rest.get("label");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return label;
    }



}
