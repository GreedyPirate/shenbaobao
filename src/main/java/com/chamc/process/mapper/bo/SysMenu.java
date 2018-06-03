package com.chamc.process.mapper.bo;

import lombok.Data;

import java.util.List;

/**
 * Created by Jaynnay on 2018/6/2
 **/
@Data
public class SysMenu {
    private Short id;
    private String icon;
    private String index;
    private String title;
    private Short parentId;
    private List<SysMenu> subs;
}
