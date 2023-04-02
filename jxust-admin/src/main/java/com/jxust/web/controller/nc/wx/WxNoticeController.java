package com.jxust.web.controller.nc.wx;

import com.jxust.common.core.controller.BaseController;
import com.jxust.common.core.domain.AjaxResult;
import com.jxust.nc.service.INcArticleTypeService;
import com.jxust.system.domain.SysNotice;
import com.jxust.system.service.ISysNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/wx/notice")
public class WxNoticeController extends BaseController {

    @Autowired
    private ISysNoticeService sysNoticeService;

    @GetMapping("/roll")
    public AjaxResult getNotice(){
        SysNotice sysNotice = new SysNotice();
        sysNotice.setStatus("0");
        List<SysNotice> sysNotices = sysNoticeService.selectNoticeList(sysNotice);
        return success(sysNotices.get(0));
    }
}
