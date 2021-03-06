package com.chamc.process.error;

import com.chamc.process.error.ExceptionEnums;
import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * Created by Jaynnay on 2017/12/24
 **/
@Data
@AllArgsConstructor
public class ProcessException extends RuntimeException {
    private static final long serialVersionUID = -1362544102815925841L;
    private ExceptionEnums errorCode;
}
