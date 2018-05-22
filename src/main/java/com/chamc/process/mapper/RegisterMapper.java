package com.chamc.process.mapper;

import com.chamc.process.controller.response.PreviewForm;
import com.chamc.process.entity.Register;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RegisterMapper {
    public int save(Register register);

    public List<Register> getByUserId(@Param("userId") Long userId);

    public List<PreviewForm> getPreview(@Param("userId") Long userId);

    public List<PreviewForm> getAppList();

    public Integer getAll(@Param("userId") Long userId);

    public Register getExcelDetial(@Param("userId") Long userId);

    public Integer deleteById(@Param("id") Long id);

    public Register getById(@Param("id") Long id);

    public Integer approve(@Param("id") Long id);

    public Integer isEmail(@Param("id") Long id);
}
