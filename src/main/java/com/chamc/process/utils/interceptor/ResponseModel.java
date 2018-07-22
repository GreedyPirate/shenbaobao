package com.chamc.process.utils.interceptor;

import lombok.Builder;
import lombok.Data;

/**
 * Created by Jaynnay on 2018/4/16
 **/
@Data
@Builder
public class ResponseModel<T> {
    private T data;
    private Integer code;
    private String msg;

}
