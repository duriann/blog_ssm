package com.bolo.service;

import com.bolo.entitys.Article;
import com.bolo.entitys.Page;

import java.util.List;


public interface ArticleService extends BaseService<Article>{
    List<Article> getById(int id);
    List<Article> selectRecent();

    @Override
    int add(Article article);

    @Override
    int delete(int id);

    @Override
    int update(Article article);

    @Override
    Page<Article> listByPage(String keyword, int currPage, int pageSize, Object... params);

    @Override
    Article get(int id);

    @Override
    List<Article> listAll();
}
