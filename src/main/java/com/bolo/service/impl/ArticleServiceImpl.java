package com.bolo.service.impl;

import com.bolo.dao.ArticleMapper;
import com.bolo.entitys.Article;
import com.bolo.entitys.Page;
import com.bolo.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public int addArticle(Article article) {
        return articleMapper.insertSelective(article);
    }

    @Override
    public Page<Article> listByPage(String keyword, int currPage, int pageSize) {
        System.out.println("keyword" + keyword + "currPage: " + currPage);
        Map<String, Object> map = new HashMap<>();
        if (keyword != null && !"".equals(keyword)){
            keyword = keyword + "%";
            map.put("keyword", keyword);
        }
        map.put("currPage", currPage);
        map.put("pageSize", pageSize);
        System.out.println("map: " + map);

        List<Article> articles = articleMapper.selectAllByPage(map);
        System.out.println("articles: " + articles);
        int totalCount = articleMapper.getArticleTotalCount(map);
        System.out.println("totalCount: " + totalCount);
        Page<Article> page = new Page<>();
        page.setCurrentPage(currPage);
        page.setPageSize(pageSize);
        page.setPages(articles);
        page.setTotalCount(totalCount);
        return page;
    }

    @Override
    public Article getById(int id) {
        return articleMapper.selectById(id);
    }
}
