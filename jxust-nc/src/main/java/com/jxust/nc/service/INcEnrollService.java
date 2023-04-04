package com.jxust.nc.service;

import java.util.List;
import com.jxust.nc.domain.NcEnroll;
import com.jxust.nc.domain.ViewEnroll;

/**
 * 报名记录Service接口
 * 
 * @author xuxiaoyang
 * @date 2023-04-03
 */
public interface INcEnrollService 
{
    /**
     * 查询报名记录
     * 
     * @param enrollId 报名记录主键
     * @return 报名记录
     */
    public NcEnroll selectNcEnrollByEnrollId(Long enrollId);

    /**
     * 查询报名记录列表
     * 
     * @param ncEnroll 报名记录
     * @return 报名记录集合
     */
    public List<NcEnroll> selectNcEnrollList(NcEnroll ncEnroll);

    /**
     * 新增报名记录
     * 
     * @param ncEnroll 报名记录
     * @return 结果
     */
    public int insertNcEnroll(NcEnroll ncEnroll);

    /**
     * 修改报名记录
     * 
     * @param ncEnroll 报名记录
     * @return 结果
     */
    public int updateNcEnroll(NcEnroll ncEnroll);

    /**
     * 批量删除报名记录
     * 
     * @param enrollIds 需要删除的报名记录主键集合
     * @return 结果
     */
    public int deleteNcEnrollByEnrollIds(Long[] enrollIds);

    /**
     * 删除报名记录信息
     * 
     * @param enrollId 报名记录主键
     * @return 结果
     */
    public int deleteNcEnrollByEnrollId(Long enrollId);

    /**
     * 查询VIEW
     *
     * @param enrollId VIEW主键
     * @return VIEW
     */
    public ViewEnroll selectViewEnrollByEnrollId(Long enrollId);

    /**
     * 查询VIEW列表
     *
     * @param viewEnroll VIEW
     * @return VIEW集合
     */
    public List<ViewEnroll> selectViewEnrollList(ViewEnroll viewEnroll);
}
