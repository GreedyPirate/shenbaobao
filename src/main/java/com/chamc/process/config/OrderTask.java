package com.chamc.process.config;

import org.springframework.scheduling.annotation.Scheduled;

/**
 * Created by Jaynnay on 2018/1/15
 **/
/*@Component*/
public class OrderTask {
    @Scheduled(cron="0 */1 * * * ?")
    public void orderFile(){
        System.out.println("spring boot quartz test ...");
    }
}
