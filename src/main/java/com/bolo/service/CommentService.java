package com.bolo.service;

import com.bolo.entitys.Comment;

import java.util.List;

public interface CommentService {
    List<Comment> getCommentsByArticleId(int id);
}
