package com.quan.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.ToString;

import java.util.Date;

/**
 * @CreateTime: 2023-05-14  19:51
 * 博学笃志，砺剑图强
 */
@Data
@TableName(value = "t_show")
@ToString
public class Show {
    @TableId(type = IdType.AUTO)
    private Integer id;

    private  String name;

    private String content;

    private  String position;
    @TableField(value = "image_url")
    private String imageUrl;
    @TableField(value = "begain_time")
    private String begainTime;

}


