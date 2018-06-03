package com.chamc.process.service;

import com.chamc.process.entity.Menu;
import com.chamc.process.mapper.MenuMapper;
import com.chamc.process.mapper.UserMapper;
import com.chamc.process.utils.interceptor.ErrorCode;
import com.chamc.process.utils.interceptor.ProcessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Jaynnay on 2018/5/31
 **/
@Service
public class PrivilegeService {
    @Autowired
    MenuMapper menuMapper;

    @Autowired
    UserMapper userMapper;

    public List<Menu> getUserMenu(Long uid){
        Integer roleId = userMapper.getRoleId(uid);
        if(roleId == null){
            throw new ProcessException(ErrorCode.QUERY_ROLE_FAIL);
        }

        List<Menu> menus = this.menuMapper.getMenus(roleId);
        return menus;
    }
}
