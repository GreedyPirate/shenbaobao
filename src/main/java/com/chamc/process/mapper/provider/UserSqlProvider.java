package com.chamc.process.mapper.provider;

import org.apache.ibatis.jdbc.SQL;

/**
 * Created by Jaynnay on 2017/12/24
 **/
public class UserSqlProvider {
    public String insertUserSql(){
        return new SQL(){
            {}
        }.toString();
    }
}
