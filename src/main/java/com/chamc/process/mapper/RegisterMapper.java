package com.chamc.process.mapper;

import com.chamc.process.controller.response.PreviewForm;
import com.chamc.process.entity.Register;
import com.chamc.process.mapper.bo.EmailInfo;
import com.chamc.process.mapper.bo.Location;
import com.chamc.process.mapper.bo.RegisterDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RegisterMapper {
    /**
     * 保存申请
     *
     * @param register
     * @return
     */
    int save(Register register);

    /**
     * 获取用户注册，顺便判断数量
     *
     * @param userId
     * @return
     */
    List<Register> getByUserId(@Param("userId") Long userId);

    /**
     * 获取用户表单预览
     *
     * @param userId
     * @return
     */
    List<PreviewForm> getPreview(@Param("userId") Long userId);

    /**
     * @param userId
     * @param id
     * @return
     */
    List<PreviewForm> getPreviewByType(@Param("userId") Long userId, @Param("type") Long id);

    /**
     * @return
     */
    List<PreviewForm> getAppList();

    /**
     * @param userId
     * @return
     */
    Integer getAll(@Param("userId") Long userId);

    /**
     * @param userId
     * @return
     */
    Register getExcelDetial(@Param("userId") Long userId);

    /**
     * @param id
     * @return
     */
    Integer deleteById(@Param("id") Long id);

    /**
     * @param id
     * @return
     */
    Register getById(@Param("id") Long id);

    /**
     * @param id
     * @return
     */
    EmailInfo isEmail(@Param("id") Long id);

    /**
     * @param id
     * @return
     */
    RegisterDetail queryDetail(@Param("id") Long id);

    /**
     * @param province
     * @param city
     * @param town
     * @return
     */
    Location queryLocation(@Param("province") Integer province, @Param("city") Integer city, @Param("town") Integer town);

    /**
     * @param status
     * @param comment
     * @param id
     * @return
     */
    Integer updateStatus(@Param("status") Integer status, @Param("comment") String comment, @Param("id") Long id);
}
