package com.chamc.process;

import com.chamc.process.entity.ArchiveType;
import com.chamc.process.mapper.ArchiveTypeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * Created by Jaynnay on 2018/5/6
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class ArchiveTypeMapperTest {
    @Autowired
    ArchiveTypeMapper archiveTypeMapper;

    @Test
    public void testArchive() {
        List<ArchiveType> archives = this.archiveTypeMapper.getArchives();
        for (ArchiveType archiveType : archives) {
            System.out.println(archiveType);
        }
    }
}
