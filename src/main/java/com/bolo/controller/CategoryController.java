package com.bolo.controller;

import com.alibaba.fastjson.JSON;
import com.bolo.entitys.Category;
import com.bolo.entitys.JSONResponse;
import com.bolo.entitys.Page;
import com.bolo.entitys.User;
import com.bolo.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CategoryController {

    @Autowired
    private CategoryService categoryService;


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
