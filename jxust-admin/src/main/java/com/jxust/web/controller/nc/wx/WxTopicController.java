package com.jxust.web.controller.nc.wx;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxust.common.core.controller.BaseController;
import com.jxust.common.core.domain.AjaxResult;
import com.jxust.common.core.page.TableDataInfo;
import com.jxust.common.utils.ServletUtils;
import com.jxust.nc.domain.*;
import com.jxust.nc.service.INcDiscussService;
import com.jxust.nc.service.INcTopicService;
import com.jxust.nc.service.INcTopicTypeService;
import com.jxust.nc.utils.JwtUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/wx/topic")
public class WxTopicController extends BaseController {
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
            NcTopic ncTopic = new NcTopic();
            ncTopic.setTopicContent(content);
            ncTopic.setTopicImages(images);
            ncTopic.setTopicTypeId((long)typeId);
            ncTopic.setCreateUid(uid);
            return toAjax(ncTopicService.insertNcTopic(ncTopic));

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
            wxTopic.setUid(JwtUtils.getUid(token));
            return success(ncTopicService.selectWxTopicList(wxTopic));

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

            return success(ncTopicService.updateNcTopic(ncTopic));

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
            ncDiscuss.setCreateUid(uid);
            return toAjax(ncDiscussService.insertNcDiscuss(ncDiscuss));

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
                return toAjax(ncDiscussService.delWxCommentsById(did));

            }

        }
        return error("非法请求!");
    }
















}
