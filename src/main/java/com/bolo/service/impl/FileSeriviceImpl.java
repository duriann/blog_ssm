package com.bolo.service.impl;

import com.bolo.dao.FileMapper;
import com.bolo.entitys.File;
import com.bolo.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileSeriviceImpl implements FileService {

    @Autowired
    private FileMapper fileMapper;

    @Override
    public int addFile(File file) {
        return fileMapper.insertSelective(file);
    }
}
