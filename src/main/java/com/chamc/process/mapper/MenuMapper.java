package com.chamc.process.mapper;

import com.chamc.process.entity.Menu;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MenuMapper {
    public List<Menu> getMenus(@Param("roleId") Integer roleId);
}
