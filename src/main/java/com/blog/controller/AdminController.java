package com.blog.controller;

import com.blog.entity.User;
import com.blog.service.UserService;
import com.blog.util.MessageType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

import static com.blog.util.IpUtil.getIpAddr;


/**
 * Create 2017/11/13
 */
@Controller
public class AdminController {

    @Autowired
    private UserService userService;

    /**
     * @Title: loginForm
     * @Description: TODO(去登录页面)
     * @param []
     * @return java.lang.String
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginForm() {
        return "login";
    }

    /**
     * @Title: login
     * @Description: TODO(登录验证)
     * @param [session, request, response]
     * @return java.lang.String
     */
    @RequestMapping(value = "/loginVerify", method = RequestMethod.POST)
    public String login(HttpSession session, HttpServletRequest request) throws Exception {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userService.getUserByname(username);

        if (user != null && user.getPassword().equals(password)) {

            //验证通过，在session中保存用户是否信息
            session.setAttribute("username", username);
            user.setIsEnabled(1);
            //获取ip且更新用户信息
            user.setIp(getIpAddr(request));
            userService.updateUser(user);

            return "redirect:/index";
        } else {
            //登录失败
            request.setAttribute("msgType", MessageType.ERROR);
            request.setAttribute("msg", "用户名或密码不正确");
            return "login";
        }
    }

    /**
     * @Title: index
     * @Description: TODO(后台首页)
     * @param []
     * @return java.lang.String
     */
    @RequestMapping("/index")
    public String index() throws Exception {
        return "index";
    }

    /**
     * @Title: logout
     * @Description: TODO(退出登录)
     * @param [session]
     * @return java.lang.String
     */
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) throws Exception {
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/login";
    }

}
