package com.chamc.process.service.impl;

import com.chamc.process.entity.Register;
import com.chamc.process.mapper.RegisterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Jaynnay on 2018/4/24
 **/
@Service
public class RegisterService {
    @Autowired
    RegisterMapper registerMapper;

    @Transactional
    public Boolean saveForm(Register register){
        int count = this.registerMapper.save(register);
        if(count > 0)
            return Boolean.TRUE;
        return Boolean.FALSE;
    }

    public Register getUserForm(Long userId){
        Register register = this.registerMapper.getByUserId(userId);
        if(register == null)
            return null;
        return register;
    }
}
