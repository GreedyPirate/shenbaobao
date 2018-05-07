package com.chamc.process.service;

import com.chamc.process.controller.response.PreviewForm;
import com.chamc.process.entity.Register;
import com.chamc.process.entity.User;
import com.chamc.process.mapper.RegisterMapper;
import com.chamc.process.utils.interceptor.ErrorCode;
import com.chamc.process.utils.interceptor.ProcessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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
        Integer count = this.getCount(user.getId());
        if(count != null && count > 1){
            throw new ProcessException(ErrorCode.TOO_MUSH_REGISTER);
        }
        register.setUserid(user.getId());
        int save = this.registerMapper.save(register);
        return new Boolean(save == 1);
    }

    public List<PreviewForm> getPreview(Long userId){
        Integer count = this.getCount(userId);
        if(count != null && count > 1){
            throw new ProcessException(ErrorCode.TOO_MUSH_REGISTER);
        }
        return this.registerMapper.getPreview(userId);
    }

    public List<PreviewForm> getAppList(){
        return this.registerMapper.getAppList();
    }

    private Integer getCount(Long userId){
        return this.registerMapper.getAll(userId);
    }
}
