package com.chamc.process.service;

import com.chamc.process.controller.request.LoginParam;
import com.chamc.process.entity.User;
import com.chamc.process.utils.interceptor.ProcessException;
import com.chamc.process.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Jaynnay on 2017/12/24
 **/
@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    public List<User> allUsers(){
        //return this.userMapper.selectAll();
        return null;
    }

    /**
     * 检查用户合法性
     * @param loginParam
     * @return
     */
    public User login(LoginParam loginParam){
        User byNamePass = this.userMapper.findByNamePass(loginParam.getPhoneNumber(), loginParam.getPassword());
        return byNamePass;
    }

    @Transactional(rollbackFor = {ProcessException.class, Exception.class})
    public User registUser(User user){
        long count = this.userMapper.save(user);
        return user;
    }
    
    public List<User> checkUser(String username){
        List<User> exitUser = this.userMapper.findByUsername(username);
        return exitUser;
    }

    public int checkPhoneNumber(String phoneNumber){
        return this.userMapper.getPhoneNumber(phoneNumber);
    }
}
