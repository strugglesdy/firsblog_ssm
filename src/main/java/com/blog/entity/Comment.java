package com.blog.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Create 2017/10/31
 */
public class Comment implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer commentId;
    private Integer articleId;
    private String content;
    private Date createTime;
    private Date updateTime;
    private Article article;
}
