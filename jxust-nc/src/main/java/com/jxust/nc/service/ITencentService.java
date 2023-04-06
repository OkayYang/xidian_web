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
    /**
     * 敏感词汇检测
     * @param text 检测文本
     * @param openid 用户openid
     * @param scene 场景枚举值（1 资料；2 评论；3 论坛；4 社交日志）
     * @return label 命中标签枚举值，100 正常；10001 广告；20001 时政；20002 色情；20003 辱骂；20006 违法犯罪；20008 欺诈；20012 低俗；20013 版权；21000 其他
     */
    public  int checkText(String text,String openid,int scene);

    /**
     * 敏感词汇检测
     * @param url 检测media的url
     * @param openid 用户openid
     * @param scene 场景枚举值（1 资料；2 评论；3 论坛；4 社交日志）
     * @return label 命中标签枚举值，100 正常；10001 广告；20001 时政；20002 色情；20003 辱骂；20006 违法犯罪；20008 欺诈；20012 低俗；20013 版权；21000 其他
     */
    public  int checkMedia(String url,String openid,int scene);


}
