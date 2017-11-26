package com.blog.controller;

import com.blog.entity.User;
import com.blog.enums.common.IsDeleted;
import com.blog.service.UserService;
import com.blog.util.ReturnUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Create 2017/11/13
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * @Title: list
     * @Description: TODO(首页 用户列表)
     * @param [model]
     * @return java.lang.String
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) throws Exception {
        List<User> userList = userService.listUser();
        model.addAttribute("users", userList);
        return "user/user";
    }

    /**
     * @Title: deleteUser
     * @Description: TODO(删除用户)
     * @param [userId]
     * @return org.springframework.ui.ModelMap
     */
    @RequestMapping(value = "/delete/{userId}", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap deleteUser(@PathVariable("userId") Integer userId) throws Exception {
        if (!userService.modifyIsDeletedById(userId, IsDeleted.YES.getValue())) {
            return ReturnUtil.Error("删除失败");
        }
        return ReturnUtil.Success("删除成功");
//        return "redirect:/user/list";
    }

    //后台添加用户页面显示
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add() throws Exception {
        return "user/edit";
    }

    /**
     * @Title: edit
     * @Description: TODO(获取编辑页)
     * @param [model, userId]
     * @return java.lang.String
     */
    @RequestMapping(value = "/edit/{userId}", method = RequestMethod.GET)
    public String edit(Model model, @PathVariable("userId") Integer userId) throws Exception {
        User user = userService.getUserById(userId);
        model.addAttribute("user", user);
        return "user/edit";
    }

    /**
     * @Title: editUserSubmit
     * @Description: TODO(添加||编辑用户提交)
     * @param [user]
     * @return org.springframework.ui.ModelMap
     */
    @RequestMapping(value = "/editSubmit", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap editUserSubmit(User user) throws Exception {
        //修改
        if (user.getUserId() != null) {
            if (StringUtils.isEmpty(user.getNickname())) {
                return ReturnUtil.Error("请填写用户昵称");
            }
            userService.updateUser(user);
            return ReturnUtil.Success("修改成功");
        } else {
            //添加
            if (userService.getUserByname(user.getUsername()) != null) {
                return ReturnUtil.Error("用户已存在");
            }
            if (StringUtils.isEmpty(user.getNickname())) {
                return ReturnUtil.Error("请填写用户昵称");
            }
            if (user.getIsEnabled() == null) {
                return ReturnUtil.Error("请选择状态");
            }
            userService.addUser(user);
            return ReturnUtil.Success("添加成功", null, "/user/list");
        }
//        return "redirect:/user/list";
    }

    /**
     * @Title: query
     * @Description: TODO(查询)
     * @param [model, username]
     * @return java.lang.String
     */
    @RequestMapping(value = "/query", method = RequestMethod.GET)
    public String query(Model model, @RequestParam("username") String username) throws Exception {
        List<User> userList = userService.listUserByname("%" + username + "%");
        model.addAttribute("users", userList);
        return "user/user";
    }

    /**
     * @Title: userProfileView
     * @Description: TODO(用户基本信息)
     * @param [model, request]
     * @return java.lang.String
     */
    @RequestMapping(value = "/profile")
    public String userProfileView(Model model, HttpServletRequest request) throws Exception {
        //获取session信息
        User user = userService.getUserByname((String) request.getSession().getAttribute("username"));
        model.addAttribute("user", user);

        return "/user/profile";
    }
}
