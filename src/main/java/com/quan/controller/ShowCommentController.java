package com.quan.controller;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.quan.common.Result;
import com.quan.entity.ShowComment;
import com.quan.service.ShowCommentService;
import com.quan.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * @CreateTime: 2023-05-18  22:15
 * 博学笃志，砺剑图强
 */
@RestController
@RequestMapping("/showcomment")
public class ShowCommentController {

    @Autowired
    private ShowCommentService showCommentService;
    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody ShowComment showComment) {
        if (showComment.getId() == null) { // 新增评论
            showComment.setUserId(TokenUtils.getCurrentUser().getId());
            showComment.setTime(DateUtil.now());

            if (showComment.getPid() != null) {  // 判断如果是回复，进行处理
                Integer pid = showComment.getPid();
                ShowComment pComment = showCommentService.getById(pid);
                if (pComment.getOriginId() != null) {  // 如果当前回复的父级有祖宗，那么就设置相同的祖宗
                    showComment.setOriginId(pComment.getOriginId());
                } else {  // 否则就设置父级为当前回复的祖宗
                    showComment.setOriginId(showComment.getPid());
                }
            }

        }
        showCommentService.saveOrUpdate(showComment);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        showCommentService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        showCommentService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(showCommentService.list());
    }

    @GetMapping("/tree/{showId}")
    public Result findTree(@PathVariable Integer showId) {
        List<ShowComment> showComments = showCommentService.findCommentDetail(showId);  // 查询所有的评论和回复数据
        System.out.println(showComments);
        // 查询评论数据（不包括回复）
        List<ShowComment> originList = showComments.stream().filter(showcomment -> showcomment.getOriginId() == null).collect(Collectors.toList());

        // 设置评论数据的子节点，也就是回复内容
        for (ShowComment origin : originList) {
            List<ShowComment> comments = showComments.stream().filter(showcomment -> origin.getId().equals(showcomment.getOriginId())).collect(Collectors.toList());  // 表示回复对象集合
            comments.forEach(showComment -> {
                Optional<ShowComment> pComment = showComments.stream().filter(c1 -> c1.getId().equals(showComment.getPid())).findFirst();  // 找到当前评论的父级
                pComment.ifPresent((v -> {  // 找到父级评论的用户id和用户昵称，并设置给当前的回复对象
                    showComment.setPUserId(v.getUserId());
                    showComment.setPNickname(v.getNickname());
                }));
            });
            origin.setChildren(comments);
        }
        return Result.success(originList);
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(showCommentService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam(defaultValue = "") String content) {
        QueryWrapper<ShowComment> queryWrapper = new QueryWrapper<>();
        if(!"".equals(content)){
            queryWrapper.like("content",content);
        }
        queryWrapper.orderByDesc("id");
        return Result.success(showCommentService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }
}


