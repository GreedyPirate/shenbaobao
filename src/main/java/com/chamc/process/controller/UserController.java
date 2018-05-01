package com.chamc.process.controller;

import com.chamc.process.controller.request.LoginParam;
import com.chamc.process.controller.request.ModifyPwdParam;
import com.chamc.process.controller.request.SetEmailParam;
import com.chamc.process.controller.request.SignUpParam;
import com.chamc.process.entity.User;
import com.chamc.process.entity.factory.UserFactory;
import com.chamc.process.service.MessageService;
import com.chamc.process.service.UserService;
import com.chamc.process.utils.interceptor.ErrorCode;
import com.chamc.process.utils.interceptor.ProcessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
        //手机号是否已被注册
        List<User> users = this.userService.checkUser(signUpParam.getPhoneNumber());
        if(users != null && users.size() > 0){
            throw new ProcessException(ErrorCode.HAS_BEEN_REGISTED);
        }
        // 校验验证码
        String sessionCode = (String) this.request.getSession().getAttribute("vcode");
        if(!signUpParam.getVcode().equals(sessionCode)){
            throw new ProcessException(ErrorCode.ERROR_VCODE);
        }
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

    /**
     * 修改密码
     * @param param
     * @return
     */
    @PostMapping("modify/password")
    public Boolean modifyPassword(ModifyPwdParam param){
        User user = (User) request.getSession().getAttribute("user");
        return this.userService.changePwd(user.getPhoneNumber(),param.getNewp(), param.getOld());
    }

    @PostMapping("modify/email")
    public Boolean modifyEmail(SetEmailParam param){
        User user = (User) request.getSession().getAttribute("user");
        return this.userService.setEmail(param.getId(),param.getEmail());
    }

    /**
     * 获取用户信息
     * @param id
     * @return
     */
    @GetMapping("base")
    public User getUserInfo(Long id){
        return this.userService.getUserInfo(id);
    }

    @PostMapping("avatar")
    public void uploadAvatar(Long id, MultipartFile file){
        this.userService.uploadAvatar(id, file);
    }
}
