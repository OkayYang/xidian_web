package com.jxust.web.controller.nc.wx;
import com.jxust.common.core.controller.BaseController;
import com.jxust.common.core.domain.AjaxResult;
import com.jxust.nc.domain.NcUser;
import com.jxust.nc.domain.WxLoginUser;
import com.jxust.nc.service.INcUserService;
import com.jxust.nc.service.ISysXduService;
import com.jxust.nc.utils.LoginFormEntity;
import com.jxust.nc.utils.Slider;
import com.jxust.nc.utils.Span;
import com.jxust.nc.utils.XduCookie;
import org.apache.http.client.CookieStore;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.apache.http.cookie.Cookie;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/wx/xdu")
public class WxXduController extends BaseController {
    @Autowired
    private INcUserService ncUserService;

    @Autowired
    private ISysXduService sysXduService;

    @GetMapping("/checkNeedCaptcha")
    public LoginFormEntity checkNeedCaptcha(@Param("username") String username) throws IOException {

       return sysXduService.isNeedCaptcha(username);
    }
    @GetMapping("/openSliderCaptcha")
    public Slider openSliderCaptcha(@Param("username") String username) throws IOException {
        return sysXduService.openSliderCaptcha(username);
    }
    @PostMapping("/verifyCaptcha")
    public AjaxResult checkNeedCaptcha(@RequestBody Span span) throws IOException, ClassNotFoundException {

        boolean flag = sysXduService.verifySlider(span);
        if (flag){
            return success("验证成功");
        }else {
            return error("验证失败");
        }

    }



    @PostMapping("/login")
    public AjaxResult bind(@RequestBody NcUser ncUser){

        List<Cookie> cookieStore = sysXduService.login(new WxLoginUser());
        if (cookieStore!=null){
            //sysXduService.getUserInfo(cookieStore);
            return new AjaxResult(200,"登录成功",cookieStore);
        }else {
            return new AjaxResult(404,"登录失败");
        }
    }
    @PostMapping("/xskcb")
    public AjaxResult xskcb(@RequestBody List<XduCookie> cookies){

        List<Cookie> cookiesList =sysXduService.xduCookiesToHttpCookies(cookies);
        String kcb = sysXduService.getXsckb(cookiesList,"20231");
        if (kcb!=null){

            return success(kcb);
        }else {
            return error();
        }
    }
    @PostMapping("/getUserInfo")
    public AjaxResult getUserInfo(@RequestBody List<XduCookie> cookies){
        List<Cookie> cookiesList =sysXduService.xduCookiesToHttpCookies(cookies);

        return success(sysXduService.getUserInfo(cookiesList));
    }
}
