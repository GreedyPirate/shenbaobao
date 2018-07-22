package com.chamc.process.service.impl;

import com.chamc.process.mapper.UserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * Spring Security UserDetailsService 实现
 * Created by Jaynnay on 2018/7/17
 **/
@Service
public class UserDetailServiceImpl implements UserDetailsService{
    private Logger logger = LoggerFactory.getLogger(UserDetailServiceImpl.class);

    @Autowired
    UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String phoneNumber) throws UsernameNotFoundException {
        logger.info("login username is " + phoneNumber);

        return new User(phoneNumber,userMapper.getPassword(phoneNumber),
                true,true,true,true,
                AuthorityUtils.createAuthorityList("USER"));
    }
}
