package com.jxust.nc.service;

import java.util.List;
import com.jxust.nc.domain.NcArticle;

/**
 * 文章管理Service接口
 * 
 * @author xuxiaoyang
 * @date 2023-03-28
 */
public interface INcArticleService 
{
    /**
     * 查询文章管理
     * 
     * @param articleId 文章管理主键
     * @return 文章管理
     */
    public NcArticle selectNcArticleByArticleId(Long articleId);

    /**
     * 查询文章管理列表
     * 
     * @param ncArticle 文章管理
     * @return 文章管理集合
     */
    public List<NcArticle> selectNcArticleList(NcArticle ncArticle);

    /**
     * 新增文章管理
     * 
     * @param ncArticle 文章管理
     * @return 结果
     */
    public int insertNcArticle(NcArticle ncArticle);

    /**
     * 修改文章管理
     * 
     * @param ncArticle 文章管理
     * @return 结果
     */
    public int updateNcArticle(NcArticle ncArticle);

    /**
     * 批量删除文章管理
     * 
     * @param articleIds 需要删除的文章管理主键集合
     * @return 结果
     */
    public int deleteNcArticleByArticleIds(Long[] articleIds);

    /**
     * 删除文章管理信息
     * 
     * @param articleId 文章管理主键
     * @return 结果
     */
    public int deleteNcArticleByArticleId(Long articleId);
}
