package com.zhengtd.controller;

import com.zhengtd.dao.VitaeMapper;
import com.zhengtd.model.User;
import com.zhengtd.model.Vitae;
import com.zhengtd.service.VitaeService;
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
public class VitaeController {
    @Resource
    private VitaeService vitaeService;

    @RequestMapping("/getVitaeDetail")
    public String getVCDetail(HttpSession session)throws Exception{
        User user = (User) session.getAttribute("user");
        Vitae vitae = new Vitae();vitae.setCv_uid(user.getU_id());

        List<Vitae> vitaeList = vitaeService.getByUidVitae(vitae);
        System.out.println(vitaeList.size());
        if(vitaeList.size()!=0){
            session.setAttribute("vitaeList",vitaeList);
            return "VCDetails";
        } else{
            return "UserWindow";
        }
    }

    @RequestMapping("/addVC")
    public void addCVDetail(Vitae vitae, HttpSession session, HttpServletRequest
            request, HttpServletResponse response)throws Exception{
        User user = (User) session.getAttribute("user");
        vitae.setCv_uid(user.getU_id());
        boolean flag = vitaeService.addVitae(vitae);

        if(flag){
            session.setAttribute("vitae",vitae);
            request.getRequestDispatcher("getVitaeDetail").forward(request,response);
        }else{
            response.sendRedirect("UserWindow");
        }
    }

    @RequestMapping("/deleteCV")
    public void deleteCVDetail(HttpServletRequest request,HttpServletResponse response)throws Exception{
        int cv_id = Integer.parseInt(request.getParameter("cv_id"));
        boolean flag = vitaeService.deleteVitae(new Vitae(cv_id));
        if(flag){
            request.getRequestDispatcher("getDetail").forward(request,response);
        }
        request.getRequestDispatcher("WEB-INF/pages/defeat.jsp").forward(request,response);
    }

    @RequestMapping("/updateCV")
    public void getCVDetailPage(HttpServletResponse response,HttpServletRequest request)throws Exception{
        int cv_id = Integer.parseInt(request.getParameter("cv_id"));
        Vitae vitae = vitaeService.getByIdVC(new Vitae(cv_id));
        if(vitae.getCv_name()!=null){
            request.getSession().setAttribute("vi",vitae);
            request.getRequestDispatcher("WEB-INF/pages/alterCVDetail.jsp").forward(request,response);
        }
    }

    @RequestMapping("/alterCVDetail")
    public void alterCVDetail(Vitae vitae,HttpServletRequest request,HttpServletResponse response)throws Exception{
        boolean flag = vitaeService.updateVitae(vitae);
        if(flag){
            response.sendRedirect("getVitaeDetail");
        }else{
            response.sendRedirect("alterCVDetail");
        }
    }
}
