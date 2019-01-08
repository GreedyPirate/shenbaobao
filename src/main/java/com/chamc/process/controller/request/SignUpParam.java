package com.chamc.process.controller.request;

import lombok.Data;

/**
 * Created by Jaynnay on 2018/4/24
 **/
@Data
public class SignUpParam extends LoginParam {
    private String username;
    private String vcode;
}
