package com.jxust.web.controller.nc.wx;

import com.jxust.common.config.RuoYiConfig;
import com.jxust.common.core.controller.BaseController;
import com.jxust.common.core.domain.AjaxResult;
import com.jxust.common.utils.file.FileUploadUtils;
import com.jxust.nc.service.ITencentService;
import com.jxust.nc.utils.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/wx/file")
public class WxFileController extends BaseController {
    @Value("${host}")
    private String host;
    @Autowired
    private ITencentService tencentService;
    @PostMapping("/upload")
    @ResponseBody
    public AjaxResult wxUploadFile(MultipartFile file) throws Exception
    {
        try
        {
            // 上传文件路径
            String filePath = RuoYiConfig.getUploadPath();
            // 上传并返回新文件名称
            String fileName = FileUploadUtils.upload(filePath, file);
            System.out.println(fileName);
            if (fileName!=null){

                return new AjaxResult(200,"上传成功",fileName);
            }


        }
        catch (Exception e)
        {
            return AjaxResult.error(e.getMessage());
        }
        return AjaxResult.error(400,"上传失败");
    }
    @PostMapping("/uploads")
    @ResponseBody
    public AjaxResult wxUploadFiles(MultipartFile[] file) throws Exception
    {
        try
        {
            // 上传文件路径
            String filePath = RuoYiConfig.getUploadPath();
            List<String> fileNameList = new ArrayList<>();
            // 上传并返回新文件名称
            for (int i = 0; i < file.length; i++) {
                String fileName = FileUploadUtils.upload(filePath, file[i]);
                fileNameList.add(fileName);

            }

            if (fileNameList.size()>0){
                return new AjaxResult(200,"上传成功",fileNameList);
            }


        }
        catch (Exception e)
        {
            return AjaxResult.error(e.getMessage());
        }
        return AjaxResult.error(400,"上传失败");
    }
}