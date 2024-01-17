package com.jxust.nc.service.impl;

import javax.imageio.ImageIO;
import java.io.*;
import java.util.*;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jxust.nc.domain.NcUser;
import com.jxust.nc.domain.WxLoginUser;
import com.jxust.nc.service.ISysXduService;
import com.jxust.nc.utils.LoginFormEntity;
import com.jxust.nc.utils.Slider;
import com.jxust.nc.utils.Span;
import com.jxust.nc.utils.XduCookie;
import org.apache.http.*;
import org.apache.http.client.CookieStore;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.client.LaxRedirectStrategy;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.http.cookie.Cookie;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Service;

import java.awt.image.BufferedImage;


@Service
public class SysXduServiceImpl implements ISysXduService {



    private final String loginUrl = "https://ids.xidian.edu.cn/authserver/login?service=https%3A%2F%2Fyjspt.xidian.edu.cn%2Fgsapp%2Fsys%2Fyjsemaphome%2Fportal%2Findex.do";
    private final String scheduleUrl = "https://xxcapp.xidian.edu.cn/yjskb/wap/default/get-datatmp";
    private final String userInfoUrl = "https://yjspt.xidian.edu.cn/gsapp/sys/wdxj/xjqx/getXsInfo.do";

    private final String checkNeedCaptcha = "https://ids.xidian.edu.cn/authserver/checkNeedCaptcha.htl?username=";
    private final Header[] headers = new Header[]{
            new BasicHeader(HttpHeaders.USER_AGENT, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36"),
            new BasicHeader(HttpHeaders.ACCEPT, "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"),
            new BasicHeader(HttpHeaders.ACCEPT_LANGUAGE, "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3"),
            new BasicHeader(HttpHeaders.ACCEPT_ENCODING, "gzip, deflate"),
            new BasicHeader(HttpHeaders.CONNECTION, "keep-alive")
    };
    private HttpClientContext context;
    private HttpClient httpClient;
    private HttpClient httpClient1;


    @Override
    public LoginFormEntity isNeedCaptcha(String username) {
        LoginFormEntity loginFormEntity = new LoginFormEntity();
        boolean isNeed = false;
        HttpClientContext context;
        CookieStore cookieStore;
        cookieStore = new BasicCookieStore();
        context = HttpClientContext.create();
        context.setCookieStore(cookieStore);

        List<BasicHeader> headerList = new ArrayList<>();
        headerList.add(new BasicHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36"));
        headerList.add(new BasicHeader("Accept", "ext/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"));
        headerList.add(new BasicHeader("Accept-Language", "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3"));
        headerList.add(new BasicHeader("Accept-Encoding", "gzip, deflate"));
        headerList.add(new BasicHeader("Connection", "keep-alive"));

        try {
            // 全局请求设置
            HttpGet get = new HttpGet(loginUrl);
            get.setHeaders(this.headers);
            //和第二次请求补一个请求
            HttpClient httpClient1 = HttpClients.custom().build();
            HttpResponse res = httpClient1.execute(get);
            String resp1Body = EntityUtils.toString(res.getEntity());
            loginFormEntity.setClltValue(extractValueFromHtml(resp1Body, "cllt"));
            loginFormEntity.setDlltValue(extractValueFromHtml(resp1Body, "dllt"));
            loginFormEntity.setExeValue(extractValueFromHtml(resp1Body, "execution"));
            loginFormEntity.setLtValue(extractValueFromHtml(resp1Body, "lt"));


            String checkCaptcha = this.checkNeedCaptcha + username;
            HttpGet getCheckCaptcha = new HttpGet(checkCaptcha);
            HttpResponse resCaptcha = httpClient1.execute(getCheckCaptcha, context);
            String respBodyCheckCaptcha = EntityUtils.toString(resCaptcha.getEntity());
            if (respBodyCheckCaptcha != null) {
                isNeed = respBodyCheckCaptcha.contains("\"isNeed\":true");

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        loginFormEntity.setNeed(isNeed);

        return loginFormEntity;
    }
    @Override
    public Slider openSliderCaptcha(String username) throws IOException {
        Slider slider = new Slider();
        HttpClient httpClient;
        HttpClientContext context;
        BasicCookieStore cookieStore;
        cookieStore = new BasicCookieStore();
        List<BasicHeader> headerList = new ArrayList<>();
        headerList.add(new BasicHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36"));
        headerList.add(new BasicHeader("Accept", "ext/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"));
        headerList.add(new BasicHeader("Accept-Language", "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3"));
        headerList.add(new BasicHeader("Accept-Encoding", "gzip, deflate"));
        headerList.add(new BasicHeader("Connection", "keep-alive"));

        httpClient = HttpClients.custom()
                .setDefaultCookieStore(cookieStore)
                .setDefaultHeaders(headerList)
                .setRedirectStrategy(new LaxRedirectStrategy())
                .build();
        context = HttpClientContext.create();
        context.setCookieStore(cookieStore);
        try {
            String sliderUrl = "https://ids.xidian.edu.cn/authserver/common/openSliderCaptcha.htl";
            HttpGet getSliderUrl = new HttpGet(sliderUrl);
            HttpResponse resSliderUrl = httpClient.execute(getSliderUrl, context);
            HttpEntity entity = resSliderUrl.getEntity();
            String responseString = EntityUtils.toString(entity, "UTF-8");
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(responseString);
            String smallImageStr = jsonNode.at("/smallImage").asText();
            String bigImageStr = jsonNode.at("/bigImage").asText();
            String tagWidth = jsonNode.at("/tagWidth").asText();
            String yHeight = jsonNode.at("/yHeight").asText();
            slider.setBigImage(bigImageStr);
            slider.setSmallImage(smallImageStr);
            slider.setCookies(cookieStore.getCookies());
        } catch (Exception e) {
            return null;
        }
        return slider;
    }

    @Override
    public boolean verifySlider(Span span) throws IOException, ClassNotFoundException {
        boolean flag = false;
        BasicCookieStore cookieStore;
        cookieStore = deserializeCookiesToStore(span.getCookies());
        HttpClient httpClient;
        HttpClientContext context;
        List<BasicHeader> headerList = new ArrayList<>();
        headerList.add(new BasicHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36"));
        headerList.add(new BasicHeader("Accept", "ext/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"));
        headerList.add(new BasicHeader("Accept-Language", "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3"));
        headerList.add(new BasicHeader("Accept-Encoding", "gzip, deflate"));
        headerList.add(new BasicHeader("Connection", "keep-alive"));
        httpClient = HttpClients.custom()
                .setDefaultCookieStore(cookieStore)
                .setDefaultHeaders(headerList)
                .setRedirectStrategy(new LaxRedirectStrategy())
                .build();
        context = HttpClientContext.create();
        context.setCookieStore(cookieStore);
        String verifyUrl = "https://ids.xidian.edu.cn/authserver/common/verifySliderCaptcha.htl";
        HttpPost postVerifyUrl = new HttpPost(verifyUrl);
        List<NameValuePair> valueVerifyUrlPairs = new LinkedList<NameValuePair>();
        valueVerifyUrlPairs.add(new BasicNameValuePair("canvasLength", String.valueOf(280)));
        valueVerifyUrlPairs.add(new BasicNameValuePair("moveLength", String.valueOf(span.getSpan())));
        UrlEncodedFormEntity entityVerifyUrl = new UrlEncodedFormEntity(valueVerifyUrlPairs, Consts.UTF_8);
        postVerifyUrl.setEntity(entityVerifyUrl);
        HttpResponse resVerifyUrl = httpClient.execute(postVerifyUrl, context);

        String respBodyCheckCaptcha = EntityUtils.toString(resVerifyUrl.getEntity());
        if (respBodyCheckCaptcha != null) {
            System.out.println(respBodyCheckCaptcha);
            flag = respBodyCheckCaptcha.contains("success");
        }

        return flag;
    }



    @Override
    public List<Cookie> login(WxLoginUser wxUserModel) {

        BasicCookieStore cookieStore;
        cookieStore = deserializeCookiesToStore(wxUserModel.getCookies());
        HttpClient httpClient;
        HttpClientContext context;
        List<BasicHeader> headerList = new ArrayList<>();
        headerList.add(new BasicHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36"));
        headerList.add(new BasicHeader("Accept", "ext/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"));
        headerList.add(new BasicHeader("Accept-Language", "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3"));
        headerList.add(new BasicHeader("Accept-Encoding", "gzip, deflate"));
        headerList.add(new BasicHeader("Connection", "keep-alive"));
        httpClient = HttpClients.custom()
                .setDefaultCookieStore(cookieStore)
                .setDefaultHeaders(headerList)
                .setRedirectStrategy(new LaxRedirectStrategy())
                .build();
        context = HttpClientContext.create();
        context.setCookieStore(cookieStore);
        try {

            List<NameValuePair> valuePairs = new LinkedList<NameValuePair>();
            valuePairs.add(new BasicNameValuePair("username", wxUserModel.getUsername()));
            valuePairs.add(new BasicNameValuePair("password", wxUserModel.getPassword()));
            valuePairs.add(new BasicNameValuePair("lt", wxUserModel.getLtValue()));
            valuePairs.add(new BasicNameValuePair("execution", wxUserModel.getExeValue()));
            valuePairs.add(new BasicNameValuePair("_eventId", "submit"));
            valuePairs.add(new BasicNameValuePair("rememberMe", "true"));
            valuePairs.add(new BasicNameValuePair("cllt", wxUserModel.getClltValue()));
            valuePairs.add(new BasicNameValuePair("dllt", wxUserModel.getDlltValue()));
            valuePairs.add(new BasicNameValuePair("captcha", wxUserModel.getClltValue()));
            UrlEncodedFormEntity entity = new UrlEncodedFormEntity(valuePairs, Consts.UTF_8);

            HttpPost post = new HttpPost(loginUrl);

            post.setEntity(entity);
            HttpResponse res2 = httpClient.execute(post, context);
            String html = EntityUtils.toString(res2.getEntity());
            boolean contains = html.contains("研究生应用管理平台");
            if (contains) {
                System.out.println("登录成功");
                return cookieStore.getCookies();
            } else {
                System.out.println("登录失败");
                return null;
            }

        } catch (Exception e) {
            return null;
        }


    }

    @Override
    public NcUser getUserInfo(List<Cookie> cookies) {
        HttpClient httpClient;
        HttpClientContext context;
        BasicCookieStore cookieStore = new BasicCookieStore();
        for (int i = 0; i < cookies.size(); i++) {
            cookieStore.addCookie(cookies.get(i));

        }
        RequestConfig globalConfig = RequestConfig.custom()
                .setConnectTimeout(10000)
                .setSocketTimeout(10000)
                .build();
        List<BasicHeader> headerList = new ArrayList<>();
        headerList.add(new BasicHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36"));
        headerList.add(new BasicHeader("Accept", "ext/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"));
        headerList.add(new BasicHeader("Accept-Language", "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3"));
        headerList.add(new BasicHeader("Accept-Encoding", "gzip, deflate"));
        headerList.add(new BasicHeader("Connection", "keep-alive"));

        httpClient = HttpClients.custom()
                .setDefaultRequestConfig(globalConfig)
                .setDefaultCookieStore(cookieStore)
                .setDefaultHeaders(headerList)
                .setRedirectStrategy(new LaxRedirectStrategy())
                .build();
        context = HttpClientContext.create();
        context.setCookieStore(cookieStore);
        try {
            //获取cookie
            String accessURL = "https://yjspt.xidian.edu.cn/gsapp/sys/wdxj/*default/index.do";

            HttpGet get = new HttpGet(accessURL);
            httpClient.execute(get, context);

            String getUserInfoURL = "https://yjspt.xidian.edu.cn/gsapp/sys/wdxj/xjqx/getXsInfo.do";

            HttpPost httpPost = new HttpPost(getUserInfoURL);
            HttpResponse httpResponse = httpClient.execute(httpPost, context);
            HttpEntity entity = httpResponse.getEntity();
            String responseString = EntityUtils.toString(entity, "UTF-8");

            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(responseString);

            // Extracting values from the JSON
            String xm = jsonNode.at("/xsInfoList/0/XM").asText();
            String xh = jsonNode.at("/xsInfoList/0/XH").asText();
            String phone = jsonNode.at("/xsInfoList/0/SJHM").asText();//手机号
            String sex = jsonNode.at("/xsInfoList/0/XBDM_DISPLAY").asText();//性别
            String campus = jsonNode.at("/xsInfoList/0/XQDM_DISPLAY").asText();//校区
            String institute = jsonNode.at("/xsInfoList/0/YXDM_DISPLAY").asText();//学院

            NcUser ncUser = new NcUser();
            ncUser.setuXh(Long.parseLong(xh));
            ncUser.setuName(xm);
            ncUser.setuDepartment(institute);
            ncUser.setuSex(sex);
            ncUser.setuQq(phone);


            System.out.println(ncUser);
            return ncUser;
        } catch (Exception e) {
            return null;
        }


    }

    @Override
    public String getXsckb(List<Cookie> cookies, String term) {
        HttpClient httpClient;
        HttpClientContext context;
        BasicCookieStore cookieStore = new BasicCookieStore();
        for (int i = 0; i < cookies.size(); i++) {
            cookieStore.addCookie(cookies.get(i));

        }
        RequestConfig globalConfig = RequestConfig.custom()
                .setConnectTimeout(10000)
                .setSocketTimeout(10000)
                .build();
        List<BasicHeader> headerList = new ArrayList<>();
        headerList.add(new BasicHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36"));
        headerList.add(new BasicHeader("Accept", "ext/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"));
        headerList.add(new BasicHeader("Accept-Language", "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3"));
        headerList.add(new BasicHeader("Accept-Encoding", "gzip, deflate"));
        headerList.add(new BasicHeader("Connection", "keep-alive"));

        httpClient = HttpClients.custom()
                .setDefaultRequestConfig(globalConfig)
                .setDefaultCookieStore(cookieStore)
                .setDefaultHeaders(headerList)
                .setRedirectStrategy(new LaxRedirectStrategy())
                .build();
        context = HttpClientContext.create();
        context.setCookieStore(cookieStore);
        try {
            //cookie
            String accessURL = "https://yjspt.xidian.edu.cn/gsapp/sys/wdkbapp/*default/index.do";
            HttpGet httpGet = new HttpGet(accessURL);
            httpClient.execute(httpGet, context);
            //获取
            String postURL = "https://yjspt.xidian.edu.cn/gsapp/sys/wdkbapp/modules/xskcb/xspkjgcx.do";
            // 构造post数据
            List<NameValuePair> valuePairs = new LinkedList<NameValuePair>();
            valuePairs.add(new BasicNameValuePair("XNXQDM", "20231"));
            valuePairs.add(new BasicNameValuePair("*order", "-ZCBH"));
            UrlEncodedFormEntity entity = new UrlEncodedFormEntity(valuePairs, Consts.UTF_8);

            HttpPost httpPost = new HttpPost(postURL);
            httpPost.setEntity(entity);

            HttpResponse httpResponse = httpClient.execute(httpPost, context);
            HttpEntity entity2 = httpResponse.getEntity();
            String responseString = EntityUtils.toString(entity2, "UTF-8");

            System.out.println(responseString);
            return responseString;
        } catch (Exception e) {
            return null;
        }

    }

    private String extractValueFromHtml(String html, String id) {
        // Implement your own logic to解析HTML并提取对应id的值

        Document document = Jsoup.parse(html);
        Element element = document.selectFirst("form#pwdFromId");
        if (element != null) {
            return element.selectFirst("#" + id).val();
        } else {
            return null;
        }
    }
    public BufferedImage base64ToImage(String base64String) throws Exception {
        byte[] imageBytes = Base64.getDecoder().decode(base64String);
        ByteArrayInputStream bis = new ByteArrayInputStream(imageBytes);
        return ImageIO.read(bis);
    }
    @Override
    public BasicCookieStore deserializeCookiesToStore(String serializedCookies) {
        BasicCookieStore cookieStore = new BasicCookieStore();
        JSONArray cookieArray = JSONArray.parseArray(serializedCookies);

        for (int i = 0; i < cookieArray.size(); i++) {
            JSONObject cookieObj = cookieArray.getJSONObject(i);
            BasicClientCookie cookie = new BasicClientCookie(cookieObj.getString("name"), cookieObj.getString("value"));

            // 设置 Cookie 的各种属性
            if (cookieObj.getString("domain") != null) {
                cookie.setDomain(cookieObj.getString("domain"));
            }
            if (cookieObj.getString("path") != null) {
                cookie.setPath(cookieObj.getString("path"));
            }
            cookie.setSecure(cookieObj.getBooleanValue("secure"));
            cookie.setVersion(cookieObj.getIntValue("version"));
            // 如果有其他属性，也可以在这里设置
            cookieStore.addCookie(cookie);
        }
        return cookieStore;
    }

    @Override
    public List<Cookie> xduCookiesToHttpCookies(List<XduCookie> xduCookies){
        BasicCookieStore cookieStore = new BasicCookieStore();
        for (XduCookie xduCookie : xduCookies) {
            BasicClientCookie cookie = new BasicClientCookie(xduCookie.getName(), xduCookie.getValue());
            cookie.setVersion(xduCookie.getVersion());
            cookie.setExpiryDate(xduCookie.getExpiryDate());
            cookie.setSecure(xduCookie.isSecure());
            cookie.setComment(xduCookie.getComment());
            cookie.setPath(xduCookie.getPath());
            cookie.setDomain(xduCookie.getDomain());
            cookie.setCreationDate(xduCookie.getCreationDate());
            cookieStore.addCookie(cookie);
        }
        return cookieStore.getCookies();

    }





}
