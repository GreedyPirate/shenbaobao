package com.chamc.process.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * Created by Jaynnay on 2018/7/10
 **/
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin()
                //首页
                .loginPage("/")
                //登录接口
                .loginProcessingUrl("/user/login")
                .and()
                .authorizeRequests()
                //认证接口一定要排除
                .antMatchers("/","index.html","/static/**").permitAll()
                //其它请求都要认证
                .anyRequest()
                .authenticated()
                .and()
                //暂时关闭跨域防护
                .csrf().disable();
    }
}
