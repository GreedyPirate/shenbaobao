package com.chamc.process.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.chamc.process.service.MessageService;
import com.chamc.process.utils.http.HttpConnectionManager;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Random;

/**
 * Created by Jaynnay on 2018/1/20
 **/
@PropertySource(value = "classpath:config/message.properties")
@Service
@Slf4j
public class UCPassService implements MessageService {

    @Autowired
    Environment environment;

    @Autowired
    HttpServletRequest request;

    /**
     * 云之讯
     * 发送验证码
     * @param phoneNumber
     * @return
     */
    @Override
    public String sendMessage(String phoneNumber) {
        CloseableHttpClient httpclient = null;
        HttpPost httpPost = null;
        CloseableHttpResponse response = null;
        String result = "";
        try {
            httpclient = HttpConnectionManager.getInstance().getHttpClient();
            String url = environment.getProperty("ucpass.url");
            httpPost = new HttpPost(url);
            // 设置连接超时,设置读取超时
            RequestConfig requestConfig = RequestConfig.custom()
                    .setConnectTimeout(5000)
                    .setSocketTimeout(5000)
                    .build();
            httpPost.setConfig(requestConfig);


            String accountSid = environment.getProperty("ucpass.accountSid");
            String token = environment.getProperty("ucpass.token");
            String appid = environment.getProperty("ucpass.appid");
            String templateId = environment.getProperty("ucpass.templateId");
            String param = this.generateCode();
            this.request.getSession().setAttribute("vcode",param);
            JSONObject params = new JSONObject();
            params.put("sid", accountSid);
            params.put("token", token);
            params.put("appid", appid);
            params.put("templateid", templateId);
            params.put("param", param);
            params.put("mobile", phoneNumber);
            params.put("uid", "2d92c6132139467b989d087c84a365d8");
            String body = params.toJSONString();

            httpPost.setHeader("Accept", "application/json");
            httpPost.setHeader("Content-Type", "application/json;charset=utf-8");

            StringEntity se = new StringEntity(body, "UTF-8");
            httpPost.setEntity(se);

            response = httpclient.execute(httpPost);
            HttpEntity entity = response.getEntity();
            result = EntityUtils.toString(entity);

        } catch (IOException e1) {
            e1.printStackTrace();
        }

        return result;
    }

    public String generateCode() {
        StringBuilder result = new StringBuilder();
        String sources = "0123456789";
        Random rand = new Random();

        for (int j = 0; j < 6; j++) {
            result.append(sources.charAt(rand.nextInt(9)) + "");
        }
        return result.toString();
    }

}
