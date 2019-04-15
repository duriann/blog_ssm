package com.bolo.service.impl;

import com.bolo.dao.UserMapper;
import com.bolo.entitys.Page;
import com.bolo.entitys.User;
import com.bolo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public List<User> listAll() {
        return userMapper.selectAll();
    }

    @Override
    public Page<User> listByPage(String keyword, int currPage, int pageSize) {
        System.out.println("keyword" + keyword + "currPage: " + currPage);
        Map<String, Object> map = new HashMap<>();
        if (keyword != null){
            keyword = keyword + "%";
        }
        map.put("keyword", keyword);
        map.put("currPage", currPage);
        map.put("pageSize", pageSize);
        List<User> users = userMapper.getUserByPage(map);

        System.out.println("users: "+users);
        int totalCount = userMapper.getUserTotalCount(map);
        System.out.println("totalCount: " + totalCount);
        Page<User> page = new Page<>(currPage,pageSize,totalCount,users);
        return page;
    }

    @Override
    public User login(String username, String password) {
        Map<String, Object> map = new HashMap<>();
        map.put("username",username);
        map.put("password",password);
        return userMapper.login(map);
    }


}
