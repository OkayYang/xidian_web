package com.jxust.nc.mapper;

import java.util.List;
import com.jxust.nc.domain.NcContest;

/**
 * 发布比赛Mapper接口
 * 
 * @author xuxiaoyang
 * @date 2023-04-03
 */
public interface NcContestMapper 
{
    /**
     * 查询发布比赛
     * 
     * @param contestId 发布比赛主键
     * @return 发布比赛
     */
    public NcContest selectNcContestByContestId(Long contestId);

    /**
     * 查询发布比赛列表
     * 
     * @param ncContest 发布比赛
     * @return 发布比赛集合
     */
    public List<NcContest> selectNcContestList(NcContest ncContest);

    /**
     * 新增发布比赛
     * 
     * @param ncContest 发布比赛
     * @return 结果
     */
    public int insertNcContest(NcContest ncContest);

    /**
     * 修改发布比赛
     * 
     * @param ncContest 发布比赛
     * @return 结果
     */
    public int updateNcContest(NcContest ncContest);

    /**
     * 删除发布比赛
     * 
     * @param contestId 发布比赛主键
     * @return 结果
     */
    public int deleteNcContestByContestId(Long contestId);

    /**
     * 批量删除发布比赛
     * 
     * @param contestIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNcContestByContestIds(Long[] contestIds);

    /**
     * 更新浏览量
     * @param contestId
     * @return
     */

    public int updateFlows(Long contestId);
}
