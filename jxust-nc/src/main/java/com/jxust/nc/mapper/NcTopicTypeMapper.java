package com.jxust.nc.mapper;

import com.jxust.nc.domain.NcTopicType;

import java.util.List;


/**
 * 话题类别Mapper接口
 * 
 * @author xuxiaoyang
 * @date 2023-03-29
 */
public interface NcTopicTypeMapper 
{
    /**
     * 查询话题类别
     * 
     * @param ttId 话题类别主键
     * @return 话题类别
     */
    public NcTopicType selectNcTopicTypeByTtId(Long ttId);

    /**
     * 查询话题类别列表
     * 
     * @param ncTopicType 话题类别
     * @return 话题类别集合
     */
    public List<NcTopicType> selectNcTopicTypeList(NcTopicType ncTopicType);

    /**
     * 新增话题类别
     * 
     * @param ncTopicType 话题类别
     * @return 结果
     */
    public int insertNcTopicType(NcTopicType ncTopicType);

    /**
     * 修改话题类别
     * 
     * @param ncTopicType 话题类别
     * @return 结果
     */
    public int updateNcTopicType(NcTopicType ncTopicType);

    /**
     * 删除话题类别
     * 
     * @param ttId 话题类别主键
     * @return 结果
     */
    public int deleteNcTopicTypeByTtId(Long ttId);

    /**
     * 批量删除话题类别
     * 
     * @param ttIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNcTopicTypeByTtIds(Long[] ttIds);
}
