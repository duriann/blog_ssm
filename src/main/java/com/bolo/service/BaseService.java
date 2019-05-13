package com.bolo.service;

import com.bolo.entitys.Page;

import java.util.List;

public interface BaseService<T> {
    int add(T t);
    int delete(int id);
    int update(T t);
    T get(int id);
    Page<T> listByPage(String keyword, int currPage, int pageSize , Object ...params);
    List<T> listAll();
}
