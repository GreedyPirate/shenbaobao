package com.chamc.process.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

/**
 * Created by Jaynnay on 2018/4/15
 **/
public class FileUtils {
    private static Logger logger = LoggerFactory.getLogger(FileUtils.class);

    public static byte[] fileToByte(String path) {
        try {
            return fileToByte(new FileInputStream(path));
        } catch (FileNotFoundException e) {
            logger.error("convert file to byte array error, msg is {}", e.getMessage());
            throw new RuntimeException(e);
        }
    }

    public static byte[] fileToByte(FileInputStream fis) {
        ByteArrayOutputStream bos = null;
        try {
            bos = new ByteArrayOutputStream();
            byte[] b = new byte[4*1024];
            int len = -1;
            while((len = fis.read(b)) != -1) {
                bos.write(b, 0, len);
            }
            return bos.toByteArray();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }finally {
            if(fis != null){
                try {
                    fis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if(bos != null){
                try {
                    bos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
