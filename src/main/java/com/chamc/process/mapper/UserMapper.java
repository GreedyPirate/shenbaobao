package com.chamc.process.mapper;

import com.chamc.process.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface UserMapper{

    public List<User> findByUsername(String username);

    @Select("select count(*) from s_user where phone_no = #{phoneNumber}")
    public User findByPhoneNumber(@Param("phoneNumber") String phoneNumber);

    public User findByNamePass(@Param("phoneNumber") String phoneNumber,@Param("password") String password);

    @Insert("insert into s_user(username,password,phoneNumber, create_time) values(#{username},#{password},#{phoneNumber}, NOW())")
    @Options(useGeneratedKeys = true,keyColumn = "id",keyProperty = "id")
    public long save(User user);

    @Select("select count(*) from s_user p where p.phoneNumber = #{phoneNumber}")
    public int getPhoneNumber(@Param("phoneNumber") String phoneNumber);

    @Update("update s_user set password = #{newPassword}, update_time = NOW() where phone_no = #{phoneNumber} and password = #{old}")
    public Integer updatePassword(@Param("phoneNumber") String phoneNumber,
                                  @Param("newPassword") String newPassword,
                                  @Param("old") String old );

    public User getById(@Param("id") Long id);

    @Update("update s_user set email = #{email}, update_time = NOW() where id = #{id} ")
    public Integer updateEmail(@Param("id") Long id, @Param("email") String email);

    @Update("update s_user set avatar = #{path}, update_time = NOW() where id = #{id}")
    public Integer updateAvatar(@Param("id") Long id, @Param("path") String path);

    @Update("update s_user set avatar = #{base64}, update_time = NOW() where id = #{id}")
    public Integer updateAvatarBase64(@Param("id") Long id, @Param("base64") String base64 );

    @Update("update s_user set phone_no = #{phone}, update_time = NOW() where id = #{id}")
    public Integer updatePhone(@Param("id") Long id, @Param("phone") String phone);
}
