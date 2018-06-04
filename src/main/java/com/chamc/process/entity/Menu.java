package com.chamc.process.entity;

import lombok.Data;

import java.util.Date;

/**
 * Created by Jaynnay on 2018/5/29
 **/
@Data
public class Menu {
    private Integer id;
    private String icon;
    private String index;
    private String title;
    private Integer parentId;
    private Date createTime;
    private Date updateTime;
}
