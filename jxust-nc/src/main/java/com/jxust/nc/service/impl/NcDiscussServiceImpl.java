package com.jxust.nc.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.jxust.common.exception.ServiceException;
import com.jxust.common.utils.DateUtils;
import com.jxust.nc.domain.WxComment;
import com.jxust.nc.domain.WxNotice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jxust.nc.mapper.NcDiscussMapper;
import com.jxust.nc.domain.NcDiscuss;
import com.jxust.nc.service.INcDiscussService;

/**
 * 评论专区Service业务层处理
 *
 * @author xuxiaoyang
 * @date 2023-03-30
 */
@Service
public class NcDiscussServiceImpl implements INcDiscussService {
    @Autowired
    private NcDiscussMapper ncDiscussMapper;

    /**
     * 查询评论专区
     *
     * @param discussId 评论专区主键
     * @return 评论专区
     */
    @Override
    public NcDiscuss selectNcDiscussByDiscussId(Long discussId) {
        return ncDiscussMapper.selectNcDiscussByDiscussId(discussId);
    }

    /**
     * 查询评论专区列表
     *
     * @param ncDiscuss 评论专区
     * @return 评论专区
     */
    @Override
    public List<NcDiscuss> selectNcDiscussList(NcDiscuss ncDiscuss) {
        return ncDiscussMapper.selectNcDiscussList(ncDiscuss);
    }

    /**
     * 新增评论专区
     *
     * @param ncDiscuss 评论专区
     * @return 结果
     */
    @Override
    public int insertNcDiscuss(NcDiscuss ncDiscuss) {
        if (ncDiscuss.getParentId() != 0L) {
            NcDiscuss info = ncDiscussMapper.selectNcDiscussByDiscussId(ncDiscuss.getParentId());
            // 如果父节点不为正常状态,则不允许新增子节点
            if (Objects.equals(info.getStatus(), "1")) {
                throw new ServiceException("该评论停用，不允许进行回复");
            }
            if (info.getAncestors()==null){
                ncDiscuss.setAncestors(ncDiscuss.getParentId().toString());
            }else {
                ncDiscuss.setAncestors(info.getAncestors() + "," + ncDiscuss.getParentId());

            }




        }


        ncDiscuss.setCreateTime(DateUtils.getNowDate());
        return ncDiscussMapper.insertNcDiscuss(ncDiscuss);
    }

    /**
     * 修改评论专区
     *
     * @param ncDiscuss 评论专区
     * @return 结果
     */
    @Override
    public int updateNcDiscuss(NcDiscuss ncDiscuss) {
        return ncDiscussMapper.updateNcDiscuss(ncDiscuss);
    }

    /**
     * 批量删除评论专区
     *
     * @param discussIds 需要删除的评论专区主键
     * @return 结果
     */
    @Override
    public int deleteNcDiscussByDiscussIds(Long[] discussIds) {
        return ncDiscussMapper.deleteNcDiscussByDiscussIds(discussIds);
    }

    /**
     * 删除评论专区信息
     *
     * @param discussId 评论专区主键
     * @return 结果
     */
    @Override
    public int deleteNcDiscussByDiscussId(Long discussId) {
        return ncDiscussMapper.deleteNcDiscussByDiscussId(discussId);
    }

    /**
     * 查询微信评论
     *
     * @param relateId
     * @return
     */
    public List<WxComment> selectWxComments(Long relateId) {
        return ncDiscussMapper.selectWxComments(relateId);

    }
    /**
     * 微信用户删除评论
     */

    public int delWxCommentsById(Long commentId){
        return ncDiscussMapper.delWxCommentsById(commentId);
    }
    /**
     * 微信用户消息
     */

    public List<WxNotice> selectWxNotice(Long uid){
        return ncDiscussMapper.selectWxNotice(uid);
    }


    public WxComment selectWxCommentById(Long discussId) {
        return ncDiscussMapper.selectWxCommentById(discussId);
    }

    public List<WxComment> selectWxCommentsByTid(Long tid) {
        return buildCommentTree(selectWxComments(tid));
    }


    private List<WxComment> buildCommentTree(List<WxComment> comments) {
        List<WxComment> root = new ArrayList<>();
        for (WxComment firstComments : comments
        ) {
            if (firstComments.getParentId() == 0L) {
                firstComments.setChildrenComments(findTree(firstComments.getDiscussId(), firstComments.getDiscussId(), comments));
                root.add(firstComments);
            }
        }

//        for (WxComment rootItem : root
//        ) {
//            for (WxComment secondItem : rootItem.getChildrenComments()
//            ) {
//                WxComment wxComment = findParent(secondItem.getParentId());
//                secondItem.setParentComments(wxComment);
//            }
//
//
//        }

        return root;
    }

    private List<WxComment> findTree(Long rootId, Long parentId, List<WxComment> comments) {
        List<WxComment> result = new ArrayList<>();
        for (WxComment comment : comments) {
            if (comment.getParentId() != 0L && comment.getParentId().equals(parentId)) {
                if (!Objects.equals(rootId, parentId)) {
                    comment.setParentComments(findParent(comment.getParentId()));
                }
                // 如果当前评论的parentId等于指定的parentId，则将该评论加入结果列表

                result.add(comment);
                // 递归查询该评论下的所有子评论，并将其加入结果列表
                List<WxComment> children = findTree(rootId, comment.getDiscussId(), comments);
                result.addAll(children);
            }
        }
        return result;
    }

    private WxComment findParent(Long parentId) {


        return ncDiscussMapper.selectWxCommentById(parentId);

    }
}
