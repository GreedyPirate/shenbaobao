package com.chamc.process.controller;

import com.chamc.process.entity.ArchiveType;
import com.chamc.process.entity.Attachment;
import com.chamc.process.entity.Register;
import com.chamc.process.service.ArchiveService;
import com.chamc.process.service.FileService;
import com.chamc.process.service.RegistService;
import com.chamc.process.error.ErrorCode;
import com.chamc.process.entity.annotation.NoWrapper;
import com.chamc.process.error.ProcessException;
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

    @Autowired
    ArchiveService archiveService;

    /**
     * 获取档案数据
     * @return
     */
    @GetMapping("archives")
    public List<ArchiveType> getArchives(){
        return this.archiveService.getArchives();
    }

    /**
     * 提交申请
     * @param register
     * @return
     */
    @PostMapping("form")
    public Boolean regist(Register register){
        return this.registService.regist(register);
    }

    /**
     * 获取用户已存在的申请
     * @param userId
     * @return
     */
    @GetMapping("editer")
    public Register getUserRegister(Long userId){
        return this.registService.getByUserId(userId);
    }

    /**
     * 获取附件列表
     * @return
     */
    @GetMapping("attachments")
    public List<Attachment> getAttachments(Long uid) {
        return this.fileService.getAllAttachs(uid);
    }

    /**
     * 上传附件
     * @param file
     * @return
     */
    @PostMapping("upload")
    public List<Attachment> upload(MultipartFile file) {
        return this.fileService.upload(file);
    }

    /**
     * 下载附件
     * @param id
     * @return
     */
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

    /**
     * 删除附件
     * @param ids
     * @return
     */
    @PostMapping("delete")
    public Boolean delete(Long[] ids){
        if(ids == null || ids.length == 0){
            throw new ProcessException(ErrorCode.IDS_CAN_NOT_BE_NUL);
        }
        return this.fileService.deleteById(ids);
    }

}
