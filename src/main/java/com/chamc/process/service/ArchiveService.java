package com.chamc.process.service;

import com.chamc.process.entity.ArchiveType;
import com.chamc.process.mapper.ArchiveTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Jaynnay on 2018/5/6
 **/
@Service
public class ArchiveService {

    @Autowired
    ArchiveTypeMapper archiveTypeMapper;

    public List<ArchiveType> getArchives() {
        return this.archiveTypeMapper.getArchives();
    }
}
