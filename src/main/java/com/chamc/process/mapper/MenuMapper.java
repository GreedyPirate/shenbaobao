package com.chamc.process.mapper;

import com.chamc.process.mapper.bo.SysMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuMapper {
    /**
     * 获取角色对应的菜单
     * @param roleId
     * @return
     */
    List<SysMenu> getMenus(@Param("roleId") Integer roleId);

}
