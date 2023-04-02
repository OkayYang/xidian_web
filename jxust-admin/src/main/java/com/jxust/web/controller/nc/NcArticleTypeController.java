package com.jxust.web.controller.nc;

import com.jxust.common.annotation.Log;
import com.jxust.common.core.controller.BaseController;
import com.jxust.common.core.domain.AjaxResult;
import com.jxust.common.core.page.TableDataInfo;
import com.jxust.common.enums.BusinessType;
import com.jxust.common.utils.poi.ExcelUtil;
import com.jxust.nc.domain.NcArticleType;
import com.jxust.nc.service.INcArticleTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 文章类目Controller
 * 
 * @author xuxiaoyang
 * @date 2023-03-28
 */
@RestController
@RequestMapping("/nc/type")
public class NcArticleTypeController extends BaseController
{
    @Autowired
    private INcArticleTypeService ncArticleTypeService;

    /**
     * 查询文章类目列表
     */
    @PreAuthorize("@ss.hasPermi('nc:type:list')")
    @GetMapping("/list")
    public TableDataInfo list(NcArticleType ncArticleType)
    {
        startPage();
        List<NcArticleType> list = ncArticleTypeService.selectNcArticleTypeList(ncArticleType);
        return getDataTable(list);
    }

    /**
     * 导出文章类目列表
     */
    @PreAuthorize("@ss.hasPermi('nc:type:export')")
    @Log(title = "文章类目", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NcArticleType ncArticleType)
    {
        List<NcArticleType> list = ncArticleTypeService.selectNcArticleTypeList(ncArticleType);
        ExcelUtil<NcArticleType> util = new ExcelUtil<NcArticleType>(NcArticleType.class);
        util.exportExcel(response, list, "文章类目数据");
    }

    /**
     * 获取文章类目详细信息
     */
    @PreAuthorize("@ss.hasPermi('nc:type:query')")
    @GetMapping(value = "/{atId}")
    public AjaxResult getInfo(@PathVariable("atId") Long atId)
    {
        return success(ncArticleTypeService.selectNcArticleTypeByAtId(atId));
    }

    /**
     * 新增文章类目
     */
    @PreAuthorize("@ss.hasPermi('nc:type:add')")
    @Log(title = "文章类目", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NcArticleType ncArticleType)
    {
        ncArticleType.setCreateBy(getUsername());
        return toAjax(ncArticleTypeService.insertNcArticleType(ncArticleType));
    }

    /**
     * 修改文章类目
     */
    @PreAuthorize("@ss.hasPermi('nc:type:edit')")
    @Log(title = "文章类目", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NcArticleType ncArticleType)
    {
        return toAjax(ncArticleTypeService.updateNcArticleType(ncArticleType));
    }

    /**
     * 删除文章类目
     */
    @PreAuthorize("@ss.hasPermi('nc:type:remove')")
    @Log(title = "文章类目", businessType = BusinessType.DELETE)
	@DeleteMapping("/{atIds}")
    public AjaxResult remove(@PathVariable Long[] atIds)
    {
        return toAjax(ncArticleTypeService.deleteNcArticleTypeByAtIds(atIds));
    }
}
