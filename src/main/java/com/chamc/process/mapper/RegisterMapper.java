package com.chamc.process.mapper;

import com.chamc.process.controller.response.PreviewForm;
import com.chamc.process.entity.Register;
import com.chamc.process.mapper.bo.EmailInfo;
import com.chamc.process.mapper.bo.Location;
import com.chamc.process.mapper.bo.RegisterDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RegisterMapper {
    public int save(Register register);

    public List<Register> getByUserId(@Param("userId") Long userId);

    public List<PreviewForm> getPreview(@Param("userId") Long userId);

    public List<PreviewForm> getPreviewByType(@Param("userId") Long userId, @Param("type") Long id);

    public List<PreviewForm> getAppList();

    public Integer getAll(@Param("userId") Long userId);

    public Register getExcelDetial(@Param("userId") Long userId);

    public Integer deleteById(@Param("id") Long id);

    public Register getById(@Param("id") Long id);

    public EmailInfo isEmail(@Param("id") Long id);

    public RegisterDetail queryDetail (@Param("id") Long id);

    public Location queryLocation(@Param("province") Integer province,@Param("city") Integer city,@Param("town") Integer town);

    public Integer updateStatus(@Param("status") Integer status,@Param("comment") String comment,@Param("id") Long id);
}
