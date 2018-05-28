package com.chamc.process.entity;

import lombok.Data;

import java.util.Date;

/**
 * Created by Jaynnay on 2018/5/29
 **/
@Data
public class SysRole {
    private Short id;
    private String name;
    private String code;
    private Date createTime;
    private Date updateTime;
}
