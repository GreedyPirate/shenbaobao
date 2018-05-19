package com.chamc.process.controller.response;

import lombok.Data;

import java.math.BigDecimal;

/**
 * Created by Jaynnay on 2018/5/6
 **/
@Data
public class PreviewForm {

    private Long id;
    private String type;
    private String name;
    private String addr;
    private BigDecimal money;
    private String contact;
    private String tel;
    private Integer status;
}
