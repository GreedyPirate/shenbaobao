package com.chamc.process.entity;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by Jaynnay on 2018/3/6
 *
 **/
@Data
public class Register extends BaseRowModel implements Serializable  {
    private static final long serialVersionUID = 8057693395726581605L;
    private Long id;
    private Integer regType;
    @ExcelProperty(value = "企业名称" ,index = 0)
    private String enterpriseZh;
    private String enterpriseEn;
    @ExcelProperty(value = "注册地址" ,index = 1)
    private String registZh;
    private String registEn;
    @ExcelProperty(value = "注册地址邮编" ,index = 2)
    private String registPostcode;
    @ExcelProperty(value = "办公邮政编码" ,index = 3)
    private String workPostcode;
    private String workplaceZh;
    private String workplaceEn;

    private String[] adminarea;
    @ExcelProperty(value = "行政区域代码" ,index = 4)
    private String adminareaCode;
    /*private String belongCenter;*/
    @ExcelProperty(value = "营业执照注册号" ,index = 5)
    private String licenseCode;
    private Integer enterpriseType;
    private Integer currency;
    @ExcelProperty(value = "注册资金" ,index = 6)
    private BigDecimal capital;
    private Integer economicType;

    @ExcelProperty(value = "法定代表人" ,index = 7)
    private String leader;
    private String leaderTele;
    @ExcelProperty(value = "联系人" ,index = 8)
    private String contact;
    @ExcelProperty(value = "联系人手机" ,index = 9)
    private String contactTele;
    @ExcelProperty(value = "联系人邮箱" ,index = 10)
    private String contactEmail;
    private Integer emailReceive;
    @ExcelProperty(value = "网址" ,index = 11)
    private String website;
    private String productInfo;

    @ExcelProperty(value = "发票抬头" ,index = 12)
    private String invoiceTitle;
    @ExcelProperty(value = "纳税人识别号" ,index = 13)
    private String taxNumber;
    @ExcelProperty(value = "税务注册地址" ,index = 14)
    private String taxAddr;
    @ExcelProperty(value = "开户行" ,index = 15)
    private String openBank;

    private Date createTime;
    private Date updateTime;
    private Long userid;
    private Integer status;

}
