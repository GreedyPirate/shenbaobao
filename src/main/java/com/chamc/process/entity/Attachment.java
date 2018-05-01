package com.chamc.process.entity;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Jaynnay on 2018/2/28
 **/
@Data
public class Attachment implements Serializable{
    private static final long serialVersionUID = 8994635620719517897L;
    private Long id;
    private String name;
    private String ext;
    private Long size;
    @JSONField(format="yyyy-MM-dd")
    private Date uploadTime;
    private String url;
    private Long uid;

    private Date createTime;
    private Date updateTime;
}
