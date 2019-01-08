package com.chamc.process.mapper.bo;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * Created by Jaynnay on 2018/5/29
 **/
@Data
public class RegisterDetail extends Location implements Serializable {
    private static final long serialVersionUID = -1990218317724436649L;
    private Long id;
    private String regType;
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
    private String licenseCode;
    private String enterpriseType;
    private String currency;
    private BigDecimal capital;
    private String economicType;

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

}
