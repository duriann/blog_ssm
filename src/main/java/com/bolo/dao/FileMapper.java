package com.bolo.dao;

import com.bolo.entitys.File;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface FileMapper {
    @Delete({
        "delete from file",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into file (id, name, ",
        "path, create_time, ",
        "update_time)",
        "values (#{id,jdbcType=INTEGER}, #{name,jdbcType=VARCHAR}, ",
        "#{path,jdbcType=VARCHAR}, #{createTime,jdbcType=TIMESTAMP}, ",
        "#{updateTime,jdbcType=TIMESTAMP})"
    })
    int insert(File record);

    int insertSelective(File record);

    @Select({
        "select",
        "id, name, path, create_time, update_time",
        "from file",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @ResultMap("BaseResultMap")
    File selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(File record);

    @Update({
        "update file",
        "set name = #{name,jdbcType=VARCHAR},",
          "path = #{path,jdbcType=VARCHAR},",
          "create_time = #{createTime,jdbcType=TIMESTAMP},",
          "update_time = #{updateTime,jdbcType=TIMESTAMP}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(File record);
}