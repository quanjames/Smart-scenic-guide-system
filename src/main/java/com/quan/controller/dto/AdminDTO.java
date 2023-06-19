package com.quan.controller.dto;

import lombok.Data;

/**
 * @CreateTime: 2023-05-06  21:13
 * 博学笃志，砺剑图强
 */
@Data
public class AdminDTO {
    private Integer id;
    private String name;
    private  String password;
    private String adminNickname;
    private String avatarUrl;
    private String token;


}


