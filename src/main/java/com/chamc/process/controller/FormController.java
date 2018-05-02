package com.chamc.process.controller;

import com.chamc.process.entity.Attachment;
import com.chamc.process.entity.Register;
import com.chamc.process.entity.User;
import com.chamc.process.service.FileService;
import com.chamc.process.service.RegistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by Jaynnay on 2018/2/4
 **/
@RestController
@RequestMapping("regist")
public class FormController {

    @Autowired
    FileService fileService;

    @Autowired
    HttpServletRequest request;

    @Autowired
    RegistService registService;

    @PostMapping("form")
    public Boolean regist(Register register){
        // TODO adminarea 问题
        return this.registService.regist(register);
    }

    @GetMapping("attachments")
    public List<Attachment> getAttachments() {
        User user = (User) this.request.getSession().getAttribute("user");
        return this.fileService.getAllAttachs(user.getId());
    }

    @PostMapping("upload")
    public List<Attachment> upload(MultipartFile file) {
        User user = (User) request.getSession().getAttribute("user");
        return this.fileService.upload(file);
    }

    @GetMapping("download")
    public ResponseEntity<byte[]> download(Long id){
        try {
            Attachment attachment = this.fileService.getById(id);
            byte[] bytes = new byte[0];
            bytes = FileCopyUtils.copyToByteArray(new File(attachment.getUrl()));
            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Disposition", "attchement;filename="+attachment.getName());
            return new ResponseEntity<byte[]>(bytes,headers, HttpStatus.OK);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @DeleteMapping("delete")
    public Boolean delete(Long[] ids){
        this.fileService.deleteById(ids);
        return Boolean.TRUE;
    }

}
