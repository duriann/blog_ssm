package com.bolo.controller;

import com.bolo.entitys.JSONResponse;
import com.bolo.entitys.Page;
import com.bolo.entitys.User;
import com.bolo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(path = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 获取所有user
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/listAll",method = RequestMethod.GET )
    public JSONResponse listAll(){
        List<User> users = userService.listAll();
        System.out.println(users);
        return JSONResponse.success(users);
    }

    /**
     * 分页获取user
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/listByPage",method = RequestMethod.GET )
    public JSONResponse listByPage(String keyword, int currPage, int pageSize){
        Page<User> users = userService.listByPage(keyword,currPage,pageSize);
        return JSONResponse.success(users);
    }

}
