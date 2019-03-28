package com.bolo.dao;

import com.bolo.entitys.Category;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface CategoryMapper {
    @Delete({
        "delete from category",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into category (id, name, ",
        "parent_id, create_ime, ",
        "update_time)",
        "values (#{id,jdbcType=INTEGER}, #{name,jdbcType=VARCHAR}, ",
        "#{parentId,jdbcType=INTEGER}, #{createIme,jdbcType=TIMESTAMP}, ",
        "#{updateTime,jdbcType=TIMESTAMP})"
    })
    int insert(Category record);

    int insertSelective(Category record);

    @Select({
        "select",
        "id, name, parent_id, create_ime, update_time",
        "from category",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @ResultMap("BaseResultMap")
    Category selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Category record);

    @Update({
        "update category",
        "set name = #{name,jdbcType=VARCHAR},",
          "parent_id = #{parentId,jdbcType=INTEGER},",
          "create_ime = #{createIme,jdbcType=TIMESTAMP},",
          "update_time = #{updateTime,jdbcType=TIMESTAMP}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Category record);
}