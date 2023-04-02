package com.jxust.nc.mapper;

import java.util.List;
import com.jxust.nc.domain.NcTopic;
import com.jxust.nc.domain.WxTopic;

/**
 * 讨论话题Mapper接口
 * 
 * @author xuxiaoyang
 * @date 2023-03-30
 */
public interface NcTopicMapper 
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
     * 删除讨论话题
     * 
     * @param topicId 讨论话题主键
     * @return 结果
     */
    public int deleteNcTopicByTopicId(Long topicId);

    /**
     * 批量删除讨论话题
     * 
     * @param topicIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNcTopicByTopicIds(Long[] topicIds);
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
