package com.bolo.dao;

import com.bolo.entitys.Comment;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface CommentMapper {
    @Delete({
        "delete from comment",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into comment (id, article_id, ",
        "user_id)",
        "values (#{id,jdbcType=INTEGER}, #{articleId,jdbcType=INTEGER}, ",
        "#{userId,jdbcType=INTEGER})"
    })
    int insert(Comment record);

    int insertSelective(Comment record);

    @Select({
        "select",
        "id, article_id, user_id",
        "from comment",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @ResultMap("BaseResultMap")
    Comment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Comment record);

    @Update({
        "update comment",
        "set article_id = #{articleId,jdbcType=INTEGER},",
          "user_id = #{userId,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Comment record);
}