package com.jxust.web.controller.nc;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.jxust.nc.domain.NcTopicType;
import com.jxust.nc.service.INcTopicTypeService;
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

import com.jxust.common.utils.poi.ExcelUtil;
import com.jxust.common.core.page.TableDataInfo;

/**
 * 话题类别Controller
 * 
 * @author xuxiaoyang
 * @date 2023-03-29
 */
@RestController
@RequestMapping("/nc/topicType")
public class NcTopicTypeController extends BaseController
{
    @Autowired
    private INcTopicTypeService ncTopicTypeService;

    /**
     * 查询话题类别列表
     */
    @PreAuthorize("@ss.hasPermi('nc:topicType:list')")
    @GetMapping("/list")
    public TableDataInfo list(NcTopicType ncTopicType)
    {
        startPage();
        List<NcTopicType> list = ncTopicTypeService.selectNcTopicTypeList(ncTopicType);
        return getDataTable(list);
    }

    /**
     * 导出话题类别列表
     */
    @PreAuthorize("@ss.hasPermi('nc:topicType:export')")
    @Log(title = "话题类别", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NcTopicType ncTopicType)
    {
        List<NcTopicType> list = ncTopicTypeService.selectNcTopicTypeList(ncTopicType);
        ExcelUtil<NcTopicType> util = new ExcelUtil<NcTopicType>(NcTopicType.class);
        util.exportExcel(response, list, "话题类别数据");
    }

    /**
     * 获取话题类别详细信息
     */
    @PreAuthorize("@ss.hasPermi('nc:topicType:query')")
    @GetMapping(value = "/{ttId}")
    public AjaxResult getInfo(@PathVariable("ttId") Long ttId)
    {
        return success(ncTopicTypeService.selectNcTopicTypeByTtId(ttId));
    }

    /**
     * 新增话题类别
     */
    @PreAuthorize("@ss.hasPermi('nc:topicType:add')")
    @Log(title = "话题类别", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NcTopicType ncTopicType)
    {
        ncTopicType.setCreateBy(getUsername());
        return toAjax(ncTopicTypeService.insertNcTopicType(ncTopicType));
    }

    /**
     * 修改话题类别
     */
    @PreAuthorize("@ss.hasPermi('nc:topicType:edit')")
    @Log(title = "话题类别", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NcTopicType ncTopicType)
    {
        return toAjax(ncTopicTypeService.updateNcTopicType(ncTopicType));
    }

    /**
     * 删除话题类别
     */
    @PreAuthorize("@ss.hasPermi('nc:topicType:remove')")
    @Log(title = "话题类别", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ttIds}")
    public AjaxResult remove(@PathVariable Long[] ttIds)
    {
        return toAjax(ncTopicTypeService.deleteNcTopicTypeByTtIds(ttIds));
    }
}
