package com.jxust.web.controller.nc.wx;


import com.jxust.common.core.controller.BaseController;
import com.jxust.common.core.domain.AjaxResult;
import com.jxust.nc.domain.NcArticle;
import com.jxust.nc.domain.NcArticleType;
import com.jxust.nc.domain.WxArticle;
import com.jxust.nc.service.INcArticleService;
import com.jxust.nc.service.INcArticleTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/wx/article")
public class WxArticleController extends BaseController {
    @Autowired
    private INcArticleService ncArticleService;
    @Autowired
    private INcArticleTypeService ncArticleTypeService;
    @GetMapping("/swiper")
    public AjaxResult getSwiperList(){

        NcArticle ncArticle = new NcArticle();
        ncArticle.setStatus("0");
        ncArticle.setIsCarousel("Y");
        return success(ncArticleService.selectNcArticleList(ncArticle));

    }
    @GetMapping("/type")
    public AjaxResult getArticleType(){
        NcArticleType ncArticleType = new NcArticleType();
        List<WxArticle> wxArticles = new ArrayList<>();

        ncArticleType.setStatus("0");

        NcArticle ncArticle = new NcArticle();
        ncArticle.setStatus("0");

        List<NcArticleType> ncArticleTypeList = ncArticleTypeService.selectNcArticleTypeList(ncArticleType);
        for (NcArticleType item:ncArticleTypeList
             ) {
            WxArticle wxArticle = new WxArticle();
            wxArticle.setName(item.getAtName());
            wxArticle.setAtpId(item.getAtId());
            ncArticle.setArticleTypeId(item.getAtId());
            wxArticle.setNcArticles(ncArticleService.selectNcArticleList(ncArticle));
            wxArticles.add(wxArticle);
        }
        return success(wxArticles);
    }
    @GetMapping("/list")
    public AjaxResult getArticleByType(@RequestParam("id") Long id){
        NcArticle ncArticle = new NcArticle();
        ncArticle.setStatus("0");
        ncArticle.setArticleTypeId(id);
        return success(ncArticleService.selectNcArticleList(ncArticle));
    }
    @GetMapping("/detail")
    public AjaxResult getArticleById(@RequestParam("id") Long id){

        return success(ncArticleService.selectNcArticleByArticleId(id));
    }
    @GetMapping("/bisai")
    public AjaxResult getBisaiList(){

        return success();
    }

}
