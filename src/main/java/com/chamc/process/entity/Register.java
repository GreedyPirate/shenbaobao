package com.chamc.process.entity;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by Jaynnay on 2018/3/6
 **/
@Data
public class Register implements Serializable {
    private static final long serialVersionUID = 8057693395726581605L;
    private Long id;
    private Integer regType;
    private String enterpriseZh;
    private String enterpriseEn;
    private String registZh;
    private String registEn;
    private String registPostcode;
    private String workPostcode;
    private String workplaceZh;
    private String workplaceEn;

    private String[] adminarea;
    private String adminareaCode;
    /*private String belongCenter;*/
    private String licenseCode;
    private Integer enterpriseType;
    private Integer currency;
    private BigDecimal capital;
    private Integer economicType;

    private String leader;
    private String leaderTele;
    private String contact;
    private String contactTele;
    private String contactEmail;
    private Integer emailReceive;
    private String website;
    private String productInfo;

    private String invoiceTitle;
    private String taxNumber;
    private String taxAddr;
    private String openBank;

    private Date createTime;
    private Date updateTime;
    private Long userid;
    private Integer status;

}
