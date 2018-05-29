package com.chamc.process.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * Created by Jaynnay on 2018/4/26
 **/
@Service
public class MailService {
    private Logger logger = LoggerFactory.getLogger(MailService.class);
    @Value("${spring.mail.from:993203876@qq.com}")
    String from;


    @Autowired
    JavaMailSender mailSender;

    public Boolean send(SimpleMailMessage message) {
        try {
            message.setFrom(from);
            mailSender.send(message);
            return Boolean.TRUE;
        } catch (MailException e) {
            e.printStackTrace();
        }
        return Boolean.FALSE;
    }

    public Boolean sendHtmlMail(String to, String subject, String content) {
        try {
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
            messageHelper.setFrom(from);
            messageHelper.setTo(to);
            messageHelper.setSubject(subject);
            messageHelper.setText(content, true);
            return Boolean.TRUE;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return Boolean.FALSE;
    }
}
