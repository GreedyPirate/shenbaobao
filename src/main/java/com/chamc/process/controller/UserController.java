package com.chamc.process.controller;

import com.chamc.process.controller.request.LoginParam;
import com.chamc.process.controller.request.SignUpParam;
import com.chamc.process.entity.User;
import com.chamc.process.entity.factory.UserFactory;
import com.chamc.process.service.MessageService;
import com.chamc.process.service.UserService;
import com.chamc.process.utils.interceptor.ErrorCode;
import com.chamc.process.utils.interceptor.ProcessException;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Jaynnay on 2017/12/24
 **/
@RestController
@RequestMapping("/user")
public class UserController {


    @Autowired
    UserService userService;

    @Autowired
    HttpServletRequest request;

    @Autowired
    MessageService messageService;

    @GetMapping("allUser")
    public List<User> allUser(){
        PageHelper.startPage(1,5);
        return this.userService.allUsers();
    }

    /**
     * 用户登录
     * @param loginParam
     * @return
     */
    @PostMapping("login")
    public User login(LoginParam loginParam){
        User login = this.userService.login(loginParam);
        if(login == null){
            throw new ProcessException(ErrorCode.INVAILD_USER);
        }
        request.getSession().setAttribute("user",login);
        return login;
    }

    /**
     * 注册
     * @param signUpParam
     * @return
     */
    @PutMapping("register")
    public User regist(SignUpParam signUpParam){
        // 1.校验验证码
        String sessionCode = (String) this.request.getSession().getAttribute("vcode");
        if(!signUpParam.getVcode().equals(sessionCode)){
            throw new ProcessException(ErrorCode.ERROR_VCODE);
        }
        /*  List<User> users = this.userService.checkUser(user.getUsername());
        if(users != null && users.size() > 0){
            throw new ProcessException("用户名已存在");
        }*/
        return this.userService.registUser(UserFactory.signUpUser(signUpParam));
    }

    /**
     * 发送验证码
     * @param phoneNumber
     * @return
     */
    @PostMapping("sendMsg")
    public String sendMsg(String phoneNumber){
        return messageService.sendMessage(phoneNumber);
    }

    // 检查手机号是否已被注册，暂时不用
    @GetMapping("checkNu mber")
    public int checkNumber(String phoneNumber){
        int count = this.userService.checkPhoneNumber(phoneNumber);
        if(count > 1){
            throw new ProcessException(ErrorCode.HAS_BEEN_REGISTED);
        }
        return count;
    }
}
