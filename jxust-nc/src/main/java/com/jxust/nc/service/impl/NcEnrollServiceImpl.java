package com.jxust.nc.service.impl;

import java.util.List;
import com.jxust.common.utils.DateUtils;
import com.jxust.nc.domain.ViewEnroll;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.jxust.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.jxust.nc.domain.NcUser;
import com.jxust.nc.mapper.NcEnrollMapper;
import com.jxust.nc.domain.NcEnroll;
import com.jxust.nc.service.INcEnrollService;

/**
 * 报名记录Service业务层处理
 * 
 * @author xuxiaoyang
 * @date 2023-04-03
 */
@Service
public class NcEnrollServiceImpl implements INcEnrollService 
{
    @Autowired
    private NcEnrollMapper ncEnrollMapper;

    /**
     * 查询报名记录
     * 
     * @param enrollId 报名记录主键
     * @return 报名记录
     */
    @Override
    public NcEnroll selectNcEnrollByEnrollId(Long enrollId)
    {
        return ncEnrollMapper.selectNcEnrollByEnrollId(enrollId);
    }

    /**
     * 查询报名记录列表
     * 
     * @param ncEnroll 报名记录
     * @return 报名记录
     */
    @Override
    public List<NcEnroll> selectNcEnrollList(NcEnroll ncEnroll)
    {
        return ncEnrollMapper.selectNcEnrollList(ncEnroll);
    }

    /**
     * 新增报名记录
     * 
     * @param ncEnroll 报名记录
     * @return 结果
     */
    @Transactional
    @Override
    public int insertNcEnroll(NcEnroll ncEnroll)
    {
        ncEnroll.setCreateTime(DateUtils.getNowDate());
        int rows = ncEnrollMapper.insertNcEnroll(ncEnroll);
        insertNcUser(ncEnroll);
        return rows;
    }

    /**
     * 修改报名记录
     * 
     * @param ncEnroll 报名记录
     * @return 结果
     */
    @Transactional
    @Override
    public int updateNcEnroll(NcEnroll ncEnroll)
    {
        ncEnrollMapper.deleteNcUserByUid(ncEnroll.getEnrollId());
        insertNcUser(ncEnroll);
        return ncEnrollMapper.updateNcEnroll(ncEnroll);
    }

    /**
     * 批量删除报名记录
     * 
     * @param enrollIds 需要删除的报名记录主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteNcEnrollByEnrollIds(Long[] enrollIds)
    {
        ncEnrollMapper.deleteNcUserByUids(enrollIds);
        return ncEnrollMapper.deleteNcEnrollByEnrollIds(enrollIds);
    }

    /**
     * 删除报名记录信息
     * 
     * @param enrollId 报名记录主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteNcEnrollByEnrollId(Long enrollId)
    {
        ncEnrollMapper.deleteNcUserByUid(enrollId);
        return ncEnrollMapper.deleteNcEnrollByEnrollId(enrollId);
    }

    /**
     * 新增用户管理信息
     * 
     * @param ncEnroll 报名记录对象
     */
    public void insertNcUser(NcEnroll ncEnroll)
    {
        List<NcUser> ncUserList = ncEnroll.getNcUserList();
        Long enrollId = ncEnroll.getEnrollId();
        if (StringUtils.isNotNull(ncUserList))
        {
            List<NcUser> list = new ArrayList<NcUser>();
            for (NcUser ncUser : ncUserList)
            {
                ncUser.setUid(enrollId);
                list.add(ncUser);
            }
            if (list.size() > 0)
            {
                ncEnrollMapper.batchNcUser(list);
            }
        }
    }

    /**
     * 查询VIEW
     *
     * @param enrollId VIEW主键
     * @return VIEW
     */
    public ViewEnroll selectViewEnrollByEnrollId(Long enrollId){
        return ncEnrollMapper.selectViewEnrollByEnrollId(enrollId);
    }

    /**
     * 查询VIEW列表
     *
     * @param viewEnroll VIEW
     * @return VIEW集合
     */
    public List<ViewEnroll> selectViewEnrollList(ViewEnroll viewEnroll){
        return ncEnrollMapper.selectViewEnrollList(viewEnroll);
    }
}
