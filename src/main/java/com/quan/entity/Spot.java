package com.quan.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.ToString;

import java.util.Date;

/**
 * @CreateTime: 2023-04-28  11:00
 * 博学笃志，砺剑图强
 */
@Data
@TableName(value = "sys_scenic_spot")
@ToString
public class Spot {
    @TableId(type = IdType.AUTO)
    private Integer id;
    public String touristname;
    public String lng;
    public String lat;
    public String iconUrl;
    public String imageUrl;
    public String description;
    @TableField(value = "createtime")
//    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
}


