package com.jxust.nc.service;

import java.util.List;
import com.jxust.nc.domain.NcDiscuss;
import com.jxust.nc.domain.WxComment;
import com.jxust.nc.domain.WxNotice;

/**
 * 评论专区Service接口
 * 
 * @author xuxiaoyang
 * @date 2023-03-30
 */
public interface INcDiscussService 
{
    /**
     * 查询评论专区
     * 
     * @param discussId 评论专区主键
     * @return 评论专区
     */
    public NcDiscuss selectNcDiscussByDiscussId(Long discussId);

    /**
     * 查询评论专区列表
     * 
     * @param ncDiscuss 评论专区
     * @return 评论专区集合
     */
    public List<NcDiscuss> selectNcDiscussList(NcDiscuss ncDiscuss);

    /**
     * 新增评论专区
     * 
     * @param ncDiscuss 评论专区
     * @return 结果
     */
    public int insertNcDiscuss(NcDiscuss ncDiscuss);

    /**
     * 修改评论专区
     * 
     * @param ncDiscuss 评论专区
     * @return 结果
     */
    public int updateNcDiscuss(NcDiscuss ncDiscuss);

    /**
     * 批量删除评论专区
     * 
     * @param discussIds 需要删除的评论专区主键集合
     * @return 结果
     */
    public int deleteNcDiscussByDiscussIds(Long[] discussIds);

    /**
     * 删除评论专区信息
     * 
     * @param discussId 评论专区主键
     * @return 结果
     */
    public int deleteNcDiscussByDiscussId(Long discussId);

    /**
     * 查询话题下评论
     * @param relateId
     * @return
     */

    public List<WxComment> selectWxComments(Long relateId);
    public WxComment selectWxCommentById(Long relateTopicId);
    public List<WxComment> selectWxCommentsByTid(Long tid);
    /**
     * 微信用户删除评论
     */

    public int delWxCommentsById(Long commentId);
    /**
     * 微信用户消息
     */

    public List<WxNotice> selectWxNotice(Long uid);
}
