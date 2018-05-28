package com.chamc.process.entity;

import lombok.Data;

import java.util.Date;

/**
 * Created by Jaynnay on 2018/5/29
 **/
@Data
public class SysMenu {
    private Short id;
    private String icon;
    private String index;
    private String title;
    private Short parentId;
    private Date createTime;
    private Date updateTime;
}
