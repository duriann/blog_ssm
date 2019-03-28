package com.bolo.dao;

import com.bolo.entitys.AdminMenu;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface AdminMenuMapper {
    @Delete({
        "delete from admin_menu",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into admin_menu (id, name, ",
        "level, parent_id, ",
        "create_time, update_time)",
        "values (#{id,jdbcType=INTEGER}, #{name,jdbcType=VARCHAR}, ",
        "#{level,jdbcType=INTEGER}, #{parentId,jdbcType=INTEGER}, ",
        "#{createTime,jdbcType=TIMESTAMP}, #{updateTime,jdbcType=TIMESTAMP})"
    })
    int insert(AdminMenu record);

    int insertSelective(AdminMenu record);

    @Select({
        "select",
        "id, name, level, parent_id, create_time, update_time",
        "from admin_menu",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @ResultMap("BaseResultMap")
    AdminMenu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AdminMenu record);

    @Update({
        "update admin_menu",
        "set name = #{name,jdbcType=VARCHAR},",
          "level = #{level,jdbcType=INTEGER},",
          "parent_id = #{parentId,jdbcType=INTEGER},",
          "create_time = #{createTime,jdbcType=TIMESTAMP},",
          "update_time = #{updateTime,jdbcType=TIMESTAMP}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(AdminMenu record);

    List<AdminMenu> selectAll();
}