package com.jxust.web.controller.nc;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.jxust.nc.domain.ViewEnroll;
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
import com.jxust.nc.domain.NcEnroll;
import com.jxust.nc.service.INcEnrollService;
import com.jxust.common.utils.poi.ExcelUtil;
import com.jxust.common.core.page.TableDataInfo;

/**
 * 报名记录Controller
 * 
 * @author xuxiaoyang
 * @date 2023-04-03
 */
@RestController
@RequestMapping("/nc/enroll")
public class NcEnrollController extends BaseController
{
    @Autowired
    private INcEnrollService ncEnrollService;

    /**
     * 查询报名记录列表
     */
    @PreAuthorize("@ss.hasPermi('nc:enroll:list')")
    @GetMapping("/list")
    public TableDataInfo list(ViewEnroll ncEnroll)
    {
        startPage();
        List<ViewEnroll> list = ncEnrollService.selectViewEnrollList(ncEnroll);
        return getDataTable(list);
    }

    /**
     * 导出报名记录列表
     */
    @PreAuthorize("@ss.hasPermi('nc:enroll:export')")
    @Log(title = "报名记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ViewEnroll ncEnroll)
    {
        List<ViewEnroll> list = ncEnrollService.selectViewEnrollList(ncEnroll);
        ExcelUtil<ViewEnroll> util = new ExcelUtil<ViewEnroll>(ViewEnroll.class);
        util.exportExcel(response, list, "报名记录数据");
    }

    /**
     * 获取报名记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('nc:enroll:query')")
    @GetMapping(value = "/{enrollId}")
    public AjaxResult getInfo(@PathVariable("enrollId") Long enrollId)
    {
        return success(ncEnrollService.selectViewEnrollByEnrollId(enrollId));
    }

    /**
     * 新增报名记录
     */
    @PreAuthorize("@ss.hasPermi('nc:enroll:add')")
    @Log(title = "报名记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NcEnroll ncEnroll)
    {
        return toAjax(ncEnrollService.insertNcEnroll(ncEnroll));
    }

    /**
     * 修改报名记录
     */
    @PreAuthorize("@ss.hasPermi('nc:enroll:edit')")
    @Log(title = "报名记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NcEnroll ncEnroll)
    {
        return toAjax(ncEnrollService.updateNcEnroll(ncEnroll));
    }

    /**
     * 删除报名记录
     */
    @PreAuthorize("@ss.hasPermi('nc:enroll:remove')")
    @Log(title = "报名记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{enrollIds}")
    public AjaxResult remove(@PathVariable Long[] enrollIds)
    {
        return toAjax(ncEnrollService.deleteNcEnrollByEnrollIds(enrollIds));
    }
}
