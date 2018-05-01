package com.chamc.process.utils.interceptor;

public enum ErrorCode {
    INVAILD_USER(101,"用户名或密码错误"),
    ERROR_VCODE(102, "验证码错误"),
    HAS_BEEN_REGISTED(103,"已被注册"),
    UPLAOD_FAIL(104, "附件上传失败"),
    NO_SUCH_USER(105, "无此用户信息"),
    ILLEGAL_OPERATION(106, "非法操作"),
    INTERNAL_SERVER_ERROR(500, "未知的服务器错误")
    ;

    private final Integer FACTOR = 100;
    private Integer code;
    private String message;

    ErrorCode(Integer code, String message) {
        //this.code = code * FACTOR;
        this.code = code;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
