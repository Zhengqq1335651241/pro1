package com.zhengtd.controller;

import com.sun.org.apache.regexp.internal.RE;
import com.zhengtd.model.Recruit;
import com.zhengtd.model.Vitae;
import com.zhengtd.service.RecruitService;
import com.zhengtd.utils.DoGetPages;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
public class RecruitController {//招聘信息
    @Resource
    private RecruitService recruitService;

    @RequestMapping("/getRecruitDetail")
    public String getRecruitDetail(int currentPage,
                                   HttpServletRequest request)throws Exception{

        List<Recruit> recruits = recruitService.getAllRec();
        final int PAGESIZE = 5;
        int totalRows = recruits.size();
        int totalPages = DoGetPages.getTotalPages(totalRows,PAGESIZE);//总页数
        Map<String,Object> data = new HashMap<>();
        data.put("currentPage",(currentPage-1)*PAGESIZE+1);
        data.put("pageSize",(currentPage)*PAGESIZE);
        List<Recruit> recruitList = recruitService.getPageRec(data);

        if(recruitList.size()!=0){
            request.setAttribute("recruitList",recruitList);
            request.setAttribute("totalPages",totalPages);
            return "getRecruitDetail";
        } else{
            return "AdminWindow";
        }
    }

    @RequestMapping("/addRec")
    public String addRecruit(Recruit recruit, HttpServletRequest request)throws Exception{

        recruit.setR_state(1);
        boolean flag = recruitService.addRec(recruit);

        if(flag){
            int currentPage=1;
            return getRecruitDetail(currentPage,request);
        }else{
            return "AdminWindow";
        }
    }

    @RequestMapping("/deleteRecruit")
    public String deleteRecruit(HttpSession session,HttpServletRequest request,HttpServletResponse response)throws Exception{
        int r_id = Integer.parseInt(request.getParameter("r_id"));
        boolean flag = recruitService.deleteRec(new Recruit(r_id));

        int currentPage=1;
        return getRecruitDetail(currentPage, request);
    }

    @RequestMapping("/updateRecruit")
    public String getAlterRecruitPage(HttpServletResponse response,HttpServletRequest request)throws Exception{
        int r_id = Integer.parseInt(request.getParameter("r_id"));
        Recruit recruit = recruitService.getRecById(new Recruit(r_id));
        if(recruit.getR_job()!=null){
            request.getSession().setAttribute("re",recruit);
            return "AlterRecruit";
        }
        return "getRecruitDetail";
    }

    @RequestMapping("/alterRec")
    public String alterCVDetail(HttpServletRequest request,Recruit recruit,HttpSession session,HttpServletResponse response)throws Exception{
        System.out.println(recruit);
        boolean flag = recruitService.updateRec(recruit);
        if(flag){
            int currentPage=1;
            request.setAttribute("str1","修改成功");
            return getRecruitDetail(currentPage,request);
        }else{
            request.setAttribute("str1","修改失败");
            return "AlterRecruit";
        }
    }

    @RequestMapping("/addRecruitPage")
    public String getAddAddress(HttpServletResponse response,HttpServletRequest request)throws Exception{
        request.getRequestDispatcher("WEB-INF/pages/addRecruit.jsp").forward(request,response);
        return "addRecruit";
    }
}
