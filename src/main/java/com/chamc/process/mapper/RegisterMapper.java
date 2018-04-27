package com.chamc.process.mapper;

import com.chamc.process.entity.Register;
import org.apache.ibatis.annotations.Param;

public interface RegisterMapper{
    public int save(Register register);

    public Register getByUserId(@Param("userId") Long userId);
}
