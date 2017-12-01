package com.blog.controller.Home;

import com.blog.entity.Article;
import com.blog.entity.User;
import com.blog.service.ArticleService;
import com.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName: ArticleController
 * @Description: TODO(前台文章展示)
 * @author: Sboy
 * @date: 2017/12/1 10:46
 *
 */
@Controller("HomeArticleController")
@RequestMapping("/home")
public class ArticleController {

    @Autowired
    private ArticleService articleService;
    @Autowired
    private UserService userService;

    /**
     * @Title: articleDetailView
     * @Description: TODO(前台文章详情展示)
     * @param [model, articleId]
     * @return java.lang.String
     */
    @RequestMapping(value = "/article/{articleId}")
    public String articleDetailView(Model model, @PathVariable("articleId") Integer articleId) throws Exception {
        //文章信息，分类
        Article article = articleService.getArticleDetailById(articleId);
        model.addAttribute("article", article);
        //获得作者信息
        Integer userId = article.getUserId();
        User user = userService.getUserById(userId);
        model.addAttribute("user", user);

        return "home/page/articleDetail";
    }
}
