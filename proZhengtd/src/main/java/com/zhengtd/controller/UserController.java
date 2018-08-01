package com.zhengtd.controller;

import com.zhengtd.model.Rcv;
import com.zhengtd.model.Recruit;
import com.zhengtd.model.User;
import com.zhengtd.service.RcvService;
import com.zhengtd.service.RecruitService;
import com.zhengtd.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2018/7/25.
 */
@Controller
public class UserController {//游客
    @Resource
    private UserService userService;
    @Resource
    private RecruitService recruitService;
    @Resource
    private RcvService rcvService;

    @RequestMapping("/login")
    public String login(User user, HttpSession session) throws Exception{
        User users = userService.getByLogin(user);
        List<Recruit> recruitList = recruitService.getAllRec();

        if (null!=users){
            session.setAttribute("recruit",recruitList);
            session.setAttribute("user",users);
            return "UserWindow";
        }
        return "../../index";
    }


    @RequestMapping("/register")
    public String register(User _user) throws Exception{
        boolean flag = userService.addUser(_user);
        if (flag){
            return "../../index";
        }
        return "register";
    }


    @RequestMapping("/addUser")
    public String addUser()throws Exception{
        return "register";
    }

    @RequestMapping("/UserHomePage")
    public String getHomePage()throws Exception{
        return "UserWindow";
    }
}
