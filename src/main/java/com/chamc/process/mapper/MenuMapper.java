package com.chamc.process.mapper;

import com.chamc.process.entity.Menu;
import com.chamc.process.mapper.bo.SysMenu;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MenuMapper {
    public List<SysMenu> getMenus(@Param("roleId") Integer roleId);

    public List<SysMenu> getSubs(@Param("id") Integer id);
}
