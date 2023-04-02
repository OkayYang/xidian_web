package com.jxust.nc.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.jxust.common.utils.DateUtils;
import com.jxust.nc.domain.WxComment;
import com.jxust.nc.domain.WxTopic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jxust.nc.mapper.NcTopicMapper;
import com.jxust.nc.domain.NcTopic;
import com.jxust.nc.service.INcTopicService;

/**
 * 讨论话题Service业务层处理
 *
 * @author xuxiaoyang
 * @date 2023-03-30
 */
@Service
public class NcTopicServiceImpl implements INcTopicService {
    @Autowired
    private NcTopicMapper ncTopicMapper;

    /**
     * 查询讨论话题
     *
     * @param topicId 讨论话题主键
     * @return 讨论话题
     */
    @Override
    public NcTopic selectNcTopicByTopicId(Long topicId) {
        return ncTopicMapper.selectNcTopicByTopicId(topicId);
    }

    /**
     * 查询讨论话题列表
     *
     * @param ncTopic 讨论话题
     * @return 讨论话题
     */
    @Override
    public List<NcTopic> selectNcTopicList(NcTopic ncTopic) {
        return ncTopicMapper.selectNcTopicList(ncTopic);
    }

    /**
     * 新增讨论话题
     *
     * @param ncTopic 讨论话题
     * @return 结果
     */
    @Override
    public int insertNcTopic(NcTopic ncTopic) {
        ncTopic.setCreateTime(DateUtils.getNowDate());
        return ncTopicMapper.insertNcTopic(ncTopic);
    }

    /**
     * 修改讨论话题
     *
     * @param ncTopic 讨论话题
     * @return 结果
     */
    @Override
    public int updateNcTopic(NcTopic ncTopic) {
        return ncTopicMapper.updateNcTopic(ncTopic);
    }

    /**
     * 批量删除讨论话题
     *
     * @param topicIds 需要删除的讨论话题主键
     * @return 结果
     */
    @Override
    public int deleteNcTopicByTopicIds(Long[] topicIds) {
        return ncTopicMapper.deleteNcTopicByTopicIds(topicIds);
    }

    /**
     * 删除讨论话题信息
     *
     * @param topicId 讨论话题主键
     * @return 结果
     */
    @Override
    public int deleteNcTopicByTopicId(Long topicId) {
        return ncTopicMapper.deleteNcTopicByTopicId(topicId);
    }

    /**
     * 查询微信话题区数据
     */
    public List<WxTopic> selectWxTopicList(WxTopic wxTopic) {
        return ncTopicMapper.selectWxTopicList(wxTopic);
    }

    /**
     * 通过id查询微信话题区数据
     */
    public WxTopic selectWxTopicByTopicId(Long tid) {
        return ncTopicMapper.selectWxTopicByTopicId(tid);
    }
    /**
     * 更新浏览量
     */

    public int updateFlows(Long topicId){
        return ncTopicMapper.updateFlows(topicId);
    }


}
