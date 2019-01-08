package com.chamc.process.service;

import com.chamc.process.entity.Attachment;
import com.chamc.process.utils.DateUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

public interface FileService {

    public List<Attachment> getAllAttachs(long uid);

    public List<Attachment> upload(MultipartFile file);

    public Attachment getById(Long id);

    public Boolean deleteById(Long[] ids);

    default String makeDir() throws IOException {
        String date = DateUtils.format(new Date(), "yyyyMMdd" );
        String root = System.getProperty("user.dir" );
        File dir = new File(root, date);
        if (!dir.exists()) {
            dir.mkdir();
        }
        return dir.getCanonicalPath().toString();
    }
}
