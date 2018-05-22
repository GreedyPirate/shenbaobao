package com.chamc.process.controller;

import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.metadata.Sheet;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.chamc.process.constants.FileSubfix;
import com.chamc.process.controller.response.PreviewForm;
import com.chamc.process.entity.Register;
import com.chamc.process.service.RegistService;
import com.chamc.process.utils.interceptor.NoWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Jaynnay on 2018/5/6
 **/
@RestController
@RequestMapping("busi")
public class BusinessController {

    @Autowired
    RegistService registerService;

    /**
     * 待办列表
     * @return
     */
    @GetMapping("tasks")
    public List<PreviewForm> tasks(){
        return this.registerService.getAppList();
    }

    /**
     * 个人办理业务预览
     * @param id
     * @return
     */
    @PostMapping("preview")
    public List<PreviewForm> preview(Long id){
        return this.registerService.getPreview(id);
    }

    /**
     * 下载excel
     * @param response
     * @param uid
     * @throws Exception
     */
    @GetMapping("excel")
    @NoWrapper
    public void downloadExcel(HttpServletResponse response, Long uid) throws Exception{
        Register excelDetial = this.registerService.getExcelData(uid);
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment;fileName=" + excelDetial.getEnterpriseZh() + FileSubfix.EXCEL);
        ExcelWriter writer = new ExcelWriter(response.getOutputStream(), ExcelTypeEnum.XLSX);
        Sheet sheet1 = new Sheet(1, 0,Register.class);
        List data = new ArrayList<>(1);
        data.add(excelDetial);
        writer.write(data, sheet1);
        writer.finish();
    }

    /**
     * 下载pdf
     * @param response
     * @param uid
     * @throws Exception
     */
    @GetMapping("pdf")
    @NoWrapper
    public void downloadPDF(HttpServletResponse response, Long uid) throws Exception{
        this.registerService.buildPDF(response, uid);
    }

    @PostMapping("delete")
    public Boolean delete(Long id){
        return this.registerService.delete(id);
    }

    @GetMapping("detail")
    public Register getAllInfo(Long id){
        return this.registerService.getById(id);
    }

    @PostMapping("approve")
    public Boolean approve(Long id){
        return this.registerService.approve(id);
    }
}
