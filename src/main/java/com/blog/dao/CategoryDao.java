package com.blog.dao;

import com.blog.entity.Category;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Optional;

/**
 * Create 2017/11/14
 */
public interface CategoryDao {
    /**
     * 添加类别
     * @param category
     */
    boolean insert(Category category);

    /**
     * 根据ID查找类别
     * @param categoryId
     * @return
     */
    Optional<Category> selectByCategoryId(Integer categoryId);
    /**
     * @Title: selectByType
     * @Description: TODO(根据名字查找类别)
     * @param [type]
     * @return java.util.Optional<com.blog.entity.Category>
     */
    Optional<Category> selectByType(String type);

    /**
     * 根据ID删除
     * @param categoryId
     */
    boolean deleteByCategoryId(Integer categoryId);

    /**
     * 根据类别名称获得列表
     * @param type
     * @return
     */
    List<Category> selectAllOf(@Param("type") String type);

    /**
     * 获得类别列表
     * @return
     */
    List<Category> selectAll();

}
