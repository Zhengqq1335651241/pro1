package com.zhengtd.controller;

import com.zhengtd.model.User;
import com.zhengtd.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/7/25.
 */
@Controller
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("/login")
    public String login(User user, HttpSession session) throws Exception{
        User users = userService.getByLogin(user);
        System.out.println(users);
        if (null!=users){
            session.setAttribute("user",users);
            return "UserWindow";
        }
        return "../../index";
    }
    @RequestMapping("/addUser")
    public void getAddAddress(HttpServletResponse response, HttpServletRequest request)throws Exception{
        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request,response);
    }

    @RequestMapping("/register")
    public String register(User _user) throws Exception{
        boolean flag = userService.addUser(_user);
        if (flag){
            return "../../index";
        }
        return "register";
    }
}
