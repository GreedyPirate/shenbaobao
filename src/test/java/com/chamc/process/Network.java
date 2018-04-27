package com.chamc.process;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.junit.Test;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * Created by Jaynnay on 2018/1/10
 **/
public class Network {
    @Test
    public void testCross(){
        CloseableHttpClient httpclient = HttpClients.createDefault();
        String url = "http://dl.stream.qqmusic.qq.com/C400002Lw3Of2z0nI8.m4a?guid=4978541008" +
                "&vkey=4A5BCFD8CE6AB1BE04C4AC36F173DC8A19E665521583D51359662FECC6E8F115E360ECB8F891C514EA362D3C10A8D923B43572DB43315E3D" +
                "&uin=&fromtag=999";
        HttpGet httpget = new HttpGet(url);
        httpget.setHeader("Host","dl.stream.qqmusic.qq.com");
        httpget.setHeader("Range","bytes=0-");
        httpget.setHeader("Accept-Encoding","identity;q=1, *;q=0");
        CloseableHttpResponse response = null;
        try (FileOutputStream file = new FileOutputStream(new File("d:/qq.mp3"));){
            response = httpclient.execute(httpget);
            HttpEntity entity = response.getEntity();
            InputStream content = entity.getContent();

            byte[] buf = new byte[1024];
            while((content.read(buf)) != -1){
                file.write(buf,0,buf.length);
            }
        } catch (IOException e1) {
            e1.printStackTrace();
        }
    }
}
