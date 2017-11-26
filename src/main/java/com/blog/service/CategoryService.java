package com.blog.service;

import com.blog.entity.Category;

import java.util.List;
import java.util.Optional;

/**
 * Create 2017/11/14
 */
public interface CategoryService {
    boolean addCategory(Category category) throws Exception;

    Optional<Category> getCategoryById(Integer categoryId) throws Exception;

    Optional<Category> getCategoryByname(String type) throws Exception;

    boolean modifyIsDeletedById(Integer categoryId,Integer isDeleted) throws Exception;

    List<Category> listAllOf(String type) throws Exception;

    List<Category> listAll() throws Exception;


}
