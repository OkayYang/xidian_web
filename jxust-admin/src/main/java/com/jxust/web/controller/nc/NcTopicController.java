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
import com.jxust.nc.domain.NcTopic;
import com.jxust.nc.service.INcTopicService;
import com.jxust.common.utils.poi.ExcelUtil;
import com.jxust.common.core.page.TableDataInfo;

/**
 * 讨论话题Controller
 * 
 * @author xuxiaoyang
 * @date 2023-03-30
 */
@RestController
@RequestMapping("/nc/topic")
public class NcTopicController extends BaseController
{
    @Autowired
    private INcTopicService ncTopicService;

    /**
     * 查询讨论话题列表
     */
    @PreAuthorize("@ss.hasPermi('nc:topic:list')")
    @GetMapping("/list")
    public TableDataInfo list(NcTopic ncTopic)
    {
        startPage();
        List<NcTopic> list = ncTopicService.selectNcTopicList(ncTopic);
        return getDataTable(list);
    }

    /**
     * 导出讨论话题列表
     */
    @PreAuthorize("@ss.hasPermi('nc:topic:export')")
    @Log(title = "讨论话题", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NcTopic ncTopic)
    {
        List<NcTopic> list = ncTopicService.selectNcTopicList(ncTopic);
        ExcelUtil<NcTopic> util = new ExcelUtil<NcTopic>(NcTopic.class);
        util.exportExcel(response, list, "讨论话题数据");
    }

    /**
     * 获取讨论话题详细信息
     */
    @PreAuthorize("@ss.hasPermi('nc:topic:query')")
    @GetMapping(value = "/{topicId}")
    public AjaxResult getInfo(@PathVariable("topicId") Long topicId)
    {
        return success(ncTopicService.selectNcTopicByTopicId(topicId));
    }

    /**
     * 新增讨论话题
     */
    @PreAuthorize("@ss.hasPermi('nc:topic:add')")
    @Log(title = "讨论话题", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NcTopic ncTopic)
    {
        return toAjax(ncTopicService.insertNcTopic(ncTopic));
    }

    /**
     * 修改讨论话题
     */
    @PreAuthorize("@ss.hasPermi('nc:topic:edit')")
    @Log(title = "讨论话题", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NcTopic ncTopic)
    {
        return toAjax(ncTopicService.updateNcTopic(ncTopic));
    }

    /**
     * 删除讨论话题
     */
    @PreAuthorize("@ss.hasPermi('nc:topic:remove')")
    @Log(title = "讨论话题", businessType = BusinessType.DELETE)
	@DeleteMapping("/{topicIds}")
    public AjaxResult remove(@PathVariable Long[] topicIds)
    {
        return toAjax(ncTopicService.deleteNcTopicByTopicIds(topicIds));
    }
}
