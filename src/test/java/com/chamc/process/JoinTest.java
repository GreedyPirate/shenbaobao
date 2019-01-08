package com.chamc.process;

import org.junit.Test;
import org.springframework.util.StringUtils;

/**
 * Created by Jaynnay on 2018/5/1
 **/
public class JoinTest {
    @Test
    public void testJoin() {
        String str = "hi,ni,hao";
        String[] strings = StringUtils.delimitedListToStringArray(str, "," );
        for (int i = 0; i < strings.length; i++) {
            System.out.println(strings[i]);
        }
    }
}
