package com.jxust.nc.service;

import java.util.List;
import com.jxust.nc.domain.NcTopic;
import com.jxust.nc.domain.WxTopic;

/**
 * 讨论话题Service接口
 * 
 * @author xuxiaoyang
 * @date 2023-03-30
 */
public interface INcTopicService 
{
    /**
     * 查询讨论话题
     * 
     * @param topicId 讨论话题主键
     * @return 讨论话题
     */
    public NcTopic selectNcTopicByTopicId(Long topicId);

    /**
     * 查询讨论话题列表
     * 
     * @param ncTopic 讨论话题
     * @return 讨论话题集合
     */
    public List<NcTopic> selectNcTopicList(NcTopic ncTopic);

    /**
     * 新增讨论话题
     * 
     * @param ncTopic 讨论话题
     * @return 结果
     */
    public int insertNcTopic(NcTopic ncTopic);

    /**
     * 修改讨论话题
     * 
     * @param ncTopic 讨论话题
     * @return 结果
     */
    public int updateNcTopic(NcTopic ncTopic);

    /**
     * 批量删除讨论话题
     * 
     * @param topicIds 需要删除的讨论话题主键集合
     * @return 结果
     */
    public int deleteNcTopicByTopicIds(Long[] topicIds);

    /**
     * 删除讨论话题信息
     * 
     * @param topicId 讨论话题主键
     * @return 结果
     */
    public int deleteNcTopicByTopicId(Long topicId);
    /**
     * 查询微信话题区数据
     */
    public List<WxTopic> selectWxTopicList(WxTopic wxTopic);
    /**
     * 通过id查询微信话题区数据
     */
    public WxTopic selectWxTopicByTopicId(Long tid);
    /**
     * 更新浏览量
     */

    public int updateFlows(Long topicId);
}
