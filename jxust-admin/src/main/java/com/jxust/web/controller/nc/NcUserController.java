package com.jxust.web.controller.nc;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.jxust.common.annotation.Log;
import com.jxust.common.core.controller.BaseController;
import com.jxust.common.core.domain.AjaxResult;
import com.jxust.common.enums.BusinessType;
import com.jxust.nc.domain.NcUser;
import com.jxust.nc.service.INcUserService;
import com.jxust.common.utils.poi.ExcelUtil;
import com.jxust.common.core.page.TableDataInfo;

/**
 * 用户管理Controller
 * 
 * @author ruoyi
 * @date 2023-03-29
 */
@RestController
@RequestMapping("/nc/user")
public class NcUserController extends BaseController
{
    @Autowired
    private INcUserService ncUserService;

    /**
     * 查询用户管理列表
     */
    @PreAuthorize("@ss.hasPermi('nc:user:list')")
    @GetMapping("/list")
    public TableDataInfo list(NcUser ncUser)
    {
        startPage();
        List<NcUser> list = ncUserService.selectNcUserList(ncUser);
        return getDataTable(list);
    }

    /**
     * 导出用户管理列表
     */
    @PreAuthorize("@ss.hasPermi('nc:user:export')")
    @Log(title = "用户管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NcUser ncUser)
    {
        List<NcUser> list = ncUserService.selectNcUserList(ncUser);
        ExcelUtil<NcUser> util = new ExcelUtil<NcUser>(NcUser.class);
        util.exportExcel(response, list, "用户管理数据");
    }

    /**
     * 获取用户管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('nc:user:query')")
    @GetMapping(value = "/{uid}")
    public AjaxResult getInfo(@PathVariable("uid") Long uid)
    {
        return success(ncUserService.selectNcUserByUid(uid));
    }

    /**
     * 新增用户管理
     */
    @PreAuthorize("@ss.hasPermi('nc:user:add')")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NcUser ncUser)
    {
        return toAjax(ncUserService.insertNcUser(ncUser));
    }

    /**
     * 修改用户管理
     */
    @PreAuthorize("@ss.hasPermi('nc:user:edit')")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NcUser ncUser)
    {
        return toAjax(ncUserService.updateNcUser(ncUser));
    }

    /**
     * 删除用户管理
     */
    @PreAuthorize("@ss.hasPermi('nc:user:remove')")
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{uids}")
    public AjaxResult remove(@PathVariable Long[] uids)
    {
        return toAjax(ncUserService.deleteNcUserByUids(uids));
    }
}
