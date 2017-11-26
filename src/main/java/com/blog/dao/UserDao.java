package com.blog.dao;

import com.blog.entity.User;
import com.blog.util.CustomerMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Create 2017/11/13
 */
public interface UserDao {

    /**
     * 新增用户
     * @param user
     */
    int insert(User user);

    /**
     * 更新用户
     * @param user
     */
    void update(User user);

    /**
     * 删除用户
     * @param userId
     */
    boolean deleteByUserId(Integer userId);

    /**
     * 根据ID查找User信息
     * @param userId
     * @return
     */
    User selectByUserId(Integer userId);

    /**
     * 根据用户查找User信息
     * @param username
     * @return
     */
    User selectByUsername(String username);

    /**
     *通过用户名模糊查询
     * @param username
     * @return
     */
    List<User> listUserByUsername(String username);

    /**
     * 用户列表
     * @return
     */
    List<User> listUser();

}
