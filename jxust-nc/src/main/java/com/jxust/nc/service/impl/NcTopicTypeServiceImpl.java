package com.jxust.nc.service.impl;

import java.util.List;
import com.jxust.common.utils.DateUtils;
import com.jxust.nc.mapper.NcTopicTypeMapper;
import com.jxust.nc.service.INcTopicTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jxust.nc.domain.NcTopicType;


/**
 * 话题类别Service业务层处理
 * 
 * @author xuxiaoyang
 * @date 2023-03-29
 */
@Service
public class NcTopicTypeServiceImpl implements INcTopicTypeService
{
    @Autowired
    private NcTopicTypeMapper ncTopicTypeMapper;

    /**
     * 查询话题类别
     * 
     * @param ttId 话题类别主键
     * @return 话题类别
     */
    @Override
    public NcTopicType selectNcTopicTypeByTtId(Long ttId)
    {
        return ncTopicTypeMapper.selectNcTopicTypeByTtId(ttId);
    }

    /**
     * 查询话题类别列表
     * 
     * @param ncTopicType 话题类别
     * @return 话题类别
     */
    @Override
    public List<NcTopicType> selectNcTopicTypeList(NcTopicType ncTopicType)
    {
        return ncTopicTypeMapper.selectNcTopicTypeList(ncTopicType);
    }

    /**
     * 新增话题类别
     * 
     * @param ncTopicType 话题类别
     * @return 结果
     */
    @Override
    public int insertNcTopicType(NcTopicType ncTopicType)
    {
        ncTopicType.setCreateTime(DateUtils.getNowDate());
        return ncTopicTypeMapper.insertNcTopicType(ncTopicType);
    }

    /**
     * 修改话题类别
     * 
     * @param ncTopicType 话题类别
     * @return 结果
     */
    @Override
    public int updateNcTopicType(NcTopicType ncTopicType)
    {
        return ncTopicTypeMapper.updateNcTopicType(ncTopicType);
    }

    /**
     * 批量删除话题类别
     * 
     * @param ttIds 需要删除的话题类别主键
     * @return 结果
     */
    @Override
    public int deleteNcTopicTypeByTtIds(Long[] ttIds)
    {
        return ncTopicTypeMapper.deleteNcTopicTypeByTtIds(ttIds);
    }

    /**
     * 删除话题类别信息
     * 
     * @param ttId 话题类别主键
     * @return 结果
     */
    @Override
    public int deleteNcTopicTypeByTtId(Long ttId)
    {
        return ncTopicTypeMapper.deleteNcTopicTypeByTtId(ttId);
    }
}
