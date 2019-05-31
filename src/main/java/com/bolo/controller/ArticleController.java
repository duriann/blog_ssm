package com.bolo.controller;

import com.alibaba.fastjson.JSON;
import com.bolo.entitys.Article;
import com.bolo.entitys.JSONResponse;
import com.bolo.entitys.Page;
import com.bolo.service.ArticleService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
public class ArticleController {
    @Autowired
    private ArticleService articleService;


    /**
     * 获取最新的5条文章
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/article/getRecent", method = RequestMethod.GET)
    public JSONResponse getRecent() {
        List<Article> articles = articleService.selectRecent();
        return JSONResponse.success(articles);
    }

    /****
     * 添加文章
     * @param param
     * @return
     */
    @RequestMapping(value = "/admin/article/add", method = RequestMethod.POST)
    @ResponseBody
    public JSONResponse add(@RequestBody String param) {
        System.out.println("param " + param);
        Map obj = (Map) JSON.parse(param);
        Article article = new Article();
        article.setTitle((String) obj.get("title"));
        article.setAuthor("admin");
        article.setCategoryId((int) obj.get("categoryId"));
        article.setContent((String) obj.get("content"));
        article.setHeadImg((String)obj.get("headImg"));
        int code = articleService.add(article);
        if (code == 1) {
            return JSONResponse.success(null, "发表成功!");
        }
        return JSONResponse.error("发表失败!");
    }

    /**
     * 分页获取article
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/article/listByPage", method = RequestMethod.GET)
    public JSONResponse listByPage(String keyword, int currPage, int pageSize, Integer categoryId, Integer parentId) {
        System.out.println("keyword:"+ keyword +"categoryId" + categoryId + "parentId" + parentId);
        Page<Article> articles = articleService.listByPage(keyword, currPage, pageSize, categoryId, parentId);
        return JSONResponse.success(articles);
    }


    /**
     * 根据id获取article
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/article/get", method = RequestMethod.GET)
    public JSONResponse listByPage(int id) {
        Article article = articleService.getById(id).get(0);
        return JSONResponse.success(article);
    }

    /**
     * 根据id删除文章
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/admin/article/delete", method = RequestMethod.POST, consumes = "application/json;charset=utf-8")
    public JSONResponse get(@RequestBody Map map) {
        int id = articleService.delete((int) map.get("id"));
        if (id == 0) {
            return JSONResponse.error("删除失败QAQ");
        }
        return JSONResponse.success("删除成功");
    }
}
