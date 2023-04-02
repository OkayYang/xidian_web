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
import com.jxust.nc.domain.NcArticle;
import com.jxust.nc.service.INcArticleService;
import com.jxust.common.utils.poi.ExcelUtil;
import com.jxust.common.core.page.TableDataInfo;

/**
 * 文章管理Controller
 * 
 * @author xuxiaoyang
 * @date 2023-03-28
 */
@RestController
@RequestMapping("/nc/article")
public class NcArticleController extends BaseController
{
    @Autowired
    private INcArticleService ncArticleService;

    /**
     * 查询文章管理列表
     */
    @PreAuthorize("@ss.hasPermi('nc:article:list')")
    @GetMapping("/list")
    public TableDataInfo list(NcArticle ncArticle)
    {
        startPage();
        List<NcArticle> list = ncArticleService.selectNcArticleList(ncArticle);
        return getDataTable(list);
    }

    /**
     * 导出文章管理列表
     */
    @PreAuthorize("@ss.hasPermi('nc:article:export')")
    @Log(title = "文章管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NcArticle ncArticle)
    {
        List<NcArticle> list = ncArticleService.selectNcArticleList(ncArticle);
        ExcelUtil<NcArticle> util = new ExcelUtil<NcArticle>(NcArticle.class);
        util.exportExcel(response, list, "文章管理数据");
    }

    /**
     * 获取文章管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('nc:article:query')")
    @GetMapping(value = "/{articleId}")
    public AjaxResult getInfo(@PathVariable("articleId") Long articleId)
    {
        return success(ncArticleService.selectNcArticleByArticleId(articleId));
    }

    /**
     * 新增文章管理
     */
    @PreAuthorize("@ss.hasPermi('nc:article:add')")
    @Log(title = "文章管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NcArticle ncArticle)
    {
        ncArticle.setCreateBy(getUsername());
        return toAjax(ncArticleService.insertNcArticle(ncArticle));
    }

    /**
     * 修改文章管理
     */
    @PreAuthorize("@ss.hasPermi('nc:article:edit')")
    @Log(title = "文章管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NcArticle ncArticle)
    {
        return toAjax(ncArticleService.updateNcArticle(ncArticle));
    }

    /**
     * 删除文章管理
     */
    @PreAuthorize("@ss.hasPermi('nc:article:remove')")
    @Log(title = "文章管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{articleIds}")
    public AjaxResult remove(@PathVariable Long[] articleIds)
    {
        return toAjax(ncArticleService.deleteNcArticleByArticleIds(articleIds));
    }
}
