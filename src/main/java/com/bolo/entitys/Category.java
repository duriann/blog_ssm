package com.bolo.entitys;

import java.util.Date;
import java.util.List;

public class Category {
    private Integer id;

    private Integer isNav;

    private String url;//作为导航需要的url

    public Integer getIsNav() {
        return isNav;
    }

    public void setIsNav(Integer isNav) {
        this.isNav = isNav;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    private String name;

    private Integer level;

    private Integer parentId;

    private Date createIme;

    private Date updateTime;

    private List<Category> children;

    public List<Category> getChildren() {
        return children;
    }

    public void setChildren(List<Category> children) {
        this.children = children;
    }

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

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
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