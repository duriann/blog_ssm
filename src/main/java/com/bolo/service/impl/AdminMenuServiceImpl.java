package com.bolo.service.impl;

import com.bolo.dao.AdminMenuMapper;
import com.bolo.entitys.AdminMenu;
import com.bolo.service.AdminMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminMenuServiceImpl implements AdminMenuService {

    @Autowired
    private AdminMenuMapper mapper;

    @Override
    public List<AdminMenu> listAll() {
        List<AdminMenu> adminMenus = mapper.selectAll();
        System.out.println(adminMenus);
        return adminMenus;
    }

}
