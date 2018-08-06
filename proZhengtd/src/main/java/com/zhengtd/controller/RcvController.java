package com.zhengtd.controller;

import com.zhengtd.model.Rcv;
import com.zhengtd.model.Recruit;
import com.zhengtd.model.User;
import com.zhengtd.model.Vitae;
import com.zhengtd.service.RcvService;
import com.zhengtd.service.RecruitService;
import com.zhengtd.service.VitaeService;
import com.zhengtd.utils.DoGetPages;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/7/30.
 */
@Controller
public class RcvController {//投递简历详情,招聘信息和简历关联
    @Resource
    private RcvService rcvService;
    @Resource
    private VitaeService vitaeService;
    @Resource
    private RecruitService recruitService;



    @RequestMapping("/TouDi")//投递选择简历
    public String getDeliveryPage(HttpSession session, HttpServletResponse response,
                                  HttpServletRequest request)throws Exception{
        int r_id = Integer.parseInt(request.getParameter("r_id"));
        //先判断是否有简历,有则继续投递,没有则提示添加简历
        User user = (User) session.getAttribute("user");
        Vitae vitae = new Vitae();vitae.setCv_uid(user.getU_id());
        List<Vitae> vitaes = vitaeService.getByUidVitae(vitae);
        if(vitaes.size()==0){
            request.setAttribute("str1","没有简历无法投递");
            return "UserWindow";
        }else{
            session.setAttribute("r_id",r_id);
            session.setAttribute("vitaes",vitaes);
            return "DeliveryVC";
        }
    }

    @RequestMapping("/DeliveryVC")//投递简历并在RCV表里进行添加操作
    public String DeliveryVC(HttpSession session,
                             HttpServletRequest request) throws Exception{
        int cv_id = Integer.parseInt(request.getParameter("cv_id"));
        Vitae vitae = vitaeService.getByIdVC(new Vitae(cv_id));
        int r_id = (int) session.getAttribute("r_id");
        Recruit recruit = recruitService.getRecById(new Recruit(r_id));

        User user = (User) session.getAttribute("user");
        Rcv rcv = new Rcv();rcv.setRv_uname(vitae.getCv_name());
        rcv.setRv_cvId(cv_id);rcv.setRv_rid(r_id);rcv.setRv_uid(user.getU_id());
        rcv.setRv_time(new SimpleDateFormat
                ("yyyy-MM-dd").format
                (new Date()));
        rcv.setRv_state(1);rcv.setRv_job(recruit.getR_job());
        rcv.setRv_invite(1);
        boolean flag = rcvService.addRcv(rcv);
        if (flag){
            return "UserWindow";
        }
        return "DeliveryVC";
    }

    @RequestMapping("/readVCDetail")//管理员查看简历中心
    public String goReadVC(int currentPage,
                           HttpServletRequest request)throws Exception{

        List<Rcv> rcvs = rcvService.getAllRcv();
        final int PAGESIZE = 10;
        int totalRows = rcvs.size();
        int totalPages = DoGetPages.getTotalPages(totalRows,PAGESIZE);//总页数
        Map<String,Object> data = new HashMap<>();
        data.put("currentPage",(currentPage-1)*PAGESIZE+1);
        data.put("pageSize",(currentPage)*PAGESIZE);

        List<Rcv> rcv1 = rcvService.getPage(data);
        if(rcv1.size()!=0){
            request.setAttribute("totalPages",totalPages);
            request.setAttribute("rcv1",rcv1);
            return "readVCDetail";
        } else{
            request.setAttribute("str2","没有简历");
            return "DeliveryCenter";
        }
    }




    @RequestMapping("/getDeliveryDetail")//用户进入投递详情
    public String getRVCDetail(int currentPage, HttpSession session,
                               HttpServletRequest request)throws Exception{
        User user = (User) session.getAttribute("user");
        Rcv rcv = new Rcv();
        rcv.setRv_uid(user.getU_id());
        List<Rcv> rcvs = rcvService.getByUIDAllRcv(rcv);
        final int PAGESIZE = 5;
        int totalRows = rcvs.size();
        int totalPages = DoGetPages.getTotalPages(totalRows,PAGESIZE);//总页数
        Map<String,Object> data = new HashMap<>();
        data.put("currentPage",(currentPage-1)*PAGESIZE+1);
        data.put("pageSize",(currentPage)*PAGESIZE);
        List<Rcv> rcvList = rcvService.getPage(data);
        if(rcvList.size()!=0){
            session.setAttribute("rcvList",rcvList);
            request.setAttribute("totalPages",totalPages);
            return "DeliveryDetail";
        } else{
            request.setAttribute("str4","没有投递记录");
            return "UserWindow";
        }
    }


    @RequestMapping("/acceptInvite")
    public String acceptInvite(HttpSession session,HttpServletResponse response, HttpServletRequest request)throws Exception{
        int rv_id = Integer.parseInt(request.getParameter("rv_id"));
        Rcv rcv = rcvService.getRcvById(new Rcv(rv_id));
        rcv.setRv_invite(3);
        if(rcvService.updateRcv(rcv)){
            int currentPage=1;
            return getRVCDetail(currentPage,session,request);
        }else {
            return "UserWindow";
        }
    }

    @RequestMapping("/refuseIn")
    public String refuseIn(HttpSession session,HttpServletResponse response, HttpServletRequest request)throws Exception{
        int rv_id = Integer.parseInt(request.getParameter("rv_id"));
        Rcv rcv = rcvService.getRcvById(new Rcv(rv_id));
        rcv.setRv_invite(6);
        if(rcvService.updateRcv(rcv)){
            int currentPage=1;
            return getRVCDetail(currentPage,session,request);
        }else {
            return "UserWindow";
        }
    }

    @RequestMapping("/deleteRcv")//管理员删除投递信息
    public String deleteRcv(HttpServletRequest request)throws Exception{
        int rv_id = Integer.parseInt(request.getParameter("rv_id"));
        Rcv rcv = new Rcv();rcv.setRv_id(rv_id);
        boolean flag1 = rcvService.deleteRcv(rcv);
        return "readVCDetail";
    }

    @RequestMapping("deleteRCVTouDi")//用户删除投递信息
    public String deleteRCVTouDi(HttpServletRequest request)throws Exception{
        int rv_id = Integer.parseInt(request.getParameter("rv_id"));
        Rcv rcv = new Rcv();rcv.setRv_id(rv_id);
        boolean flag2 = rcvService.deleteRcv(rcv);
        return "UserWindow";
    }

    @RequestMapping("/deleteAllRCV")//管理员删除所有投递的简历
    public String deleteAllRCV(HttpServletRequest request)throws Exception{
        boolean flag = rcvService.deleteAllRcv();
        if(flag){
            request.setAttribute("str3","删除成功");
            return "DeliveryCenter";
        }else{
            request.setAttribute("str3","删除失败");
            return "DeliveryCenter";
        }
    }

    @RequestMapping("/deleteAllUserRCV")//删除所有投递记录
    public String deleteAllUserRCV(HttpSession session,
                                   HttpServletRequest request)throws Exception{
        User user = (User) session.getAttribute("user");
        Rcv rcv = new Rcv();rcv.setRv_uid(user.getU_id());
        boolean flag = rcvService.deleteUserRcv(rcv);
        if(flag){
            request.setAttribute("str6","已经清空所有的投递记录");
            return "UserWindow";
        }else{
            return "DeliveryDetail";
        }
    }
}
