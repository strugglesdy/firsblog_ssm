package com.blog.controller.Admin;

import com.blog.entity.Article;
import com.blog.entity.Category;
import com.blog.entity.User;
import com.blog.enums.common.IsDeleted;
import com.blog.service.ArticleService;
import com.blog.service.CategoryService;
import com.blog.service.UserService;
import com.blog.util.ReturnUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Create 2017/11/15
 */
@Controller("AdminArticleController")
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;
    @Autowired
    private CategoryService categoryService;

    /**
     * @Title: list
     * @Description: TODO(首页 文章列表)
     * @param [model]
     * @return java.lang.String
     */
    @RequestMapping(value = "/list")
    public String list(Model model) throws Exception {
        List<Article> articles = articleService.listAll();
        model.addAttribute("articles", articles);
        return "article/article";
    }

    /**
     * @Title: delete
     * @Description: TODO(删除文章)
     * @param [articleId]
     * @return org.springframework.ui.ModelMap
     */
    @RequestMapping(value = "/delete/{articleId}", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap delete(@PathVariable("articleId") Integer articleId) throws Exception {
        articleService.modifyIsDeletedById(articleId, IsDeleted.YES.getValue());
        return ReturnUtil.Success("删除成功");
//        return "redirect:/article/list";
    }


    /**
     * @Title: query
     * @Description: TODO(搜索名称获取文章列表)
     * @param [model, title]
     * @return java.lang.String
     */
    @RequestMapping(value = "/query")
    public String query(Model model, @RequestParam("title") String title) throws Exception {
        List<Article> articles = articleService.listAllOf("%" + title + "%");
        model.addAttribute("articles", articles);
        return "article/article";
    }

    //获取添加文章页面
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model) throws Exception {
        //获取分类列表
        List<Category> categories = categoryService.listAll();

        model.addAttribute("categories", categories);

        return "/article/edit";
    }

    /**
     * @Title: editSubmit
     * @Description: TODO(添加||编辑文章提交)
     * @param [article]
     * @return org.springframework.ui.ModelMap
     */
    @RequestMapping(value = "/editSubmit", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap editSubmit(Article article, Integer categoryId, HttpServletRequest request) throws Exception {
        if (article.getArticleId() != null) {
            if (StringUtils.isEmpty(article.getTitle())) {
                return ReturnUtil.Error("请输入标题");
            }
            if (categoryId == null) {
                return ReturnUtil.Error("请选择分类");
            }
            articleService.updateArticle(article);
            return ReturnUtil.Success("修改成功");
        } else {
            if (StringUtils.isEmpty(article.getTitle())) {
                return ReturnUtil.Error("请输入标题");
            }
            if (categoryId == null) {
                return ReturnUtil.Error("请选择分类");
            }
            if (request.getSession().getAttribute("username") == null) {
                return ReturnUtil.Error("无用户信息");
            }
            articleService.addArticle(article);
            return ReturnUtil.Success("添加成功");
        }
//        return "redirect:/article/list";
    }

    /**
     * @Title: edit
     * @Description: TODO(获取编辑页)
     * @param [model, articleId]
     * @return java.lang.String
     */
    @RequestMapping(value = "/edit/{articleId}", method = RequestMethod.GET)
    public String edit(Model model, @PathVariable("articleId") Integer articleId) throws Exception {
        if (articleId == null) {
            return "redirect:/article/list";
        }
        List<Category> categories = categoryService.listAll();
        model.addAttribute("categories", categories);

        Article article = articleService.getByArticleId(articleId);
        if (article == null) {
            return "forward:/article/list";
        }

        model.addAttribute("article", article);

        return "/article/edit";
    }


}
