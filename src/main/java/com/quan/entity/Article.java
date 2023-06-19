package com.quan.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.ToString;

/**
 * @CreateTime: 2023-05-04  10:26
 * 博学笃志，砺剑图强
 */
@Data
@TableName(value = "article")
@ToString
public class Article {

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("标题")
    private String name;

    @ApiModelProperty("内容")
    private String content;

    @ApiModelProperty("发布人")
    private String user;

    @ApiModelProperty("发布时间")
    private String time;

}


