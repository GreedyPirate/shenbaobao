package com.chamc.process.service;

import com.chamc.process.controller.request.LoginParam;
import com.chamc.process.entity.User;
import com.chamc.process.mapper.UserMapper;
import com.chamc.process.utils.SnowFlake;
import com.chamc.process.error.ErrorCode;
import com.chamc.process.error.ProcessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * Created by Jaynnay on 2017/12/24
 **/
@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    /**
     * 检查用户合法性
     *
     * @param loginParam
     * @return
     */
    public User login(LoginParam loginParam) {
        User byNamePass = this.userMapper.findByNamePass(loginParam.getPhoneNumber(), loginParam.getPassword());
        return byNamePass;
    }

    @Transactional(rollbackFor = {ProcessException.class, Exception.class})
    public Boolean registUser(User user) {
        return new Boolean(this.userMapper.save(user) == 1);
    }

    public Boolean checkUser(String username) {
        User exitUser = this.userMapper.findByPhoneNumber(username);
        return exitUser == null;
    }

    /**
     * 检查电话号码是否被注册
     *
     * @param phoneNumber
     * @return
     */
    public int checkPhoneNumber(String phoneNumber) {
        return this.userMapper.getPhoneNumber(phoneNumber);
    }

    /**
     * 修改密码
     */
    @Transactional
    public Boolean changePwd(String phoneNumber, String newP, String old) {
        Integer result = this.userMapper.updatePassword(phoneNumber, newP, old);
        if (result == 1) {
            return Boolean.TRUE;
        }
        return Boolean.FALSE;
    }

    /**
     * 获取用户信息
     *
     * @param id
     * @return
     */
    public User getUserInfo(Long id) {
        User user = this.userMapper.getById(id);
        if (user == null) {
            throw new ProcessException(ErrorCode.NO_SUCH_USER);
        }
        user.setPhoneNumber(this.desensitization(user.getPhoneNumber()));
        return user;
    }

    @Transactional
    public Boolean setEmail(Long id, String email) {
        Integer count = this.userMapper.updateEmail(id, email);
        if (count == 0) {
            throw new ProcessException(ErrorCode.ILLEGAL_OPERATION);
        }
        return Boolean.TRUE;
    }

    /**
     * 电话号码脱敏
     */
    private String desensitization(String number) {
        return number.replaceAll("(\\d{3})\\d{4}(\\d{4})", "$1****$2");
    }

    @Transactional
    public Boolean uploadAvatarBase64(Long id, String base64) {
        Integer result = this.userMapper.updateAvatar(id, base64);
        return new Boolean(result == 1);
    }

    @Transactional
    public Boolean uploadAvatar(Long id, MultipartFile files) {
        String path = this.saveLocal(files);
        Integer result = this.userMapper.updateAvatar(id, path);
        return new Boolean(result == 1);
    }

    private String saveLocal(MultipartFile file) {
        byte[] bytes = new byte[0];
        try {
            String floder = this.createFloder();
            bytes = file.getBytes();
            // TODO 文件名冲突怎么办？
            // 雪花算法
            String fileName = file.getOriginalFilename();
            String ext = fileName.substring(fileName.lastIndexOf('.') + 1);
            SnowFlake snowFlake = new SnowFlake(10, 2);
            StringBuilder builder = new StringBuilder();
            builder.append(snowFlake.nextId()).append(".").append(ext);
            Path path = Paths.get(floder, builder.toString());
            Files.write(path, bytes);
            return path.toString();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    private String createFloder() {
        try {
            String root = System.getProperty("user.dir");
            root += "/img";
            File img = new File(root, "avatar");
            if (!img.exists()) {
                img.mkdirs();
            }
            return img.getCanonicalPath();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Transactional
    public Boolean updatePhone(Long id, String phone){
        Integer result = this.userMapper.updatePhone(id, phone);
        return new Boolean(result == 1);
    }
}
