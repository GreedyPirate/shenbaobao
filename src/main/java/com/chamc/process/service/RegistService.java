package com.chamc.process.service;

import com.chamc.process.entity.Register;
import com.chamc.process.entity.User;
import com.chamc.process.mapper.RegisterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Jaynnay on 2018/5/1
 **/
@Service
public class RegistService {

    @Autowired
    RegisterMapper registerMapper;

    @Autowired
    HttpServletRequest request;

    @Transactional
    public Boolean regist(Register register){
        User user = (User) request.getSession().getAttribute("user");
        register.setUserid(user.getId());
        int save = this.registerMapper.save(register);
        return new Boolean(save == 1);
    }
}
