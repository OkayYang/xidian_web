package com.jxust.nc.service.impl;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jxust.nc.domain.NcUser;
import com.jxust.nc.service.ISysXduService;
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
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@Service
public class SysXduServiceImpl implements ISysXduService {

    private final String loginUrl = "https://ids.xidian.edu.cn/authserver/login?service=https%3A%2F%2Fyjspt.xidian.edu.cn%2Fgsapp%2Fsys%2Fyjsemaphome%2Fportal%2Findex.do";
    private final String scheduleUrl = "https://xxcapp.xidian.edu.cn/yjskb/wap/default/get-datatmp";
    private final String userInfoUrl = "https://yjspt.xidian.edu.cn/gsapp/sys/wdxj/xjqx/getXsInfo.do";
    private final Header[] headers = new Header[]{
            new BasicHeader(HttpHeaders.USER_AGENT, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36"),
            new BasicHeader(HttpHeaders.ACCEPT, "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"),
            new BasicHeader(HttpHeaders.ACCEPT_LANGUAGE, "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3"),
            new BasicHeader(HttpHeaders.ACCEPT_ENCODING, "gzip, deflate"),
            new BasicHeader(HttpHeaders.CONNECTION, "keep-alive")
    };
    @Override
    public CookieStore login(String username, String password, String captchaValue) {
        HttpClient httpClient;
        HttpClientContext context;
        CookieStore cookieStore;
        RequestConfig globalConfig = RequestConfig.custom()
                .setConnectTimeout(10000)
                .setSocketTimeout(10000)
                .build();

        cookieStore = new BasicCookieStore();

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
            // 全局请求设置
            HttpGet get =  new HttpGet(loginUrl);
            get.setHeaders(this.headers);
            HttpClient httpClient1 = HttpClients.custom().build();

            HttpResponse res = httpClient1.execute(get);

            String resp1Body =  EntityUtils.toString(res.getEntity());
            String ltValue = extractValueFromHtml(resp1Body, "lt");
            String clltValue = extractValueFromHtml(resp1Body, "cllt");
            String dlltValue = extractValueFromHtml(resp1Body, "dllt");
            String exeValue = extractValueFromHtml(resp1Body, "execution");

            // 构造post数据
            List<NameValuePair> valuePairs =  new LinkedList<NameValuePair>();
            valuePairs.add( new BasicNameValuePair( "username" , username));
            valuePairs.add( new  BasicNameValuePair( "password" , password));
            valuePairs.add( new  BasicNameValuePair( "lt" ,  ltValue ));
            valuePairs.add( new  BasicNameValuePair( "execution" ,  exeValue ));
            valuePairs.add( new  BasicNameValuePair( "_eventId" ,  "submit" ));
            valuePairs.add( new  BasicNameValuePair( "cllt" ,  clltValue ));
            valuePairs.add( new  BasicNameValuePair( "dllt" ,  dlltValue ));
            valuePairs.add( new  BasicNameValuePair( "captcha" ,  captchaValue ));
            UrlEncodedFormEntity entity =  new  UrlEncodedFormEntity(valuePairs, Consts.UTF_8);

            HttpPost post = new HttpPost(loginUrl);

            post.setEntity(entity);
            HttpResponse res2 = httpClient.execute(post, context);
            String html = EntityUtils.toString(res2.getEntity());
            boolean contains = html.contains("研究生应用管理平台");
            if (contains) {
                System.out.println("登录成功");

                return cookieStore;
            } else {
                System.out.println("登录失败");
                return null;
            }

        }catch (Exception e){
            return null;
        }



    }

    @Override
    public NcUser getUserInfo(CookieStore cookieStore) {
        HttpClient httpClient;
        HttpClientContext context;
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
            httpClient.execute(get,context);

            String getUserInfoURL = "https://yjspt.xidian.edu.cn/gsapp/sys/wdxj/xjqx/getXsInfo.do";

            HttpPost httpPost = new HttpPost(getUserInfoURL);
            HttpResponse httpResponse = httpClient.execute(httpPost,context);
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
        }catch (Exception e){
            return null;
        }


    }

    @Override
    public String getXsckb(CookieStore cookieStore, String term) {
        HttpClient httpClient;
        HttpClientContext context;
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
        try{
            //cookie
            String accessURL = "https://yjspt.xidian.edu.cn/gsapp/sys/wdkbapp/*default/index.do";
            HttpGet httpGet = new HttpGet(accessURL);
            httpClient.execute(httpGet,context);
            //获取
            String postURL ="https://yjspt.xidian.edu.cn/gsapp/sys/wdkbapp/modules/xskcb/xspkjgcx.do";
            // 构造post数据
            List<NameValuePair> valuePairs =  new  LinkedList<NameValuePair>();
            valuePairs.add( new BasicNameValuePair( "XNXQDM" , "20231"));
            valuePairs.add( new  BasicNameValuePair( "*order" , "-ZCBH"));
            UrlEncodedFormEntity entity =  new  UrlEncodedFormEntity(valuePairs, Consts.UTF_8);

            HttpPost httpPost = new HttpPost(postURL);
            httpPost.setEntity(entity);

            HttpResponse httpResponse = httpClient.execute(httpPost,context);
            HttpEntity entity2 = httpResponse.getEntity();
            String responseString = EntityUtils.toString(entity2, "UTF-8");

            System.out.println(responseString);
            return responseString;
        }catch (Exception e){
            return null;
        }

    }

    private String extractValueFromHtml(String html, String id) {
        // Implement your own logic to解析HTML并提取对应id的值

        Document document = Jsoup.parse(html);
        Element element = document.selectFirst("form#pwdFromId");
        if (element != null) {
            return element.selectFirst("#"+id).val();
        } else {
            return null;
        }
    }
}
