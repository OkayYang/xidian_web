package com.jxust.web.controller.nc.wx;


import com.jxust.common.core.controller.BaseController;
import com.jxust.common.core.domain.AjaxResult;
import com.jxust.nc.domain.NcUser;
import com.jxust.nc.service.INcUserService;
import com.jxust.nc.service.ISysXduService;
import org.apache.http.client.CookieStore;
import org.apache.http.impl.client.BasicCookieStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/wx/xdu")
public class WxXduController extends BaseController {
    @Autowired
    private INcUserService ncUserService;

    @Autowired
    private ISysXduService sysXduService;


    @PostMapping("/login")
    public AjaxResult bind(@RequestBody NcUser ncUser){

        CookieStore cookieStore = sysXduService.login(ncUser.getuXh().toString(),ncUser.getuPassword(),"");
        if (cookieStore!=null){
            sysXduService.getUserInfo(cookieStore);
            return new AjaxResult(200,"登录成功",cookieStore);
        }else {
            return new AjaxResult(404,"登录失败");
        }
    }
    @PostMapping("/xskcb")
    public AjaxResult xskcb(@RequestBody CookieStore cookie){

        String kcb = sysXduService.getXsckb(cookie,"20231");

        if (kcb!=null){

            return success(kcb);
        }else {
            return error();
        }
    }
}
