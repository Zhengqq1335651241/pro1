package com.zhengtd.controller;

import com.zhengtd.model.*;
import com.zhengtd.service.*;
import com.zhengtd.utils.DoGetPages;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/7/28.
 */
@Controller
public class AdminController {//管理员
    @Resource
    private AdminService adminService;
    @Resource
    private RcvService rcvService;
    @Resource
    private VitaeService vitaeService;
    @Resource
    private RecruitService recruitService;
    @Resource
    private PositionService positionService;
    @Resource
    private EmpService empService;

    @RequestMapping("/adminLogin")//管理员登陆
    public String AdminLogin(Admin admin, HttpSession session) throws Exception{
        Admin admin1 = adminService.getByLoginA(admin);

        if (null!=admin1){
            session.setAttribute("admin",admin1);
            return "AdminWindow";
        }
        return "../../index";
    }
    @RequestMapping("/adminPass")
    public String adminPass()throws Exception{
        return "AdminLogin";
    }

    @RequestMapping("/AdminHomePage")
    public String getHomePage()throws Exception{
        return "AdminWindow";
    }

    @RequestMapping("/getDeliveryCenter")//管理员简历中心
    public String getDeliveryCenter()throws Exception{
        return "DeliveryCenter";
    }



    @RequestMapping("/lookVC")
    public String getLookVC(HttpSession session,HttpServletResponse response, HttpServletRequest request)throws Exception{
       int rv_cvId = Integer.parseInt(request.getParameter("rv_cvId"));
       Vitae vitae = vitaeService.getByIdVC(new Vitae(rv_cvId));
       if(vitae!=null){
           session.setAttribute("vitae",vitae);

           return "OneVCDetail";
       }
       return "DeliveryCenter";
    }

    @RequestMapping("/invite")//邀请面试
    public String Invite(HttpSession session,HttpServletResponse response, HttpServletRequest request)throws Exception{
        int rv_id = Integer.parseInt(request.getParameter("rv_id"));
        Rcv rcv = rcvService.getRcvById(new Rcv(rv_id));
        System.out.println(rcv);
        rcv.setRv_state(2);
        rcv.setRv_invite(2);
        if(rcvService.updateRcv(rcv)){
            int currentPage=1;
            return getDeliveryCenter();
        }else {
            return "AdminWindow";
        }
    }

    @RequestMapping("/refuseInvite")//直接拒绝
    public String refuseInvite(HttpSession session,HttpServletResponse response, HttpServletRequest request)throws Exception{
        int rv_id = Integer.parseInt(request.getParameter("rv_id"));
        Rcv rcv = rcvService.getRcvById(new Rcv(rv_id));
        rcv.setRv_invite(5);
        if(rcvService.updateRcv(rcv)){
            int currentPage=1;
            return getDeliveryCenter();
        }else {
            return "AdminWindow";
        }
    }

    @RequestMapping("/hire")//录用
    public String hire(HttpSession session,HttpServletResponse response, HttpServletRequest request)throws Exception{
        int rv_id = Integer.parseInt(request.getParameter("rv_id"));
        Rcv rcv = rcvService.getRcvById(new Rcv(rv_id));
        rcv.setRv_invite(4);
        if(rcvService.updateRcv(rcv)){
            int currentPage=1;
            return getDeliveryCenter();
        }else {
            return "AdminWindow";
        }
    }

    @RequestMapping("/successHire")//查看录用的
    public String successHirePage2(HttpSession session){
        int rv_invite = 4;
        Rcv rcv = new Rcv();rcv.setRv_invite(rv_invite);
        List<Rcv> rcv1 = rcvService.getByInvite(rcv);
        List<Vitae> vitae2 = new ArrayList<>();
        for(int i=0;i<rcv1.size();i++){
            int rv_cvId = rcv1.get(i).getRv_cvId();
            Vitae vitae = new Vitae();
            vitae.setCv_id(rv_cvId);
            Vitae newVitae = vitaeService.getByIdVC(vitae);
            vitae2.add(newVitae);
        }
        session.setAttribute("vitae2",vitae2);
        session.setAttribute("rcv1",rcv1);
        return "successHire";
    }



}
