package com.bolo.controller;

import com.alibaba.fastjson.JSON;
import com.bolo.entitys.Category;
import com.bolo.entitys.JSONResponse;
import com.bolo.entitys.Page;
import com.bolo.entitys.User;
import com.bolo.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class CategoryController {

    @Autowired
    private CategoryService categoryService;


    @ResponseBody
    @RequestMapping(value = "/admin/category/add",method = RequestMethod.POST)
    public JSONResponse add(@RequestBody String param){
        System.out.println("param " + param);
        Map obj = (Map) JSON.parse(param);
        Category category = new Category();
        category.setName((String)obj.get("name"));
        category.setIsNav((int)obj.get("isNav"));
        category.setLevel((int)obj.get("level"));
        category.setParentId((int)obj.get("level"));
        category.setParentUrl((String)obj.get("parentUrl"));
        category.setUrl((String)obj.get("url"));
        category.setSort((int)obj.get("sort"));
        int code = categoryService.add(category);
        if (code == 1) {
            return JSONResponse.success(null, "添加成功!");
        }
        return JSONResponse.error("添加失败!");
    }

    /**
     * 获取所有分类 树形结构
     * @return
     */
    @RequestMapping("/category/list")
    @ResponseBody
    public JSONResponse list(){
        List<Category> menus = categoryService.listAll();
        Object toJSON = JSON.toJSON(menus);
        System.out.println("menus:" +  toJSON.toString());
        return JSONResponse.success(menus);
    }

    /**
     * 分页获取分类
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/admin/category/listByPage",method = RequestMethod.GET )
    public JSONResponse listByPage(String keyword, int currPage, int pageSize){
        Page<Category> page = categoryService.listByPage(keyword,currPage,pageSize);
        return JSONResponse.success(page);
    }
}
