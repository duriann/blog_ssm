package com.bolo.controller;

import com.alibaba.fastjson.JSON;
import com.bolo.entitys.Category;
import com.bolo.entitys.JSONResponse;
import com.bolo.entitys.Page;
import com.bolo.entitys.User;
import com.bolo.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @ResponseBody
    @RequestMapping(value="/admin/category/delete",method=RequestMethod.POST)
    public JSONResponse delete(@RequestBody String param){
        Map obj = (Map) JSON.parse(param);
        if(obj.containsKey("id")){
            int state = categoryService.delete((int)obj.get("id"));
            if(state!=0){
                return JSONResponse.success(null,"删除成功~");
            }
        }

        return JSONResponse.error("删除失败QAQ") ;
    }

    /**
     * 添加分类
     * @param param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/admin/category/add",method = RequestMethod.POST)
    public JSONResponse add(@RequestBody String param){
        System.out.println("param " + param);
        Map obj = (Map) JSON.parse(param);
        Integer id = null;

        if(obj.containsKey("id")){
            id = (int)obj.get("id");
        }
        Category category = new Category();

        category.setName((String)obj.get("name"));
        category.setIsNav((int)obj.get("isNav"));
        category.setLevel((int)obj.get("level"));
        category.setParentId((int)obj.get("parentId"));
        category.setParentUrl((String)obj.get("parentUrl"));
        category.setUrl((String)obj.get("url"));
        category.setSort((int)obj.get("sort"));
        int code;
        String successMsg = "添加成功";
        String errMsg = "添加失败";
        if(id!=null){
            category.setId(id);
            code = categoryService.update(category);
            successMsg = "更新成功";
            errMsg = "更新失败";
        }else{
            code = categoryService.add(category);
        }

        if (code == 1) {
            return JSONResponse.success(null, successMsg);
        }
        return JSONResponse.error(errMsg);
    }

    /**
     * 获取所有一级分类 树形结构
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
