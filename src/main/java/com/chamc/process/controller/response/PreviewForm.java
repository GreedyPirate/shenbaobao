package com.chamc.process.controller.response;

import java.math.BigDecimal;

/**
 * Created by Jaynnay on 2018/5/6
 **/
public class PreviewForm {

    private Type type;
    private String name;
    private String addr;
    private BigDecimal money;
    private String contact;
    private String tel;

    class Type{
        private Integer code;
        private Integer name;
    }
}
