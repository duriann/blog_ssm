package com.bolo.service;

import com.bolo.entitys.AdminMenu;
import com.bolo.entitys.Category;
import com.bolo.entitys.Page;

import java.util.List;

public interface CategoryService {


    public List<Category> listAll();

    Page<Category> listByPage(String keyword, int currPage, int pageSize);

    int add(Category category);
}
