package com.jxust.nc.service;

import java.util.List;
import com.jxust.nc.domain.NcUser;

/**
 * 用户管理Service接口
 * 
 * @author ruoyi
 * @date 2023-03-29
 */
public interface INcUserService 
{
    /**
     * 查询用户管理
     * 
     * @param uid 用户管理主键
     * @return 用户管理
     */
    public NcUser selectNcUserByUid(Long uid);

    /**
     * 查询用户管理列表
     * 
     * @param ncUser 用户管理
     * @return 用户管理集合
     */
    public List<NcUser> selectNcUserList(NcUser ncUser);

    /**
     * 新增用户管理
     * 
     * @param ncUser 用户管理
     * @return 结果
     */
    public int insertNcUser(NcUser ncUser);

    /**
     * 修改用户管理
     * 
     * @param ncUser 用户管理
     * @return 结果
     */
    public int updateNcUser(NcUser ncUser);

    /**
     * 批量删除用户管理
     * 
     * @param uids 需要删除的用户管理主键集合
     * @return 结果
     */
    public int deleteNcUserByUids(Long[] uids);

    /**
     * 删除用户管理信息
     * 
     * @param uid 用户管理主键
     * @return 结果
     */
    public int deleteNcUserByUid(Long uid);
}
