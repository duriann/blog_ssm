package com.bolo.controller;

import com.bolo.entitys.Comment;
import com.bolo.entitys.JSONResponse;
import com.bolo.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/getById")
    @ResponseBody
    public JSONResponse getById(int id){
        List<Comment> comments = commentService.getCommentsByArticleId(id);
        return JSONResponse.success(comments);
    }
}
