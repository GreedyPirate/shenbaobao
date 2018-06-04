package com.chamc.process;

import org.junit.Test;

import java.util.Random;

/**
 * Created by Jaynnay on 2018/1/14
 **/
public class UCPassMessage {

    @Test
    public void testSend(){

    }
    @Test
    public void testCode(){
        StringBuilder result = new StringBuilder();
        String sources = "0123456789";
        Random rand = new Random();
        for (int j = 0; j < 6; j++) {
            result.append(sources.charAt(rand.nextInt(9)) + "");
        }
        System.out.println(result.toString());
        System.out.println(1>1);
    }
}
