package com.chamc.process.security.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * Created by Jaynnay on 2018/7/20
 **/
@ConfigurationProperties("frame.security")
@Data
public class SecurityProperties {
    private BrowserProperties browser;

}
