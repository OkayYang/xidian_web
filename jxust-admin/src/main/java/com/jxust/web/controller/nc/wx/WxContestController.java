package com.jxust.web.controller.nc.wx;


import com.jxust.common.core.controller.BaseController;
import com.jxust.common.core.domain.AjaxResult;
import com.jxust.common.utils.ServletUtils;
import com.jxust.nc.domain.NcContest;
import com.jxust.nc.domain.NcEnroll;
import com.jxust.nc.service.INcContestService;
import com.jxust.nc.service.INcEnrollService;
import com.jxust.nc.utils.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/wx/contest")
public class WxContestController extends BaseController {

    @Autowired
    private INcContestService ncContestService;
    @Autowired
    private INcEnrollService ncEnrollService;

    /**
     * 目前举办比赛信息
     * @return
     */

    @GetMapping("/list")
    public AjaxResult contestList(){
        NcContest ncContest = new NcContest();
        ncContest.setStatus("0");
        List<NcContest> ncContests = ncContestService.selectNcContestList(ncContest);
        List<NcEnroll> ncEnrolls = new ArrayList<>();
        String token = ServletUtils.getRequest().getHeader("token");
        if (token!=null){
            Long uid = JwtUtils.getUid(token);
            if (uid!=null){
                NcEnroll ncEnroll = new NcEnroll();
                ncEnroll.setStatus("0");
                ncEnroll.setEnrollUid(uid);
                ncEnrolls = ncEnrollService.selectNcEnrollList(ncEnroll);

            }
        }
        for (NcEnroll enroll:ncEnrolls
             ) {
            for (NcContest contest:ncContests
                 ) {
                if (Objects.equals(enroll.getEnrollCid(), contest.getContestId())){
                    contest.setStatus("1");
                }

            }

        }

        return success(ncContests);
    }

    @GetMapping("/my")
    public AjaxResult myContestList(){
        String token = ServletUtils.getRequest().getHeader("token");
        if (token!=null){

            Long uid = JwtUtils.getUid(token);
            if (uid!=null){
                NcEnroll ncEnroll = new NcEnroll();
                ncEnroll.setStatus("0");
                ncEnroll.setEnrollUid(uid);
                return success(ncEnrollService.selectNcEnrollList(ncEnroll));

            }

        }
        return error("非法请求!");
    }

    @GetMapping("/detail")
    public AjaxResult getArticleById(@RequestParam("cid") Long cid){

        ncContestService.updateFlows(cid);

        return success(ncContestService.selectNcContestByContestId(cid));
    }

    @GetMapping("/enroll/add")
    public AjaxResult enrollContest(@RequestParam("id") Long id){
        String token = ServletUtils.getRequest().getHeader("token");
        if (token!=null){
            Long uid = JwtUtils.getUid(token);
            if (uid!=null){
                NcEnroll ncEnroll = new NcEnroll();
                ncEnroll.setEnrollCid(id);
                ncEnroll.setEnrollUid(uid);
                int result = ncEnrollService.insertNcEnroll(ncEnroll);
                if (result==1){
                    return success("报名成功");
                }else {
                    error("报名失败");
                }
            }

        }
        return error("非法请求!");
    }
}
