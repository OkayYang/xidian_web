package com.jxust.nc.service.impl;

import java.util.List;
import com.jxust.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jxust.nc.mapper.NcArticleTypeMapper;
import com.jxust.nc.domain.NcArticleType;
import com.jxust.nc.service.INcArticleTypeService;

/**
 * 文章类目Service业务层处理
 * 
 * @author xuxiaoyang
 * @date 2023-03-28
 */
@Service
public class NcArticleTypeServiceImpl implements INcArticleTypeService 
{
    @Autowired
    private NcArticleTypeMapper ncArticleTypeMapper;

    /**
     * 查询文章类目
     * 
     * @param atId 文章类目主键
     * @return 文章类目
     */
    @Override
    public NcArticleType selectNcArticleTypeByAtId(Long atId)
    {
        return ncArticleTypeMapper.selectNcArticleTypeByAtId(atId);
    }

    /**
     * 查询文章类目列表
     * 
     * @param ncArticleType 文章类目
     * @return 文章类目
     */
    @Override
    public List<NcArticleType> selectNcArticleTypeList(NcArticleType ncArticleType)
    {
        return ncArticleTypeMapper.selectNcArticleTypeList(ncArticleType);
    }

    /**
     * 新增文章类目
     * 
     * @param ncArticleType 文章类目
     * @return 结果
     */
    @Override
    public int insertNcArticleType(NcArticleType ncArticleType)
    {
        ncArticleType.setCreateTime(DateUtils.getNowDate());

        return ncArticleTypeMapper.insertNcArticleType(ncArticleType);
    }

    /**
     * 修改文章类目
     * 
     * @param ncArticleType 文章类目
     * @return 结果
     */
    @Override
    public int updateNcArticleType(NcArticleType ncArticleType)
    {
        return ncArticleTypeMapper.updateNcArticleType(ncArticleType);
    }

    /**
     * 批量删除文章类目
     * 
     * @param atIds 需要删除的文章类目主键
     * @return 结果
     */
    @Override
    public int deleteNcArticleTypeByAtIds(Long[] atIds)
    {
        return ncArticleTypeMapper.deleteNcArticleTypeByAtIds(atIds);
    }

    /**
     * 删除文章类目信息
     * 
     * @param atId 文章类目主键
     * @return 结果
     */
    @Override
    public int deleteNcArticleTypeByAtId(Long atId)
    {
        return ncArticleTypeMapper.deleteNcArticleTypeByAtId(atId);
    }
}
