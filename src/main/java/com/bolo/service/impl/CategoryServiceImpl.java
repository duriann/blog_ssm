package com.bolo.service.impl;

import com.bolo.dao.CategoryMapper;
import com.bolo.entitys.Category;
import com.bolo.entitys.Page;
import com.bolo.entitys.Category;
import com.bolo.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public List<Category> listAll() {
        List<Category> categories = categoryMapper.selectAll();
        System.out.println(categories);
        return categories;
    }

    @Override
    public Page<Category> listByPage(String keyword, int currPage, int pageSize) {
        System.out.println("keyword" + keyword + "currPage: " + currPage);
        Map<String, Object> map = new HashMap<>();
        if (keyword != null){
            keyword = keyword + "%";
        }
        map.put("keyword", keyword);
        map.put("currPage", currPage);
        map.put("pageSize", pageSize);
        List<Category> categories = categoryMapper.getCategoryByPage(map);

        System.out.println("users: "+categories);
        int totalCount = categoryMapper.getCategoryTotalCount(map);
        System.out.println("totalCount: " + totalCount);
        Page<Category> page = new Page<>(currPage,pageSize,totalCount,categories);
        return page;
    }

    @Override
    public int add(Category category) {
        return categoryMapper.insertSelective(category);
    }

    @Override
    public int update(Category category) {
        return categoryMapper.updateByPrimaryKeySelective(category);
    }

    @Override
    public int delete(Integer id) {
        return categoryMapper.deleteByPrimaryKey(id);
    }

}
