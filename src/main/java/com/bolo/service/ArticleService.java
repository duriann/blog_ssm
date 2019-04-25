package com.bolo.service;

import com.bolo.entitys.Article;
import com.bolo.entitys.Page;

import java.util.List;


public interface ArticleService {
    int addArticle(Article article);
    Page<Article> listByPage(String keyword, int currPage, int pageSize);
    Article getById(int id);
    List<Article> selectRecent();

}
