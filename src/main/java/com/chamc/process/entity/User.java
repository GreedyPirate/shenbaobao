package com.chamc.process.entity;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

/**
 * 继承Spring-security 提供的 User
 * extends org.springframework.security.core.userdetails.User
 * Created by Jaynnay on 2017/12/24
 **/
@Data
public class User implements Serializable, UserDetails {
    private static final long serialVersionUID = 98569265517537224L;

    private Long id;
    private String username;
    private String password;
    private String phoneNumber;
    private String avatar;
    private String email;
    private String fromIp;
    private Date lastLoginTime;
    private Date createTime;
    private Date updateTime;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
