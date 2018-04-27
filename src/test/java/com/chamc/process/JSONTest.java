package com.chamc.process;

import com.alibaba.fastjson.JSON;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Jaynnay on 2018/2/26
 **/
public class JSONTest {
    @Test
    public void testFastJson(){
        List<ResultBean> result = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            ResultBean bean = new ResultBean("v"+i, "l"+i, null);
            result.add(bean);
        }
        String json = JSON.toJSONString(result);
        System.out.println(json);
    }
}
