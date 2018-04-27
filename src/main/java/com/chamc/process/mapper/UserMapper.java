package com.chamc.process.mapper;

import com.chamc.process.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface UserMapper{

    public List<User> findByUsername(String username);

    public User findByNamePass(@Param("phoneNumber") String phoneNumber,@Param("password") String password);

    @Insert("insert into s_user(username,password,phoneNumber) values(#{username},#{password},#{phoneNumber})")
    @Options(useGeneratedKeys = true,keyColumn = "id",keyProperty = "id")
    public long save(User user);

    @Select("select count(*) from s_user p where p.phoneNumber = #{phoneNumber}")
    public int getPhoneNumber(String phoneNumber);
}
