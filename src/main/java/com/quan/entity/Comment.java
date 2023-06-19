package com.quan.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * @CreateTime: 2023-05-05  10:29
 * 博学笃志，砺剑图强
 */
@Getter
@Setter
@TableName("t_comment")
@ApiModel(value = "Comment对象", description = "")
public class Comment {
    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("内容")
    private String content;

    @ApiModelProperty("评论人id")
    private Integer userId;

    @ApiModelProperty("评论时间")
    private String time;

    @ApiModelProperty("父id")
    private Integer pid;
    @TableField(exist = false)
    private String pNickname;  // 父节点的用户昵称
    @TableField(exist = false)
    private Integer pUserId;  // 父节点的用户id

    @ApiModelProperty("最上级评论id")
    private Integer originId;

    @ApiModelProperty("关联文章的id")
    private Integer articleId;

    @TableField(exist = false)
    private String nickname;
    @TableField(exist = false)
    private String avataUrl;

    @TableField(exist = false)
    private List<Comment> children;
}


