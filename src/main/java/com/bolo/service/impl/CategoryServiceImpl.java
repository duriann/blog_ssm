package com.bolo.service.impl;

import com.bolo.dao.CategoryMapper;
import com.bolo.entitys.Category;
import com.bolo.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper mapper;

    @Override
    public List<Category> listAll() {
        List<Category> categories = mapper.selectAll();
        System.out.println(categories);
        return categories;
    }

}
