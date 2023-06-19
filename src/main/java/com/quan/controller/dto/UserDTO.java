package com.quan.controller.dto;

import lombok.Data;

/**
 * @CreateTime: 2023-03-31  12:11
 * 博学笃志，砺剑图强
 */
@Data
public class UserDTO {
    private Integer id;
    private String username;
    private  String password;
    private String nickname;
    private String avatarUrl;
    private String token;
}


