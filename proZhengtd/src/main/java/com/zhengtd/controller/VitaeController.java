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

    @RequestMapping("/getVitaeDetail")//用户获取简历信息
    public String getVCDetail(int currentPage,
                              HttpSession session,HttpServletRequest request)throws Exception{

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
            request.setAttribute("str5","没有简历,快去添加一份吧");
            return "UserWindow";
        }
    }

    @RequestMapping("/addVC")//用户添加简历
    public String addCVDetail(Vitae vitae, HttpSession session, HttpServletRequest
            request, HttpServletResponse response)throws Exception{
        User user = (User) session.getAttribute("user");
        vitae.setCv_uid(user.getU_id());
        vitae.setCv_state(1);
        boolean flag = vitaeService.addVitae(vitae);

        if(flag){
            session.setAttribute("vitae",vitae);
            request.setAttribute("str2","添加简历成功");
            return "UserWindow";
        }else{
            request.setAttribute("str2","添加简历失败");
            return "UserWindow";
        }
    }

    @RequestMapping("/deleteCV")//用户删除简历
    public String deleteCVDetail(HttpSession session,HttpServletRequest request,HttpServletResponse response)throws Exception{
        int cv_id = Integer.parseInt(request.getParameter("cv_id"));
        boolean flag = vitaeService.deleteVitae(new Vitae(cv_id));
        int currentPage=1;
        request.setAttribute("str3","简历删除成功");
        return getVCDetail(currentPage, session,request);
    }

    @RequestMapping("/updateCV")//用户修改简历页面
    public String getCVDetailPage(HttpServletResponse response,
                                  HttpServletRequest request,HttpSession session)throws Exception{
        int cv_id = Integer.parseInt(request.getParameter("cv_id"));
        Vitae vitae = vitaeService.getByIdVC(new Vitae(cv_id));
        if(vitae.getCv_name()!=null){
            request.getSession().setAttribute("vi",vitae);
            return "alterCVDetail";
        }else{
            return "alterCVDetail";
        }
    }

    @RequestMapping("/alterCVDetail")//用户修改简历
    public String alterCVDetail(Vitae vitae,HttpSession session,HttpServletRequest request,
                                HttpServletResponse response)throws Exception{
        boolean flag = vitaeService.updateVitae(vitae);
        if(flag){
            int currentPage=1;
            request.setAttribute("str4","简历修改成功");
            return getVCDetail(currentPage, session,request);
        }else{
            request.setAttribute("str4","简历修改失败");
            return "alterCVDetail";
        }
    }
}
