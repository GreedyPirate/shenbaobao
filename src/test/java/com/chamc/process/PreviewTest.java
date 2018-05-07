package com.chamc.process;

import com.chamc.process.controller.response.PreviewForm;
import com.chamc.process.mapper.RegisterMapper;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * Created by Jaynnay on 2018/5/8
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class PreviewTest {

    @Autowired
    RegisterMapper registerMapper;

    @Test
    public void testPreview(){
        List<PreviewForm> preview = this.registerMapper.getPreview(1l);
        Assert.assertNotNull(preview);
    }
}
