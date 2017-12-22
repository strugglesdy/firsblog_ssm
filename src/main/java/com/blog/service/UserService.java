package com.blog.service;

import com.blog.entity.User;

import java.util.List;

/**
 * Create 2017/11/13
 */
public interface UserService {
    /**
     * @Title: addUser
     * @Description: TODO(添加用户)
     * @param [user]
     * @return void
     */
    void addUser(User user) throws Exception;

    /**
     * @Title: modifyIsDeletedById
     * @Description: TODO(修改删除状态)
     * @param [userId, isDeleted]
     * @return boolean
     */
    boolean modifyIsDeletedById(Integer userId, Integer isDeleted) throws Exception;

    /**
     * @Title: updateUser
     * @Description: TODO(更新用户)
     * @param [user]
     * @return void
     */
    void updateUser(User user) throws Exception;

    /**
     * @Title: getUserById
     * @Description: TODO(根据用户id查询用户)
     * @param [userId]
     * @return com.blog.entity.User
     */
    User getUserById(Integer userId) throws Exception;

    /**
     * @Title: getUserByname
     * @Description: TODO(根据用户名查询)
     * @param [username]
     * @return com.blog.entity.User
     */
    User getUserByname(String username) throws Exception;

    /**
     * @Title: listUser
     * @Description: TODO(用户列表)
     * @param []
     * @return java.util.List<com.blog.entity.User>
     */
    List<User> listUser() throws Exception;

    /**
     * @Title: listUserByname
     * @Description: TODO(查询获取列表)
     * @param [username]
     * @return java.util.List<com.blog.entity.User>
     */
    List<User> listUserByname(String username) throws Exception;

    /**
     * @Title: countUser
     * @Description: TODO(用户总数)
     * @param []
     * @return java.lang.Integer
     */
    Integer countUser() throws Exception;
}
