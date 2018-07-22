package com.chamc.process.mapper;

import com.chamc.process.entity.ArchiveType;

import java.util.List;

public interface ArchiveTypeMapper {
    /**
     * 获取所有的档案数据
     * @return
     */
    List<ArchiveType> getArchives();
}
