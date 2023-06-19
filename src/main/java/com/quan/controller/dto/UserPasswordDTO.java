package com.quan.controller.dto;

import lombok.Data;

/**
 * @CreateTime: 2023-05-20  16:43
 * 博学笃志，砺剑图强
 */
@Data
public class UserPasswordDTO {
    private String username;
    private String password;
    private String newPassword;
}

