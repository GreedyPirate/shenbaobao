package com.chamc.process.controller;

import com.chamc.process.entity.Attachment;
import com.chamc.process.entity.Register;
import com.chamc.process.entity.User;
import com.chamc.process.service.FileService;
import com.chamc.process.service.RegistService;
import com.chamc.process.utils.interceptor.NoWrapper;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
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
        return this.fileService.upload(file);
    }

    @GetMapping("download")
    @NoWrapper
    public ResponseEntity<byte[]> download(Long id){
        try {
            Attachment attachment = this.fileService.getById(id);
            byte[] bytes = new byte[0];
            bytes = FileCopyUtils.copyToByteArray(new File(attachment.getUrl()));
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            headers.setContentDispositionFormData("attachment",attachment.getName());
            return new ResponseEntity<byte[]>(bytes,headers, HttpStatus.OK);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 文件下载第二版
     * @param response
     * @param id
     */
    @GetMapping("download/v2")
    @NoWrapper
    public void downloadV2(HttpServletResponse response, Long id){
        Attachment attachment = this.fileService.getById(id);
        try(InputStream is = new FileInputStream(attachment.getUrl());
            OutputStream os = response.getOutputStream()) {
            response.setCharacterEncoding("utf-8");
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment;fileName=" + attachment.getName());
            IOUtils.copy(is,os);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @DeleteMapping("delete")
    public Boolean delete(Long[] ids){
        return this.fileService.deleteById(ids);
    }

}
