package com.blog.dao;

import com.blog.entity.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Optional;

/**
 * Create 2017/11/15
 */
public interface ArticleDao {
    /**
     * 新建文章
     * @param article
     */
    void insert(Article article);

    /**
     * 根据文章ID查找文章
     * @param articleId
     * @return
     */
    Article selectByArticleId(@Param("articleId") Integer articleId);

    /**
     * 更新文章内容
     * @param article
     */
    void update(Article article);

    /**
     * 根据文章ID删除
     * @param articleId
     */
    boolean deleteByArticleId(Integer articleId);

    /**
     * 根据类型获得相关文章列表
     * @param categoryId
     * @return
     */
    List<Article> selectByCategoryId(Integer categoryId);

    /**
     * 根据文章名称获得文章
     * @param title
     * @return
     */
    List<Article> selectAllOf(@Param("title") String title);

    /**
     * 获得文章列表
     * @return
     */
    List<Article> selectAll();

    /**
     * 获得该分类的文章数
     * @param categoryId
     * @return
     */
    Integer countArticleByCategoryId(Integer categoryId);

    /**
     * @Title: countArticle
     * @Description: TODO(文章总数)
     * @param []
     * @return java.lang.Integer
     */
    Integer countArticle();

}
