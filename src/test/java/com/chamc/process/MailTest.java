package com.chamc.process;

import com.chamc.process.service.MailService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * Created by Jaynnay on 2018/4/27
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class MailTest {
    @Autowired
    MailService mailService;

    @Test
    public void testMail(){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo("xxx@qq.com");
        message.setSubject("企业注册申请办理进度通知");
        message.setText("您的申请已审批通过");
        mailService.send(message);
    }
}
