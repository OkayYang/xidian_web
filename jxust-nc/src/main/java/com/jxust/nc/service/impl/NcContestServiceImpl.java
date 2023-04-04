package com.jxust.nc.service.impl;

import java.util.List;
import com.jxust.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jxust.nc.mapper.NcContestMapper;
import com.jxust.nc.domain.NcContest;
import com.jxust.nc.service.INcContestService;

/**
 * 发布比赛Service业务层处理
 * 
 * @author xuxiaoyang
 * @date 2023-04-03
 */
@Service
public class NcContestServiceImpl implements INcContestService 
{
    @Autowired
    private NcContestMapper ncContestMapper;

    /**
     * 查询发布比赛
     * 
     * @param contestId 发布比赛主键
     * @return 发布比赛
     */
    @Override
    public NcContest selectNcContestByContestId(Long contestId)
    {
        return ncContestMapper.selectNcContestByContestId(contestId);
    }

    /**
     * 查询发布比赛列表
     * 
     * @param ncContest 发布比赛
     * @return 发布比赛
     */
    @Override
    public List<NcContest> selectNcContestList(NcContest ncContest)
    {
        return ncContestMapper.selectNcContestList(ncContest);
    }

    /**
     * 新增发布比赛
     * 
     * @param ncContest 发布比赛
     * @return 结果
     */
    @Override
    public int insertNcContest(NcContest ncContest)
    {
        ncContest.setCreateTime(DateUtils.getNowDate());
        return ncContestMapper.insertNcContest(ncContest);
    }

    /**
     * 修改发布比赛
     * 
     * @param ncContest 发布比赛
     * @return 结果
     */
    @Override
    public int updateNcContest(NcContest ncContest)
    {
        return ncContestMapper.updateNcContest(ncContest);
    }

    /**
     * 批量删除发布比赛
     * 
     * @param contestIds 需要删除的发布比赛主键
     * @return 结果
     */
    @Override
    public int deleteNcContestByContestIds(Long[] contestIds)
    {
        return ncContestMapper.deleteNcContestByContestIds(contestIds);
    }

    /**
     * 删除发布比赛信息
     * 
     * @param contestId 发布比赛主键
     * @return 结果
     */
    @Override
    public int deleteNcContestByContestId(Long contestId)
    {
        return ncContestMapper.deleteNcContestByContestId(contestId);
    }

    /**
     * 更新浏览量
     * @param contestId
     * @return
     */

    public int updateFlows(Long contestId){
        return ncContestMapper.updateFlows(contestId);
    }
}
