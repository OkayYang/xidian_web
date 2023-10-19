package com.jxust.web.controller.nc.wx;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxust.common.annotation.Log;
import com.jxust.common.core.controller.BaseController;
import com.jxust.common.core.domain.AjaxResult;
import com.jxust.common.core.page.TableDataInfo;
import com.jxust.common.utils.ServletUtils;
import com.jxust.nc.domain.*;
import com.jxust.nc.service.INcDiscussService;
import com.jxust.nc.service.INcTopicService;
import com.jxust.nc.service.INcTopicTypeService;
import com.jxust.nc.service.ITencentService;
import com.jxust.nc.utils.JwtUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/wx/topic")
public class WxTopicController extends BaseController {
    @Value("${host}")
    private String host;
    @Autowired
    private ITencentService tencentService;
    @Autowired
    private INcTopicTypeService ncTopicTypeService;
    @Autowired
    private INcTopicService ncTopicService;
    @Autowired
    private INcDiscussService ncDiscussService;


    @GetMapping("/type")
    public AjaxResult getTopicType(){
        NcTopicType ncTopicType = new NcTopicType();
        ncTopicType.setStatus("0");
        return success(ncTopicTypeService.selectNcTopicTypeList(ncTopicType));

    }
    @PostMapping("/add")
    public AjaxResult addTopic(@RequestBody Map<String, Object> requestBody){
        String content = (String) requestBody.get("content");
        int typeId = (Integer) requestBody.get("topicTypeId");
        String images = (String) requestBody.get("topicImages");
        String token = ServletUtils.getRequest().getHeader("token");
        if (token!=null){
            Long uid = JwtUtils.getUid(token);
            String openid = JwtUtils.getOpenId(token);
            if (uid!=null) {
                if (openid!=null&&tencentService.checkText(content, openid, 3) != 100){
                    return new AjaxResult(222, "内容包含敏感信息");
                }
                NcTopic ncTopic = new NcTopic();
                ncTopic.setTopicContent(content);
                ncTopic.setTopicImages(images);
                ncTopic.setTopicTypeId((long) typeId);
                ncTopic.setCreateUid(uid);
                int result = ncTopicService.insertNcTopic(ncTopic);
                if (result == 1) {
                    return success("发布成功");
                } else {
                    return error("发布失败");
                }

            }


        }
        return error("非法请求!");

    }
    @GetMapping("/list")
    public AjaxResult topicList(){
        WxTopic wxTopic = new WxTopic();
        return success(ncTopicService.selectWxTopicList(wxTopic));
    }
    @GetMapping("/list/{typeId}")
    public TableDataInfo selectTopicListByTypeId(@PathVariable("typeId") Long typeId){

        startPage();
        WxTopic wxTopic = new WxTopic();
        if (typeId!=0L){
            wxTopic.setTopicTypeId(typeId);
        }
        List<WxTopic> list = ncTopicService.selectWxTopicList(wxTopic);
        return getDataTable(list);
    }
    @GetMapping("/notice/list")
    public AjaxResult topicNotice(){
        String token = ServletUtils.getRequest().getHeader("token");
        if (token!=null){

            Long uid = JwtUtils.getUid(token);
            return success(ncDiscussService.selectWxNotice(uid));

        }
        return error("非法请求!");
    }

    @GetMapping("/list/my")
    public AjaxResult myTopicList(){
        String token = ServletUtils.getRequest().getHeader("token");
        if (token!=null){
            WxTopic wxTopic = new WxTopic();
            Long uid = JwtUtils.getUid(token);
            if (uid!=null){
                wxTopic.setUid(uid);
                return success(ncTopicService.selectWxTopicList(wxTopic));
            }


        }
        return error("非法请求!");
    }
    @GetMapping("/list/my/del")
    public AjaxResult delMyTopic(@RequestParam("tid")Long tid){
        String token = ServletUtils.getRequest().getHeader("token");
        if (token!=null){
            NcTopic ncTopic = new NcTopic();
            ncTopic.setStatus("1");
            ncTopic.setTopicId(tid);
            ncTopic.setCreateUid(JwtUtils.getUid(token));

            int result = ncTopicService.updateNcTopic(ncTopic);
            if(result==1){
                return success("删除成功");
            }else {
                return error("删除失败");
            }



        }
        return error("非法请求!");
    }

    @GetMapping("/detail/{tid}")
    public AjaxResult detailTopic(@PathVariable("tid") Long tid){

        return success(ncTopicService.selectWxTopicByTopicId(tid));
    }


    @GetMapping("/detail/comments/{tid}")
    public AjaxResult detailTopicComments(@PathVariable("tid") Long tid){

        ncTopicService.updateFlows(tid);

        return success(ncDiscussService.selectWxCommentsByTid(tid));
    }
//    public List<WxComment> reconstructComments(List<WxComment> comments, long parentId) {
//        List<WxComment> result = new ArrayList<>();
//        for (WxComment comment : comments) {
//            if (comment.getParentId() == parentId) {
//                List<WxComment> replyComments = reconstructComments(comments, comment.getDiscussId());
//                comment.setReplyComments(replyComments);
//                result.add(comment);
//            }
//        }
//        return result;
//    }
    @PostMapping("/detail/comment/add")
    public AjaxResult addComment(@RequestBody NcDiscuss ncDiscuss){
        String token = ServletUtils.getRequest().getHeader("token");
        if (token!=null){

            Long uid = JwtUtils.getUid(token);
            String openid = JwtUtils.getOpenId(token);
            if (uid!=null){
                System.out.println(openid);
                if (openid!=null&&tencentService.checkText(ncDiscuss.getDiscussContent(), openid, 3) != 100){
                    return new AjaxResult(222, "内容包含敏感信息");
                }
                ncDiscuss.setCreateUid(uid);
                int result = ncDiscussService.insertNcDiscuss(ncDiscuss);
                if(result==1){
                    return success("评论成功");
                }else {
                    return error("评论失败");
                }


            }



        }
        return error("非法请求!");
    }

    @GetMapping("/detail/comment/del/{did}")
    public AjaxResult delComment(@PathVariable("did") Long did){
        String token = ServletUtils.getRequest().getHeader("token");
        if (token!=null){
            //展示不做处理用户非法删帖
            Long uid = JwtUtils.getUid(token);
            if (uid!=null){

                int result = ncDiscussService.delWxCommentsById(did);
                if(result==1){
                    return success("删除成功");
                }else {
                    return error("删除失败");
                }


            }

        }
        return error("非法请求!");
    }
















}
