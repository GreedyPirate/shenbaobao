package com.chamc.process.service;

import com.chamc.process.entity.Register;
import com.chamc.process.mapper.RegisterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Jaynnay on 2018/5/1
 **/
@Service
public class RegistService {

    @Autowired
    RegisterMapper registerMapper;

    @Transactional
    public Boolean regist(Register register){
        int save = this.registerMapper.save(register);
        return new Boolean(save == 1);
    }
}
