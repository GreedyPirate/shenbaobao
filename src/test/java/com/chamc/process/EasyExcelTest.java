package com.chamc.process;

import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.metadata.Sheet;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.chamc.process.entity.Register;
import com.chamc.process.mapper.RegisterMapper;
import com.chamc.process.service.RegistService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Jaynnay on 2018/5/16
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class EasyExcelTest {
    @Autowired
    RegisterMapper registerMapper;

    @Autowired
    RegistService registService;

    @Autowired
    HttpServletResponse response;

//    @Test
    public void testWrite() throws Exception{
        Register excelDetial = registerMapper.getExcelDetial(1L);
        OutputStream out = new FileOutputStream("G:/78.xlsx");
        ExcelWriter writer = new ExcelWriter(out, ExcelTypeEnum.XLSX);
        //写第一个sheet, sheet1  数据全是List<String> 无模型映射关系
        Sheet sheet1 = new Sheet(1, 0,Register.class);
        List data = new ArrayList<>(1);
        data.add(excelDetial);
        writer.write(data, sheet1);
        writer.finish();
    }

    @Test
    public void testPdf() throws Exception{
        registService.buildPDF(response,1L);
    }
}
