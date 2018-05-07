package com.chamc.process.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

/**
 * Created by Jaynnay on 2018/4/26
 **/
@Service
public class MailService {
    private Logger logger = LoggerFactory.getLogger(MailService.class);
    @Autowired
    MailSender mailSender;

    @Value("${spring.mail.from:xxx@qq.com}")
    String from;

    public Boolean send(SimpleMailMessage message){
        try {
            message.setFrom(from);
            mailSender.send(message);
            return Boolean.TRUE;
        } catch (MailException e) {
            e.printStackTrace();
        }
        return Boolean.FALSE;
    }
}
