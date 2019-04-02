package com.bolo.dao;

import com.bolo.entitys.Article;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface ArticleMapper {
    @Delete({
        "delete from article",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into article (id, title, ",
        "author, comment_id, ",
        "content, create_time, ",
        "update_time, like, ",
        "category_id)",
        "values (#{id,jdbcType=INTEGER}, #{title,jdbcType=VARCHAR}, ",
        "#{author,jdbcType=VARCHAR}, #{commentId,jdbcType=VARCHAR}, ",
        "#{content,jdbcType=VARCHAR}, #{createTime,jdbcType=TIMESTAMP}, ",
        "#{updateTime,jdbcType=TIMESTAMP}, #{like,jdbcType=INTEGER}, ",
        "#{categoryId,jdbcType=INTEGER})"
    })
    int insert(Article record);

    int insertSelective(Article record);

    @Select({
        "select",
        "id, title, author, comment_id, content, create_time, update_time, like, category_id",
        "from article",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @ResultMap("BaseResultMap")
    Article selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Article record);

    @Update({
        "update article",
        "set title = #{title,jdbcType=VARCHAR},",
          "author = #{author,jdbcType=VARCHAR},",
          "comment_id = #{commentId,jdbcType=VARCHAR},",
          "content = #{content,jdbcType=VARCHAR},",
          "create_time = #{createTime,jdbcType=TIMESTAMP},",
          "update_time = #{updateTime,jdbcType=TIMESTAMP},",
          "like = #{like,jdbcType=INTEGER},",
          "category_id = #{categoryId,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Article record);

    List<Article> selectAllByPage(Map map);
    int getArticleTotalCount(Map map);
    Article selectById(int id);
}