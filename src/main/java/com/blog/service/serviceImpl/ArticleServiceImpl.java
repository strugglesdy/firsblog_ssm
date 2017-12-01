package com.blog.service.serviceImpl;

import com.blog.dao.ArticleDao;
import com.blog.dao.CategoryDao;
import com.blog.dao.UserDao;
import com.blog.entity.Article;
import com.blog.entity.User;
import com.blog.service.ArticleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Create 2017/11/15
 */
@Service
public class ArticleServiceImpl implements ArticleService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());


    @Autowired
    private ArticleDao articleDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private HttpServletRequest request;


    @Override
    public void addArticle(Article article) throws Exception {
        //获取session中的username
        String username = String.valueOf(request.getSession().getAttribute("username"));
        User user = userDao.selectByUsername(username);
        //将userId传入article
        article.setUserId(user.getUserId());

        articleDao.insert(article);
    }

    @Override
    public Article getByArticleId(Integer articleId) throws Exception {
        Article article = articleDao.selectByArticleId(articleId);

        return article;
    }

    @Override
    public void updateArticle(Article article) throws Exception {
        articleDao.update(article);
    }

    @Override
    public boolean modifyIsDeletedById(Integer articleId, Integer isDeleted) throws Exception {

        return articleDao.deleteByArticleId(articleId);
    }

    @Override
    public List<Article> getByCategoryId(Integer categoryId) throws Exception {
        return null;
    }

    @Override
    public List<Article> listAll() throws Exception {
        List<Article> articles = articleDao.selectAll();
        return articles;
    }

    @Override
    public List<Article> listAllOf(String title) throws Exception {
        List<Article> articles = articleDao.selectAllOf(title);
        return articles;
    }

    @Override
    public Integer countArticleByCategoryId(Integer categoryId) throws Exception {
        return articleDao.countArticleByCategoryId(categoryId);
    }

    @Override
    public Article getArticleDetailById(Integer articleId) throws Exception {
        Article article = articleDao.selectByArticleId(articleId);
        Integer userId = article.getUserId();
        User user = userDao.selectByUserId(userId);
        article.setUser(user);
        return article;
    }
}
