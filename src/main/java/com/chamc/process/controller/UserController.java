package com.chamc.process.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.chamc.process.controller.request.LoginParam;
import com.chamc.process.controller.request.ModifyPwdParam;
import com.chamc.process.controller.request.SetEmailParam;
import com.chamc.process.controller.request.SignUpParam;
import com.chamc.process.entity.User;
import com.chamc.process.entity.factory.UserFactory;
import com.chamc.process.mapper.bo.SysMenu;
import com.chamc.process.service.MessageService;
import com.chamc.process.service.PrivilegeService;
import com.chamc.process.service.UserService;
import com.chamc.process.error.ErrorCode;
import com.chamc.process.error.ProcessException;
import org.apache.commons.compress.utils.Lists;
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

    @Autowired
    PrivilegeService privilegeService;

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

    @PostMapping("menus")
    public List<SysMenu> getMenu(Long id){
        return this.privilegeService.getUserMenu(id);
    }

    /**
     * 注册
     * @param signUpParam
     * @return
     */
    @PutMapping("register")
    public Boolean regist(SignUpParam signUpParam){
        //手机号是否已被注册
        if(this.userService.checkUser(signUpParam.getPhoneNumber()).booleanValue()){
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
        return this.userService.setEmail(param.getId(),param.getEmail());
    }

    @PostMapping("modify/phone")
    public Boolean modifyPhone(Long id, String phone){
        return this.userService.updatePhone(id, phone);
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

    /**
     * 基于base64的头像上传方案 @primary
     * @param id
     * @param cropImg
     * @return
     */
    @PostMapping("avatar/base64")
    public Boolean uploadAvatarBase64(Long id, String cropImg){
        return this.userService.uploadAvatarBase64(id, cropImg);
    }

    /**
     * 基于MultipartFile的头像上传方案
     * @param id
     * @param files
     */
    @PostMapping("avatar")
    public Boolean uploadAvatar(Long id, MultipartFile files){
        return this.userService.uploadAvatar(id, files);
    }

    /**
     * 用户注销
     */
    public void logout(){
        request.getSession().removeAttribute("user");
    }

    /**
     * just a test
     * @return
     */
    @GetMapping("json")
    public JSONObject json(){
        JSONObject json = new JSONObject();
        json.put("num",1);
        JSONArray array = new JSONArray();
        List<User> users = Lists.newArrayList();
        User user = new User();
        user.setUsername("jay");
        users.add(user);
        array.addAll(users);
        json.put("users",array);
        return json;
    }
}
