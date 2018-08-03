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
public class RcvController {//投递简历
    @Resource
    private RcvService rcvService;
    @Resource
    private VitaeService vitaeService;
    @Resource
    private RecruitService recruitService;



    @RequestMapping("/toudi")
    public String getDeliveryPage(HttpSession session,
                                HttpServletResponse response, HttpServletRequest request)throws Exception{
        int r_id = Integer.parseInt(request.getParameter("r_id"));
        session.setAttribute("r_id",r_id);
        return "DeliveryVC";
    }

    @RequestMapping("/readVCDetail")//简历中心查看已读
    public String goReadVC(int currentPage,
                           HttpServletRequest request)throws Exception{
        Rcv rcv = new Rcv();
        int state = 2;
        rcv.setRv_state(2);
        List<Rcv> rcvs = rcvService.getByState(rcv);
        final int PAGESIZE = 5;
        int totalRows = rcvs.size();
        int totalPages = DoGetPages.getTotalPages(totalRows,PAGESIZE);//总页数
        Map<String,Object> data = new HashMap<>();
        data.put("currentPage",(currentPage-1)*PAGESIZE+1);
        data.put("pageSize",(currentPage)*PAGESIZE);
        data.put("state",state);
        List<Rcv> rcv1 = rcvService.getPage(data);
        if(rcv1.size()!=0){
            request.setAttribute("totalPages",totalPages);
            request.setAttribute("rcv1",rcv1);
            return "readVCDetail";
        } else{
            request.setAttribute("str1","没有已读简历");
            return "DeliveryDetail";
        }
    }

    @RequestMapping("/unreadVCDetail")//简历中心查看未读
    public String goUnreadVC(int currentPage,
                             HttpServletRequest request)throws Exception{
        Rcv rcv = new Rcv();
        rcv.setRv_state(1);
        int state = 1;
        List<Rcv> rcvs = rcvService.getByState(rcv);
        final int PAGESIZE = 5;
        int totalRows = rcvs.size();
        int totalPages = DoGetPages.getTotalPages(totalRows,PAGESIZE);//总页数
        Map<String,Object> data = new HashMap<>();
        data.put("currentPage",(currentPage-1)*PAGESIZE+1);
        data.put("pageSize",(currentPage)*PAGESIZE);
        data.put("state",state);
        List<Rcv> rcv1 = rcvService.getPage(data);
        if(rcv1.size()!=0){
            request.setAttribute("totalPages",totalPages);
            request.setAttribute("rcv1",rcv1);
            return "unreadVCDetail";
        } else{
            request.setAttribute("str1","没有未读简历");
            return "DeliveryDetail";
        }
    }

    @RequestMapping("/readUserVC")//用户查看已读
    public String goUserReadVC(int currentPage,HttpSession session,
                           HttpServletRequest request)throws Exception{
        User user = (User) session.getAttribute("user");
        Rcv rcv = new Rcv();
        int uid = user.getU_id();
        rcv.setRv_uid(uid);
        List<Rcv> rcvs = rcvService.getByUIDAllRcv(rcv);
        final int PAGESIZE = 5;
        int totalRows = rcvs.size();
        int totalPages = DoGetPages.getTotalPages(totalRows,PAGESIZE);//总页数
        Map<String,Object> data = new HashMap<>();
        data.put("currentPage",(currentPage-1)*PAGESIZE+1);
        data.put("pageSize",(currentPage)*PAGESIZE);
        data.put("uid",uid);
        List<Rcv> rcv1 = rcvService.getPageUser(data);
        if(rcv1.size()!=0){
            request.setAttribute("totalPages",totalPages);
            request.setAttribute("rcv1",rcv1);
            return "readUserVC";
        } else{
            request.setAttribute("str1","没有已读简历");
            return "DeliveryDetail";
        }
    }

    @RequestMapping("/DeliveryVC")
    public String DeliveryVC(HttpSession session,HttpServletResponse response,
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

    @RequestMapping("/getDeliveryDetail")
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
            return "UserWindow";
        }
    }

    @RequestMapping("/goDeliveryDetail")
    public String goDeliveryDetail()throws Exception{
        return "DeliveryDetail";
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
}
