package com.chamc.process;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 继承WebMvcConfigurerAdapter，就不要@EnableWebMvc
 */
@SpringBootApplication
@EnableTransactionManagement
@EnableScheduling
@EnableRedisHttpSession
@MapperScan("com.chamc.process.mapper")
public class ProcessApplication{

	public static void main(String[] args) {
		SpringApplication.run(ProcessApplication.class, args);
	}
}
