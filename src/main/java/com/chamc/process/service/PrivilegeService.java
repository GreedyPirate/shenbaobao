package com.chamc.process.service;

import com.chamc.process.entity.Menu;
import com.chamc.process.mapper.MenuMapper;
import com.chamc.process.mapper.UserMapper;
import com.chamc.process.mapper.bo.SysMenu;
import com.chamc.process.utils.interceptor.ErrorCode;
import com.chamc.process.utils.interceptor.ProcessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;

/**
 * Created by Jaynnay on 2018/5/31
 **/
@Service
public class PrivilegeService {
    @Autowired
    MenuMapper menuMapper;

    @Autowired
    UserMapper userMapper;

    public List<SysMenu> getUserMenu(Long uid){
        Integer roleId = userMapper.getRoleId(uid);
        if(roleId == null){
            throw new ProcessException(ErrorCode.QUERY_ROLE_FAIL);
        }
        List<SysMenu> menus = this.menuMapper.getMenus(roleId);
        return this.fastSetSubMenus(menus);
    }

    private List<SysMenu> fastSetSubMenus(List<SysMenu> menus){
        List<SysMenu> parentMenu = new ArrayList<>();
        List<SysMenu> subMenu = new ArrayList<>();
        List<SysMenu> ret = new ArrayList<>(menus.size());
        Map<Integer,SysMenu> allMenu = new HashMap<>();
        menus.forEach((item)->{
            if(item.getParentId().equals(0)){
                parentMenu.add(item);
                allMenu.put(item.getId(),item);
            }else {
                subMenu.add(item);
            }
        });
        subMenu.forEach((item)->{
            allMenu.get(item.getParentId()).getSubs().add(item);
        });
        allMenu.forEach((id,menu)->{
            ret.add(menu);
        });
        return ret;
    }


    /**
     * 菜单的递归查询，时间复杂度O(n^2)
     * @param menus
     * @return
     */
    private List<SysMenu> setSubMenus(List<SysMenu> menus) {
        List<SysMenu> result = null;
        if(!CollectionUtils.isEmpty(menus)) {
            result = new ArrayList<>(menus.size());
            Iterator<SysMenu> iterator = menus.iterator();
            while (iterator.hasNext()){
                SysMenu next = iterator.next();
                if(next.getParentId().equals(0)){
                    result.add(findSubs(next, menus));
                }
            }
        }
        return result;
    }

    private SysMenu findSubs(SysMenu menu, List<SysMenu> menus) {
        menus.forEach((item) -> {
            if(item.getParentId().equals(menu.getId())){
                // add (findSubs...) 递归查询
                menu.getSubs().add(item);
            }
        });
        return menu;
    }
}
