package com.bolo.controller;

import com.alibaba.fastjson.JSON;
import com.bolo.entitys.Article;
import com.bolo.entitys.JSONResponse;
import com.bolo.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public JSONResponse add(@RequestBody String param){
        System.out.println("param "+ param );
        Map obj = (Map)JSON.parse(param);
        Article article = new Article();
        article.setTitle((String) obj.get("title"));
        article.setAuthor("admin");
        article.setCategoryId((int) obj.get("categoryId"));
        article.setContent((String) obj.get("content"));
        int code = articleService.addArticle(article);
        if (code == 1){
            return JSONResponse.success(null,"发表成功!");
        }
        return JSONResponse.error("发表失败!");
    }
}
