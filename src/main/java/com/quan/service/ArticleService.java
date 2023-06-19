package com.quan.service;

import cn.hutool.log.Log;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.quan.entity.Article;

import com.quan.mapper.ArticleMapper;
import org.springframework.stereotype.Service;

/**
 * @CreateTime: 2023-05-04  10:33
 * 博学笃志，砺剑图强
 */
@Service
public class ArticleService extends ServiceImpl<ArticleMapper,Article> {

    private static final Log LOG = Log.get();

    public Boolean saveArticle(Article article){
        return saveOrUpdate(article);
    }

}


