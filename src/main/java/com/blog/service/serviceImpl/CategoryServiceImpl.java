package com.blog.service.serviceImpl;

import com.blog.dao.ArticleDao;
import com.blog.dao.CategoryDao;
import com.blog.entity.Category;
import com.blog.service.CategoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * Create 2017/11/14
 */
@Service
public class CategoryServiceImpl implements CategoryService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ArticleDao articleDao;

    @Autowired
    private CategoryDao categoryDao;

    @Override
    public boolean addCategory(Category category) throws Exception {
        return categoryDao.insert(category);
    }

    @Override
    public Optional<Category> getCategoryById(Integer categoryId) throws Exception {
        return categoryDao.selectByCategoryId(categoryId);
    }

    @Override
    public Optional<Category> getCategoryByname(String type) throws Exception {
        return categoryDao.selectByType(type);
    }

    @Override
    public boolean modifyIsDeletedById(Integer categoryId,Integer isDeleted) throws Exception {
        return categoryDao.deleteByCategoryId(categoryId);
    }

    @Override
    public List<Category> listAllOf(String type) throws Exception {
        List<Category> categoryList = categoryDao.selectAllOf(type);
        logger.info(categoryList.toString());
        return categoryList;
    }

    //获得分类列表
    @Override
    public List<Category> listAll() throws Exception {
        List<Category> categoryList = categoryDao.selectAll();
        //获得相应分类的文章数
        for (int i = 0; i < categoryList.size(); i++) {
            Integer categoryId = categoryList.get(i).getCategoryId();
            Integer count = articleDao.countArticleByCategoryId(categoryId);
            categoryList.get(i).setArticleCount(count);
        }
        return categoryList;
    }
}
