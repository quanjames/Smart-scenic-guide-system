package com.quan.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.ToString;

import java.util.Date;

/**
 * @CreateTime: 2023-03-25  11:17
 * 博学笃志，砺剑图强
 */
@Data
@TableName(value = "sys_user")
@ToString
public class User {
        @TableId(type = IdType.AUTO)
        private Integer id;
        private String username;
        @JsonIgnore
        private String password;
        private String nickname;
        private String email;
        private String phone;
        private String address;
        @TableField(value = "createtime")
        private Date createTime;
        @TableField(value = "avata_url")
        private String avatarUrl;


}


