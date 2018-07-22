package com.chamc.process.mapper;

import com.chamc.process.entity.User;
import org.apache.ibatis.annotations.*;

public interface UserMapper {

    @Select("select count(*) from s_user where phone_no = #{phoneNumber}")
    Integer findByPhoneNumber(@Param("phoneNumber") String phoneNumber);

    User findByNamePass(@Param("phoneNumber") String phoneNumber, @Param("password") String password);

    @Insert("insert into s_user(username,password,phone_no, create_time, update_time) values(#{username},#{password},#{phoneNumber}, NOW(), NOW())")
    @Options(useGeneratedKeys = true, keyColumn = "id", keyProperty = "id")
    long save(User user);

    @Select("select count(*) from s_user p where p.phoneNumber = #{phoneNumber}")
    int getPhoneNumber(@Param("phoneNumber") String phoneNumber);

    @Update("update s_user set password = #{newPassword}, update_time = NOW() where phone_no = #{phoneNumber} and password = #{old}")
    Integer updatePassword(@Param("phoneNumber") String phoneNumber,
                           @Param("newPassword") String newPassword,
                           @Param("old") String old);

    User getById(@Param("id") Long id);

    @Update("update s_user set email = #{email}, update_time = NOW() where id = #{id} ")
    Integer updateEmail(@Param("id") Long id, @Param("email") String email);

    @Update("update s_user set avatar = #{path}, update_time = NOW() where id = #{id}")
    Integer updateAvatar(@Param("id") Long id, @Param("path") String path);

    @Update("update s_user set avatar = #{base64}, update_time = NOW() where id = #{id}")
    Integer updateAvatarBase64(@Param("id") Long id, @Param("base64") String base64);

    @Update("update s_user set phone_no = #{phone}, update_time = NOW() where id = #{id}")
    Integer updatePhone(@Param("id") Long id, @Param("phone") String phone);

    @Select("SELECT u.role_id FROM s_user u WHERE u.id = #{id}")
    Integer getRoleId(@Param("id") Long id);

    @Select("SELECT u.password FROM s_user u WHERE u.phone_no = #{phoneNumber}")
    String getPassword(String phoneNumber);
}
