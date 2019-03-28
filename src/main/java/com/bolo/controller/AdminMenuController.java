package com.bolo.controller;

import com.alibaba.fastjson.JSON;
import com.bolo.entitys.AdminMenu;
import com.bolo.entitys.JSONResponse;
import com.bolo.service.AdminMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(path = "/adminMenu")
public class AdminMenuController {

    @Autowired
    private AdminMenuService adminMenuService;


    @RequestMapping("list")
    @ResponseBody
    public JSONResponse list(){
        List<AdminMenu> menus = adminMenuService.listAll();
        Object toJSON = JSON.toJSON(menus);
        System.out.println("menus:" +  toJSON.toString());
        return JSONResponse.success(menus);
    }
}
