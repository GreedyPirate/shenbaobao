package com.chamc.process.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.arronlong.httpclientutil.HttpClientUtil;
import com.arronlong.httpclientutil.builder.HCB;
import com.arronlong.httpclientutil.common.HttpConfig;
import com.arronlong.httpclientutil.common.HttpHeader;
import com.arronlong.httpclientutil.common.HttpResult;
import com.arronlong.httpclientutil.exception.HttpProcessException;
import com.chamc.process.service.MessageService;
import com.chamc.process.utils.http.HttpConnectionManager;
import com.chamc.process.error.ErrorCode;
import com.chamc.process.error.ProcessException;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Random;

/**
 * Created by Jaynnay on 2018/1/20
 **/
@PropertySource(value = "classpath:config/message.properties" )
@Service
@Slf4j
public class UCPassService implements MessageService {

    private static HCB hcb;

    private static Header[] headers = HttpHeader.custom()
            .accept(MediaType.APPLICATION_JSON_UTF8_VALUE)
            .contentType(MediaType.APPLICATION_JSON_UTF8_VALUE)
            .build();

    static {
        try {
            hcb = HCB.custom()
                    //启用连接池，每个路由最大创建10个链接，总连接数限制为100个
                    .pool(100, 10)
                    .retry(3);
            RequestConfig requestConfig = RequestConfig.custom()
                    .setConnectTimeout(5000)
                    .setSocketTimeout(5000)
                    .build();
            hcb.setDefaultRequestConfig(requestConfig);


        } catch (HttpProcessException e) {
            e.printStackTrace();
        }
    }


    @Value("${ucpass.url}" )
    private String url;

    @Value("${ucpass.accountSid}" )
    private String accountSid;

    @Value("${ucpass.token}" )
    private String token;

    @Value("${ucpass.appid}" )
    private String appid;

    @Value("${ucpass.templateId}" )
    private String templateId;

    @Autowired
    HttpServletRequest request;

    /**
     * 云之讯
     * 发送验证码
     *
     * @param phoneNumber
     * @return
     */
    @Override
    public String sendMessage(String phoneNumber) {
        // 验证码
        String code = this.generateCode();

        JSONObject params = new JSONObject();
        params.put("sid", accountSid);
        params.put("token", token);
        params.put("appid", appid);
        params.put("templateid", templateId);
        params.put("param", code);
        params.put("mobile", phoneNumber);
        params.put("uid", "2d92c6132139467b989d087c84a365d8" );
        String body = params.toJSONString();

        HttpConfig client = HttpConfig.custom()
                .url(url)
                .json(body)
                .headers(headers)
                .client(hcb.build());

        try {
            HttpResult httpResult = HttpClientUtil.sendAndGetResp(client);
            int statusCode = httpResult.getStatusCode();
            if (statusCode != HttpStatus.SC_OK) {
                throw new ProcessException(ErrorCode.POST_MESSAGE_FAIL);
            }
            return HttpClientUtil.post(client);
        } catch (HttpProcessException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String generateCode() {
        StringBuilder result = new StringBuilder();
        String sources = "0123456789";
        Random rand = new Random();

        for (int j = 0; j < 6; j++) {
            result.append(sources.charAt(rand.nextInt(9)) + "" );
        }
        return result.toString();
    }

    /**
     * 原始httpclient方式
     *
     * @param phoneNumber
     * @return
     */
    public String ordinary(String phoneNumber) {
        HttpPost httpPost = null;
        CloseableHttpResponse response = null;
        String result = "";
        try (CloseableHttpClient httpclient = HttpConnectionManager.getInstance().getHttpClient()) {
            httpPost = new HttpPost(url);
            // 设置连接超时,设置读取超时
            RequestConfig requestConfig = RequestConfig.custom()
                    .setConnectTimeout(5000)
                    .setSocketTimeout(5000)
                    .build();
            httpPost.setConfig(requestConfig);

            String param = this.generateCode();
            this.request.getSession().setAttribute("vcode", param);
            JSONObject params = new JSONObject();
            params.put("sid", accountSid);
            params.put("token", token);
            params.put("appid", appid);
            params.put("templateid", templateId);
            params.put("param", param);
            params.put("mobile", phoneNumber);
            params.put("uid", "2d92c6132139467b989d087c84a365d8" );
            String body = params.toJSONString();

            httpPost.setHeader("Accept", "application/json" );
            httpPost.setHeader("Content-Type", "application/json;charset=utf-8" );

            StringEntity se = new StringEntity(body, "UTF-8" );
            httpPost.setEntity(se);


            response = httpclient.execute(httpPost);
            HttpEntity entity = response.getEntity();
            result = EntityUtils.toString(entity);
        } catch (IOException e) {
            log.error(e.getMessage());
        } finally {
            if (response != null) {
                try {
                    response.close();
                } catch (IOException e) {
                    log.error(e.getMessage());
                }
            }
        }

        return result;
    }
}
