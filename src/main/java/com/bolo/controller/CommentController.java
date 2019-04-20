package com.bolo.controller;

import com.bolo.entitys.Comment;
import com.bolo.entitys.JSONResponse;
import com.bolo.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public JSONResponse add(@RequestBody Comment param){
        System.out.println(param);
        commentService.add(param);
        return JSONResponse.success(null,"添加成功!");
    }
}
