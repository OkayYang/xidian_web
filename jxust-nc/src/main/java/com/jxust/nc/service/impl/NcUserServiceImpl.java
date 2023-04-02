package com.jxust.nc.service.impl;

import java.util.List;
import com.jxust.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jxust.nc.mapper.NcUserMapper;
import com.jxust.nc.domain.NcUser;
import com.jxust.nc.service.INcUserService;

/**
 * 用户管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-03-29
 */
@Service
public class NcUserServiceImpl implements INcUserService 
{
    @Autowired
    private NcUserMapper ncUserMapper;

    /**
     * 查询用户管理
     * 
     * @param uid 用户管理主键
     * @return 用户管理
     */
    @Override
    public NcUser selectNcUserByUid(Long uid)
    {
        return ncUserMapper.selectNcUserByUid(uid);
    }

    /**
     * 查询用户管理列表
     * 
     * @param ncUser 用户管理
     * @return 用户管理
     */
    @Override
    public List<NcUser> selectNcUserList(NcUser ncUser)
    {
        return ncUserMapper.selectNcUserList(ncUser);
    }

    /**
     * 新增用户管理
     * 
     * @param ncUser 用户管理
     * @return 结果
     */
    @Override
    public int insertNcUser(NcUser ncUser)
    {
        ncUser.setCreateTime(DateUtils.getNowDate());
        return ncUserMapper.insertNcUser(ncUser);
    }

    /**
     * 修改用户管理
     * 
     * @param ncUser 用户管理
     * @return 结果
     */
    @Override
    public int updateNcUser(NcUser ncUser)
    {
        return ncUserMapper.updateNcUser(ncUser);
    }

    /**
     * 批量删除用户管理
     * 
     * @param uids 需要删除的用户管理主键
     * @return 结果
     */
    @Override
    public int deleteNcUserByUids(Long[] uids)
    {
        return ncUserMapper.deleteNcUserByUids(uids);
    }

    /**
     * 删除用户管理信息
     * 
     * @param uid 用户管理主键
     * @return 结果
     */
    @Override
    public int deleteNcUserByUid(Long uid)
    {
        return ncUserMapper.deleteNcUserByUid(uid);
    }
}
