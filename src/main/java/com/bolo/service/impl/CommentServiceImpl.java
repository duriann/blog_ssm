package com.bolo.service.impl;

import com.bolo.dao.CommentMapper;
import com.bolo.entitys.Comment;
import com.bolo.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Comment> getCommentsByArticleId(int id) {
        return commentMapper.selectCommentsByArticleId(id);
    }

    @Override
    public int add(Comment comment) {
        return commentMapper.insertSelective(comment);
    }
}
