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
import com.jxust.nc.domain.NcDiscuss;
import com.jxust.nc.service.INcDiscussService;
import com.jxust.common.utils.poi.ExcelUtil;

/**
 * 评论专区Controller
 * 
 * @author xuxiaoyang
 * @date 2023-03-30
 */
@RestController
@RequestMapping("/nc/discuss")
public class NcDiscussController extends BaseController
{
    @Autowired
    private INcDiscussService ncDiscussService;

    /**
     * 查询评论专区列表
     */
    @PreAuthorize("@ss.hasPermi('nc:discuss:list')")
    @GetMapping("/list")
    public AjaxResult list(NcDiscuss ncDiscuss)
    {
        List<NcDiscuss> list = ncDiscussService.selectNcDiscussList(ncDiscuss);
        return success(list);
    }

    /**
     * 导出评论专区列表
     */
    @PreAuthorize("@ss.hasPermi('nc:discuss:export')")
    @Log(title = "评论专区", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NcDiscuss ncDiscuss)
    {
        List<NcDiscuss> list = ncDiscussService.selectNcDiscussList(ncDiscuss);
        ExcelUtil<NcDiscuss> util = new ExcelUtil<NcDiscuss>(NcDiscuss.class);
        util.exportExcel(response, list, "评论专区数据");
    }

    /**
     * 获取评论专区详细信息
     */
    @PreAuthorize("@ss.hasPermi('nc:discuss:query')")
    @GetMapping(value = "/{discussId}")
    public AjaxResult getInfo(@PathVariable("discussId") Long discussId)
    {
        return success(ncDiscussService.selectNcDiscussByDiscussId(discussId));
    }

    /**
     * 新增评论专区
     */
    @PreAuthorize("@ss.hasPermi('nc:discuss:add')")
    @Log(title = "评论专区", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NcDiscuss ncDiscuss)
    {
        return toAjax(ncDiscussService.insertNcDiscuss(ncDiscuss));
    }

    /**
     * 修改评论专区
     */
    @PreAuthorize("@ss.hasPermi('nc:discuss:edit')")
    @Log(title = "评论专区", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NcDiscuss ncDiscuss)
    {
        return toAjax(ncDiscussService.updateNcDiscuss(ncDiscuss));
    }

    /**
     * 删除评论专区
     */
    @PreAuthorize("@ss.hasPermi('nc:discuss:remove')")
    @Log(title = "评论专区", businessType = BusinessType.DELETE)
	@DeleteMapping("/{discussIds}")
    public AjaxResult remove(@PathVariable Long[] discussIds)
    {
        return toAjax(ncDiscussService.deleteNcDiscussByDiscussIds(discussIds));
    }
}
