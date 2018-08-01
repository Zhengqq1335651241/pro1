package com.zhengtd.controller;

import com.zhengtd.dao.VitaeMapper;
import com.zhengtd.model.User;
import com.zhengtd.model.Vitae;
import com.zhengtd.service.VitaeService;
import com.zhengtd.utils.DoGetPages;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/7/25.
 */
@Controller
public class VitaeController {//简历
    @Resource
    private VitaeService vitaeService;

    @RequestMapping("/getVitaeDetail")
    public String getVCDetail(int currentPage, HttpSession session)throws Exception{

        int state = 1;
        User user = (User) session.getAttribute("user");
        Vitae vitae = new Vitae();
        vitae.setCv_state(1);
        vitae.setCv_uid(user.getU_id());

        List<Vitae> vitaes = vitaeService.getByUidVitae(vitae);

        final int PAGESIZE = 1;
        int totalRows = vitaes.size();
        int totalPages = DoGetPages.getTotalPages(totalRows,PAGESIZE);//总页数

        Map<String,Object> data = new HashMap<>();
        data.put("currentPage",(currentPage-1)*PAGESIZE+1);
        data.put("pageSize",(currentPage)*PAGESIZE);
        data.put("state",state);

        List<Vitae> vitaeList = vitaeService.getPage(data);

        if(vitaeList.size()!=0){
            session.setAttribute("vitaeList",vitaeList);
            session.setAttribute("totalPages",totalPages);
            session.setAttribute("vitaes",vitaes);
            return "VCDetails";
        } else{
            return "UserWindow";
        }
    }

    @RequestMapping("/addVC")
    public String addCVDetail(Vitae vitae, HttpSession session, HttpServletRequest
            request, HttpServletResponse response)throws Exception{
        User user = (User) session.getAttribute("user");
        vitae.setCv_uid(user.getU_id());
        vitae.setCv_state(1);
        boolean flag = vitaeService.addVitae(vitae);

        if(flag){
            session.setAttribute("vitae",vitae);
            int currentPage=1;
            return getVCDetail(currentPage, session);
        }else{
            return "UserWindow";
        }
    }

    @RequestMapping("/deleteCV")
    public String deleteCVDetail(HttpSession session,HttpServletRequest request,HttpServletResponse response)throws Exception{
        int cv_id = Integer.parseInt(request.getParameter("cv_id"));
        boolean flag = vitaeService.deleteVitae(new Vitae(cv_id));

        int currentPage=1;
        return getVCDetail(currentPage, session);
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
    public String alterCVDetail(Vitae vitae,HttpSession session,HttpServletResponse response)throws Exception{
        boolean flag = vitaeService.updateVitae(vitae);
        if(flag){
            int currentPage=1;
            return getVCDetail(currentPage, session);
        }else{
            return "alterCVDetail";
        }
    }
}
