package com.bolo.entitys;

import java.util.Date;
import java.util.List;

public class Category {
    private Integer id;

    private Integer isNav;//是否是导航

    private Integer sort;//排序号

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

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

    private String parentUrl;

    public String getParentUrl() {
        return parentUrl;
    }

    public void setParentUrl(String parentUrl) {
        this.parentUrl = parentUrl;
    }

    private Date createTime;

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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", isNav=" + isNav +
                ", sort=" + sort +
                ", url='" + url + '\'' +
                ", name='" + name + '\'' +
                ", level=" + level +
                ", parentId=" + parentId +
                ", parentUrl='" + parentUrl + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", children=" + children +
                '}';
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}