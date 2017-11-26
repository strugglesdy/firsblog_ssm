package com.blog.service;

import com.blog.entity.Article;

import java.util.List;

/**
 * Create 2017/11/15
 */
public interface ArticleService {

    void addArticle(Article article) throws Exception;

    Article getByArticleId(Integer articleId) throws Exception;

    void updateArticle(Article article) throws Exception;

    boolean modifyIsDeletedById(Integer articleId,Integer isDeleted) throws Exception;

    List<Article> getByCategoryId(Integer categoryId) throws Exception;

    List<Article> listAll() throws Exception;

    List<Article> listAllOf(String title) throws Exception;

    //获得某个分类的文章数
    Integer countArticleByCategoryId(Integer categoryId) throws Exception;

}
