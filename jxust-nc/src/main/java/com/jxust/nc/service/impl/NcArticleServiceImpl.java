package com.jxust.nc.service.impl;

import java.util.List;
import com.jxust.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jxust.nc.mapper.NcArticleMapper;
import com.jxust.nc.domain.NcArticle;
import com.jxust.nc.service.INcArticleService;

/**
 * 文章管理Service业务层处理
 * 
 * @author xuxiaoyang
 * @date 2023-03-28
 */
@Service
public class NcArticleServiceImpl implements INcArticleService 
{
    @Autowired
    private NcArticleMapper ncArticleMapper;

    /**
     * 查询文章管理
     * 
     * @param articleId 文章管理主键
     * @return 文章管理
     */
    @Override
    public NcArticle selectNcArticleByArticleId(Long articleId)
    {
        return ncArticleMapper.selectNcArticleByArticleId(articleId);
    }

    /**
     * 查询文章管理列表
     * 
     * @param ncArticle 文章管理
     * @return 文章管理
     */
    @Override
    public List<NcArticle> selectNcArticleList(NcArticle ncArticle)
    {
        return ncArticleMapper.selectNcArticleList(ncArticle);
    }

    /**
     * 新增文章管理
     * 
     * @param ncArticle 文章管理
     * @return 结果
     */
    @Override
    public int insertNcArticle(NcArticle ncArticle)
    {
        ncArticle.setCreateTime(DateUtils.getNowDate());

        return ncArticleMapper.insertNcArticle(ncArticle);
    }

    /**
     * 修改文章管理
     * 
     * @param ncArticle 文章管理
     * @return 结果
     */
    @Override
    public int updateNcArticle(NcArticle ncArticle)
    {
        return ncArticleMapper.updateNcArticle(ncArticle);
    }

    /**
     * 批量删除文章管理
     * 
     * @param articleIds 需要删除的文章管理主键
     * @return 结果
     */
    @Override
    public int deleteNcArticleByArticleIds(Long[] articleIds)
    {
        return ncArticleMapper.deleteNcArticleByArticleIds(articleIds);
    }

    /**
     * 删除文章管理信息
     * 
     * @param articleId 文章管理主键
     * @return 结果
     */
    @Override
    public int deleteNcArticleByArticleId(Long articleId)
    {
        return ncArticleMapper.deleteNcArticleByArticleId(articleId);
    }

    /**
     * 更新浏览量
     */

    public int updateFlows(Long articleId){
        return ncArticleMapper.updateFlows(articleId);
    }
}
