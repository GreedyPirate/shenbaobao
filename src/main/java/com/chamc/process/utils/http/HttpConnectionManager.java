package com.chamc.process.utils.http;

import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.LayeredConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;

import javax.net.ssl.SSLContext;
import java.security.NoSuchAlgorithmException;

/**
 * Created by Jaynnay on 2018/1/20
 **/
public class HttpConnectionManager {

    private static HttpConnectionManager httpConnectionManager;
    private PoolingHttpClientConnectionManager phcm;

    private HttpConnectionManager() {

    }

    // 单例模式的双重检查机制
    public static HttpConnectionManager getInstance() {
        if (httpConnectionManager == null) {
            synchronized (HttpConnectionManager.class) {
                if (httpConnectionManager == null) {
                    httpConnectionManager = new HttpConnectionManager();
                }
            }
        }
        return httpConnectionManager;
    }

    /**
     * 对https的支持
     */
    private void init() {
        LayeredConnectionSocketFactory sslsf = null;
        try {
            sslsf = new SSLConnectionSocketFactory(SSLContext.getDefault());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        Registry<ConnectionSocketFactory> socketFactoryRegistry = RegistryBuilder.<ConnectionSocketFactory>create()
                .register("https", sslsf).register("http", new PlainConnectionSocketFactory()).build();
        phcm = new PoolingHttpClientConnectionManager(socketFactoryRegistry);
        phcm.setMaxTotal(200);
        phcm.setDefaultMaxPerRoute(20);
    }

    /**
     * 暴露一个基于连接池的CloseableHttpClient
     *
     * @return
     */
    public CloseableHttpClient getHttpClient() {
        return HttpClients.custom().setConnectionManager(phcm).build();
    }

}
