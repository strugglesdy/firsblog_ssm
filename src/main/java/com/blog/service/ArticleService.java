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

    /**
     * @Title: countArticleByCategoryId
     * @Description: TODO(获得某个分类的文章数)
     * @param [categoryId]
     * @return java.lang.Integer
     */
    Integer countArticleByCategoryId(Integer categoryId) throws Exception;

    /**
     * @Title: getArticleDetailById
     * @Description: TODO(文章详情页面显示)
     * @param [articleId]
     * @return com.blog.entity.Article
     */
    Article getArticleDetailById(Integer articleId) throws Exception;
    /**
     * @Title: countArticle
     * @Description: TODO(文章总数)
     * @param []
     * @return java.lang.Integer
     */
    Integer countArticle() throws Exception;

}
