package com.quan.service;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.quan.entity.Comment;
import com.quan.mapper.CommentMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @CreateTime: 2023-05-05  10:31
 * 博学笃志，砺剑图强
 */
@Service
public class CommentService extends ServiceImpl<CommentMapper, Comment> {
    @Resource
    private CommentMapper commentMapper;


    public List<Comment> findCommentDetail(Integer articleId) {

        return commentMapper.findCommentDetail(articleId);
    }
}


