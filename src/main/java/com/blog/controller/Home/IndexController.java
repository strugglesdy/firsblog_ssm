package com.blog.controller.Home;

import com.blog.entity.Article;
import com.blog.entity.Category;
import com.blog.service.ArticleService;
import com.blog.service.CategoryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @ClassName: IndexController
 * @Description: TODO(前台首页)
 * @author: Sboy
 * @date: 2017/12/1 19:26
 *
 */
@Controller("IndexController")
@RequestMapping("/home")
public class IndexController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "/index")
    public String indexView(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model) throws Exception {
//        PageHelper.startPage(pn, 4);
        List<Article> articles = articleService.listAll();
//        PageInfo page = new PageInfo(articles);
        model.addAttribute("articles", articles);

        List<Category> categories = categoryService.listAll();
        model.addAttribute("categories", categories);
        return "home/page/index";
    }

    @RequestMapping(value = "/about")
    public String form() throws Exception {
        return "home/page/about";
    }
}
