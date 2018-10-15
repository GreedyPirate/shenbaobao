package com.chamc.process.service.impl;

import com.chamc.process.entity.Attachment;
import com.chamc.process.entity.User;
import com.chamc.process.mapper.AttachmentMapper;
import com.chamc.process.service.FileService;
import com.chamc.process.utils.SnowFlake;
import com.chamc.process.error.ErrorCode;
import com.chamc.process.error.ProcessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Jaynnay on 2018/2/4
 **/
@Service
public class FileServiceImp implements FileService {
    @Autowired
    HttpServletRequest request;

    @Autowired
    AttachmentMapper attachmentMapper;

    @Override
    public List<Attachment> getAllAttachs(long uid) {
        return this.attachmentMapper.getUserAttach(uid);
    }

    @Override
    @Transactional
    public List<Attachment> upload(MultipartFile file) {
        try {
            User user = (User) request.getSession().getAttribute("user");
            Attachment upload = new Attachment();
            SnowFlake snowFlake = new SnowFlake(2, 3);
            upload.setSize(file.getSize());
            String fileName = file.getOriginalFilename();
            upload.setName(fileName);
            String ext = fileName.substring(fileName.lastIndexOf('.') + 1);
            upload.setExt(ext);
            Long name = snowFlake.nextId();
            Path path = saveFile(file, name, ext);
            upload.setUid(user.getId());
            upload.setUrl(path.toString());
            attachmentMapper.save(upload);

            List<Attachment> userAttach = attachmentMapper.getUserAttach(user.getId());
            return userAttach;
        } catch (IOException e) {
            throw new ProcessException(ErrorCode.UPLAOD_FAIL);
        }
    }

    private Path saveFile(MultipartFile file, Long name, String ext) throws IOException {
        byte[] bytes = new byte[0];
        bytes = file.getBytes();
        //雪花id作为文件名
        Path path = Paths.get(this.makeDir(), name + "." + ext);
        Files.write(path, bytes);
        return path;
    }

    @Override
    public Attachment getById(Long id) {
        return attachmentMapper.getById(id);
    }

    @Override
    @Transactional
    public Boolean deleteById(Long[] ids) {
        List<Attachment> files = this.attachmentMapper.getUrlByIds(ids);
        List<Long> delIds = new ArrayList(ids.length);
        if (!CollectionUtils.isEmpty(files)) {
            for (Attachment file : files) {
                File f = new File(file.getUrl());
                if (f.exists()) {
                    boolean success = f.delete();
                    if (success) {
                        // 文件删除成功，才去删记录
                        delIds.add(file.getId());
                    }
                } else {
                    continue;
                }
            }
            Long[] param = delIds.toArray(new Long[delIds.size()]);
            Integer count = this.attachmentMapper.deleteByIds(param);
            return new Boolean(count > 0);
        }
        return Boolean.FALSE;
    }


}
