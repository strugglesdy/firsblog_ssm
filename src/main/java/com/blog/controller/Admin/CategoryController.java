package com.blog.controller.Admin;

import com.blog.entity.Category;
import com.blog.enums.common.IsDeleted;
import com.blog.service.ArticleService;
import com.blog.service.CategoryService;
import com.blog.util.ReturnUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Create 2017/11/14
 */
@Controller
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private CategoryService categoryService;

    /**
     * @Title: list
     * @Description: TODO(首页 分类列表)
     * @param [model]
     * @return java.lang.String
     */
    @RequestMapping("/list")
    public String list(Model model) throws Exception {
        List<Category> categoryList = categoryService.listAll();
        model.addAttribute("categories", categoryList);
        return "category/category";
    }

    /**
     * @Title: deleteCategory
     * @Description: TODO(删除分类)
     * @param [categoryId]
     * @return org.springframework.ui.ModelMap
     */
    @RequestMapping(value = "/delete/{categoryId}", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap deleteCategory(@PathVariable("categoryId") Integer categoryId) throws Exception {
        //禁止删除有文章的分类
        int count = articleService.countArticleByCategoryId(categoryId);
        if (count == 0) {
            categoryService.modifyIsDeletedById(categoryId, IsDeleted.YES.getValue());
            return ReturnUtil.Success("删除成功");
        } else {
            return ReturnUtil.Error("此分类中存在文章，无法删除");
        }
//        return "redirect:/category/list";
    }

    /**
     * @Title: addCategory
     * @Description: TODO(添加分类)
     * @param [category]
     * @return org.springframework.ui.ModelMap
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap addCategory(Category category) throws Exception {
        if (categoryService.getCategoryByname(category.getType()) != null) {
            return ReturnUtil.Error("分类已存在");
        }

        categoryService.addCategory(category);
        return ReturnUtil.Success("添加成功");
    }

    /**
     * @Title: query
     * @Description: TODO(查询)
     * @param [model, type]
     * @return java.lang.String
     */
    @RequestMapping(value = "/query", method = RequestMethod.GET)
    public String query(Model model, @RequestParam("type") String type) throws Exception {

        List<Category> categoryList = categoryService.listAllOf("%" + type + "%");
        model.addAttribute("categories", categoryList);
        return "/category/category";

    }


}
