package com.jxust.web.controller.nc.wx;


import com.jxust.common.annotation.RepeatSubmit;
import com.jxust.common.core.domain.AjaxResult;
import com.jxust.nc.domain.NcUser;
import com.jxust.nc.domain.WxLoginUser;
import com.jxust.nc.domain.WxUser;
import com.jxust.nc.service.INcArticleService;
import com.jxust.nc.service.INcUserService;
import com.jxust.nc.service.ITencentService;
import com.jxust.nc.utils.JwtUtils;
import com.jxust.system.domain.SysNotice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static com.jxust.common.core.domain.AjaxResult.error;
import static com.jxust.common.core.domain.AjaxResult.success;

@RestController
@RequestMapping("/wx/user")
public class WxUserController {
    @Autowired
    private INcUserService ncUserService;
    @Autowired
    private ITencentService tencentService;
    @PostMapping("/login")
    @RepeatSubmit(interval = 500, message = "请求过于频繁")
    public AjaxResult checkLogin(@RequestBody WxLoginUser wxUserModel) throws Exception {
        System.out.println(wxUserModel);
        NcUser ncUser = new NcUser();

        String token =null;
        String openId =  tencentService.getUserOpenId(wxUserModel.getCode());
        if (openId!=null){
            ncUser.setOpenid(openId);
            List<NcUser> studentList = ncUserService.selectNcUserList(ncUser);
            int count = studentList.size();
            System.out.println(studentList.size());
            if (count ==0){
                //未注册
                ncUser.setuImage(wxUserModel.getAvatarUrl());
                ncUser.setuNick(wxUserModel.getNickName());
                ncUser.setuSex(wxUserModel.getGender());
                System.out.println(ncUser);
                ncUserService.insertNcUser(ncUser);
                ncUser=ncUserService.selectNcUserList(ncUser).get(0);
            }else {
                ncUser=studentList.get(0);
            }
            token = JwtUtils.createToken(ncUser.getUid());
        }
        if (token == null){
            return error("登陆失败!");
        }else {
            WxUser wxUser = new WxUser();
            wxUser.setNcUser(ncUser);
            wxUser.setToken(token);
            return success("登录成功",wxUser);
        }
    }
}
