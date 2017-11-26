package com.blog.entity;

import java.io.Serializable;

/**
 * Create 2017/11/13
 */
public class Category implements Serializable{
    private static final long serialVersionUID = 1L;

    private Integer categoryId;
    private String type;
    private Integer isDeleted;


    /*扩展字段*/
    //文章数
    private Integer articleCount;

    public Integer getArticleCount() {
        return articleCount;
    }

    public void setArticleCount(Integer articleCount) {
        this.articleCount = articleCount;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Override
    public String toString() {
        return "Category{" +
                "categoryId=" + categoryId +
                ", type='" + type + '\'' +
                '}';
    }
}
