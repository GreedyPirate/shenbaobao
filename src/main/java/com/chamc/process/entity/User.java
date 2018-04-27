package com.chamc.process.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * Created by Jaynnay on 2017/12/24
 **/
@Data
public class User implements Serializable{
    private static final long serialVersionUID = 98569265517537224L;
    private Long id;
    private String phoneNumber;
    private String username;
    private String password;
    private String avatar;

    private Integer accountNonExpired;
    private Integer accountNonLocked;
    private Integer passwordNonExpired;
    private Integer enabled;
}
