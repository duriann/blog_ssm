package com.bolo.service.impl;

import com.bolo.dao.ArticleMapper;
import com.bolo.entitys.Article;
import com.bolo.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public int addArticle(Article article) {
        return articleMapper.insertSelective(article);
    }
}
