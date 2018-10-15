package com.chamc.process.utils.interceptor;

public enum ErrorCode implements ExceptionEnums{
    INVAILD_USER(101,"用户名或密码错误"),
    ERROR_VCODE(102, "验证码错误"),
    HAS_BEEN_REGISTED(103,"已被注册"),
    UPLAOD_FAIL(104, "附件上传失败"),
    NO_SUCH_USER(105, "无此用户信息"),
    ILLEGAL_OPERATION(106, "非法操作"),
    TOO_MUSH_REGISTER(107, "用户至多有一条未审批申请"),
    BUILD_PDF_FAIL(108,"生成pdf失败"),
    IDS_CAN_NOT_BE_NUL(109,"请选择要删除的文件"),
    YOU_HAVE_ALREADY_REGISTED(110,"您已经提交过申请了，请不要重复提交"),
    QUERY_ROLE_FAIL(111,"查询用户角色失败"),
    POST_MESSAGE_FAIL(112,"发送验证码失败"),
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

    @Override
    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
