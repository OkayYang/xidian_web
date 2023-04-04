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
import com.jxust.nc.domain.NcContest;
import com.jxust.nc.service.INcContestService;
import com.jxust.common.utils.poi.ExcelUtil;
import com.jxust.common.core.page.TableDataInfo;

/**
 * 发布比赛Controller
 * 
 * @author xuxiaoyang
 * @date 2023-04-03
 */
@RestController
@RequestMapping("/nc/contest")
public class NcContestController extends BaseController
{
    @Autowired
    private INcContestService ncContestService;

    /**
     * 查询发布比赛列表
     */
    @PreAuthorize("@ss.hasPermi('nc:contest:list')")
    @GetMapping("/list")
    public TableDataInfo list(NcContest ncContest)
    {
        startPage();
        List<NcContest> list = ncContestService.selectNcContestList(ncContest);
        return getDataTable(list);
    }

    /**
     * 导出发布比赛列表
     */
    @PreAuthorize("@ss.hasPermi('nc:contest:export')")
    @Log(title = "发布比赛", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NcContest ncContest)
    {
        List<NcContest> list = ncContestService.selectNcContestList(ncContest);
        ExcelUtil<NcContest> util = new ExcelUtil<NcContest>(NcContest.class);
        util.exportExcel(response, list, "发布比赛数据");
    }

    /**
     * 获取发布比赛详细信息
     */
    @PreAuthorize("@ss.hasPermi('nc:contest:query')")
    @GetMapping(value = "/{contestId}")
    public AjaxResult getInfo(@PathVariable("contestId") Long contestId)
    {
        return success(ncContestService.selectNcContestByContestId(contestId));
    }

    /**
     * 新增发布比赛
     */
    @PreAuthorize("@ss.hasPermi('nc:contest:add')")
    @Log(title = "发布比赛", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NcContest ncContest)
    {
        ncContest.setCreateBy(getUsername());
        return toAjax(ncContestService.insertNcContest(ncContest));
    }

    /**
     * 修改发布比赛
     */
    @PreAuthorize("@ss.hasPermi('nc:contest:edit')")
    @Log(title = "发布比赛", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NcContest ncContest)
    {
        return toAjax(ncContestService.updateNcContest(ncContest));
    }

    /**
     * 删除发布比赛
     */
    @PreAuthorize("@ss.hasPermi('nc:contest:remove')")
    @Log(title = "发布比赛", businessType = BusinessType.DELETE)
	@DeleteMapping("/{contestIds}")
    public AjaxResult remove(@PathVariable Long[] contestIds)
    {
        return toAjax(ncContestService.deleteNcContestByContestIds(contestIds));
    }
}
