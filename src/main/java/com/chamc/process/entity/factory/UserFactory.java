package com.chamc.process.entity.factory;

import com.chamc.process.controller.request.SignUpParam;
import com.chamc.process.entity.User;

/**
 * Created by Jaynnay on 2018/4/24
 **/
public class UserFactory {
    public static User signUpUser(SignUpParam param){
        User user = new User();
        user.setUsername(param.getUsername());
        user.setPassword(param.getPassword());
        user.setPassword(param.getPhoneNumber());
        return user;
    }
}
