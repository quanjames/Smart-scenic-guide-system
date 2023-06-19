package com.quan.service;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.quan.entity.Comment;
import com.quan.entity.ShowComment;
import com.quan.mapper.ShowCommentMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @CreateTime: 2023-05-18  23:03
 * 博学笃志，砺剑图强
 */
@Service
public class ShowCommentService extends ServiceImpl<ShowCommentMapper,ShowComment> {
    @Resource
    private ShowCommentMapper showCommentMapper;

    public List<ShowComment> findCommentDetail(Integer showId) {

        return showCommentMapper.findCommentDetail(showId);
    }

}


