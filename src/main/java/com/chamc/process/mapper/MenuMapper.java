package com.chamc.process.mapper;

import com.chamc.process.entity.Menu;
import com.chamc.process.mapper.bo.SysMenu;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MenuMapper {
    /**
     * 获取角色对应的菜单
     *
     * @param roleId
     * @return
     */
    public List<SysMenu> getMenus(@Param("roleId" ) Integer roleId);

}
