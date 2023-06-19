package com.quan.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.ToString;

/**
 * @CreateTime: 2023-05-06  20:02
 * 博学笃志，砺剑图强
 */
@Data
@TableName(value = "admin")
@ToString
public class Admin {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String adminName;
    private  String adminPassword;
    private String adminNickname;
    private String avatarUrl;

}


