package com.jxust.nc.mapper;

import java.util.List;
import com.jxust.nc.domain.NcArticleType;

/**
 * 文章类目Mapper接口
 *
 * @author xuxiaoyang
 * @date 2023-03-28
 */
public interface NcArticleTypeMapper
{
    /**
     * 查询文章类目
     *
     * @param atId 文章类目主键
     * @return 文章类目
     */
    public NcArticleType selectNcArticleTypeByAtId(Long atId);

    /**
     * 查询文章类目列表
     *
     * @param ncArticleType 文章类目
     * @return 文章类目集合
     */
    public List<NcArticleType> selectNcArticleTypeList(NcArticleType ncArticleType);

    /**
     * 新增文章类目
     *
     * @param ncArticleType 文章类目
     * @return 结果
     */
    public int insertNcArticleType(NcArticleType ncArticleType);

    /**
     * 修改文章类目
     *
     * @param ncArticleType 文章类目
     * @return 结果
     */
    public int updateNcArticleType(NcArticleType ncArticleType);

    /**
     * 删除文章类目
     *
     * @param atId 文章类目主键
     * @return 结果
     */
    public int deleteNcArticleTypeByAtId(Long atId);

    /**
     * 批量删除文章类目
     *
     * @param atIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNcArticleTypeByAtIds(Long[] atIds);
}
