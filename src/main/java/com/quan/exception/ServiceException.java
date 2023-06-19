package com.quan.exception;

/**
 * @CreateTime: 2023-03-31  14:21
 * 博学笃志，砺剑图强
 */
import lombok.Getter;

/**
 * 自定义异常
 */
@Getter
public class ServiceException extends RuntimeException {
    private String code;

    public ServiceException(String code, String msg) {
        super(msg);
        this.code = code;
    }

}



