package com.bolo.controller;

import com.alibaba.fastjson.JSON;
import com.bolo.entitys.Category;
import com.bolo.entitys.JSONResponse;
import com.bolo.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(path = "/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;


    @RequestMapping("list")
    @ResponseBody
    public JSONResponse list(){
        List<Category> menus = categoryService.listAll();
        Object toJSON = JSON.toJSON(menus);
        System.out.println("menus:" +  toJSON.toString());
        return JSONResponse.success(menus);
    }


}
