package com.bolo.service.impl;

import com.bolo.dao.ArticleMapper;
import com.bolo.entitys.Article;
import com.bolo.entitys.Page;
import com.bolo.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public int add(Article article) {
        return articleMapper.insertSelective(article);
    }

    @Override
    public int delete(int id) {
        return articleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(Article article) {
        return 0;
    }



    @Override
    public Article get(int id) {
        return null;
    }

    @Override
    public Page<Article> listByPage(String keyword, int currPage, int pageSize, Object ...params) {
        Map<String, Object> map = new HashMap<>();
        if (keyword != null && !"".equals(keyword)) {
            keyword = keyword + "%";
            map.put("keyword", keyword);
        }
        if (params[0] != null) {
            map.put("categoryId", params[0]);
        }
        if (params[1] != null) {
            map.put("parentId", params[1]);
        }
        map.put("currPage", currPage);
        map.put("pageSize", pageSize);

        List<Article> articles = articleMapper.selectAllByPage(map);
        int totalCount = articleMapper.getArticleTotalCount(map);
        Page<Article> page = new Page<>(currPage, pageSize, totalCount, articles);

        return page;
    }

    @Override
    public List<Article> listAll() {
        return null;
    }

    @Override
    public List<Article> getById(int id) {
        return articleMapper.selectById(id);
    }

    @Override
    public List<Article> selectRecent() {
        return articleMapper.selectRecent();
    }
}
