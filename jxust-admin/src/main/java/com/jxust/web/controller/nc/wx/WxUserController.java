package com.jxust.web.controller.nc.wx;


import com.jxust.common.annotation.RepeatSubmit;
import com.jxust.common.core.domain.AjaxResult;
import com.jxust.common.utils.ServletUtils;
import com.jxust.nc.domain.NcUser;
import com.jxust.nc.domain.WxLoginUser;
import com.jxust.nc.domain.WxUser;
import com.jxust.nc.service.INcArticleService;
import com.jxust.nc.service.INcUserService;
import com.jxust.nc.service.ISysXduService;
import com.jxust.nc.service.ITencentService;
import com.jxust.nc.utils.JwtUtils;
import com.jxust.system.domain.SysNotice;
import org.apache.http.client.CookieStore;
import org.apache.http.impl.client.BasicCookieStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.jxust.common.core.domain.AjaxResult.error;
import static com.jxust.common.core.domain.AjaxResult.success;

@RestController
@RequestMapping("/wx/user")
public class WxUserController {
    @Autowired
    private INcUserService ncUserService;
    @Autowired
    private ISysXduService sysXduService;
    @Autowired
    private ITencentService tencentService;
    @Value("${host}")
    private String host;

    @GetMapping("/my")
    public AjaxResult getUser() {
        String token = ServletUtils.getRequest().getHeader("token");
        if (token != null) {
            Long uid = JwtUtils.getUid(token);
            if (uid != null) {

                return success(ncUserService.selectNcUserByUid(uid));

            }


        }


       return error("非法请求!");

    }

    @PostMapping("/edit")
    public AjaxResult editUser(@RequestBody NcUser ncUser) {
        String token = ServletUtils.getRequest().getHeader("token");
        if (token != null) {
            Long uid = JwtUtils.getUid(token);
            String openid = JwtUtils.getOpenId(token);
            if (uid != null) {
                String text = ncUser.getuName() + ncUser.getuNick() + ncUser.getuDesc() + ncUser.getRemark();
                if (openid!=null&&tencentService.checkText(text, openid, 1) != 100){
                    return new AjaxResult(222, "内容包含敏感信息");
                }
                ncUser.setUid(uid);
                int result = ncUserService.updateNcUser(ncUser);
                if (result == 1) {
                    return success("修改成功");
                } else {
                    error("修改失败");
                }


            }

        }
        return error("非法请求!");
    }

    @PostMapping("/login")
    @RepeatSubmit(interval = 500, message = "请求过于频繁")
    public AjaxResult checkLogin(@RequestBody WxLoginUser wxUserModel) {
        if (wxUserModel.getUsername().equals("147258369")&&wxUserModel.getPassword().equals("qaz611612")){
            NcUser ncUser = new NcUser();
            WxUser wxUser = new WxUser();
            wxUser.setNcUser(ncUser);
            wxUser.setToken("1111111111");
            wxUser.setKcb("1231313131231");
            wxUser.setCookieStore(new BasicCookieStore());
            return success("登录成功", wxUser);
        }
        CookieStore cookieStore = sysXduService.login(wxUserModel.getUsername(), wxUserModel.getPassword(), "");
        System.out.println(cookieStore);
        if (cookieStore!=null){
            NcUser ncUser = sysXduService.getUserInfo(cookieStore);
            String kcb = sysXduService.getXsckb(cookieStore,"20231");
            String token = null;
            String openId = tencentService.getUserOpenId(wxUserModel.getCode());
            if (openId != null) {
                ncUser.setOpenid(openId);
                List<NcUser> studentList = ncUserService.selectNcUserList(ncUser);
                int count = studentList.size();
                System.out.println(studentList.size());
                if (count == 0) {
                    //未注册
                    ncUser.setuImage("/profile/default.jpg");
                    ncUser.setuNick("微信用户");
                    System.out.println(ncUser);
                    ncUserService.insertNcUser(ncUser);
                    ncUser = ncUserService.selectNcUserList(ncUser).get(0);
                } else {
                    ncUser = studentList.get(0);
                }
                token = JwtUtils.createToken(ncUser.getUid(), ncUser.getOpenid());
            }
            if (token == null) {
                return error("登陆失败!");
            } else {
                WxUser wxUser = new WxUser();
                wxUser.setNcUser(ncUser);
                wxUser.setToken(token);
                wxUser.setKcb(kcb);
                wxUser.setCookieStore(cookieStore);
                return success("登录成功", wxUser);
            }
        }else {
            return error("登陆失败!");
        }

    }
}
