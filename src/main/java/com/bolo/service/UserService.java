package com.bolo.service;

import com.bolo.entitys.Page;
import com.bolo.entitys.User;

import java.util.List;

public interface UserService {

    List<User> listAll();

    Page<User> listByPage(String keyword, int currPage, int pageSize);
}
