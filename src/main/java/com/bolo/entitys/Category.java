package com.bolo.entitys;

import java.util.Date;

public class Category {
    private Integer id;

    private String name;

    private Integer parentId;

    private Date createIme;

    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Date getCreateIme() {
        return createIme;
    }

    public void setCreateIme(Date createIme) {
        this.createIme = createIme;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}