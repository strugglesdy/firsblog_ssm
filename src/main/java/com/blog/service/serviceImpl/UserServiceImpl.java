package com.blog.service.serviceImpl;

import com.blog.dao.UserDao;
import com.blog.entity.User;
import com.blog.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserDao userDao;


    @Override
    public void addUser(User user) throws Exception {
        logger.info(user.toString());
        userDao.insert(user);
    }

    @Override
    public boolean modifyIsDeletedById(Integer userId, Integer isDeleted) throws Exception {
//        User user = new User();
//        user.setUserId(userId);
//        user.setIsEnabled(isDeleted);
//        userDao.deleteByUserId(userId);
        return userDao.deleteByUserId(userId);
    }


    @Override
    public void updateUser(User user) throws Exception {
        userDao.update(user);
    }

    @Override
    public User getUserById(Integer userId) throws Exception {
        User user = userDao.selectByUserId(userId);
        logger.info(user.toString());
        return user;
    }

    @Override
    public User getUserByname(String username) throws Exception {
        User user = userDao.selectByUsername(username);

        return user;
    }

    @Override
    public List<User> listUser() throws Exception {
        List<User> userList = userDao.listUser();
        logger.info(userList.toString());
        return userList;
    }

    @Override
    public List<User> listUserByname(String username) throws Exception {
        List<User> userList = userDao.listUserByUsername(username);
        return userList;
    }

    @Override
    public Integer countUser() throws Exception {
        Integer userCounts = userDao.countUser();
        return userCounts;
    }
}
