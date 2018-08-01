package com.zhengtd.controller;

import com.zhengtd.model.Dept;
import com.zhengtd.model.Emp;
import com.zhengtd.model.Position;
import com.zhengtd.model.Vitae;
import com.zhengtd.service.DeptService;
import com.zhengtd.service.EmpService;
import com.zhengtd.service.PositionService;
import com.zhengtd.service.VitaeService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Administrator on 2018/7/30.
 */
@Controller
public class EmpController {
    @Resource
    private EmpService empService;
    @Resource
    private VitaeService vitaeService;
    @Resource
    private DeptService deptService;
    @Resource
    private PositionService positionService;

    @RequestMapping("/addEmpPage")
    public void addEmpPage(HttpServletResponse response,
                           HttpServletRequest request,HttpSession session)throws Exception{
        response.setContentType("text/json; charset=UTF-8");
        int cv_id = Integer.parseInt(request.getParameter("cv_id"));
        Vitae vitae3 = vitaeService.getByIdVC(new Vitae(cv_id));
        List<Dept> depts = deptService.findAllDept();
        session.setAttribute("depts",depts);
        session.setAttribute("vitae3",vitae3);
        request.getRequestDispatcher("WEB-INF/pages/addEmp.jsp").forward(request,response);
    }

    @RequestMapping("/addEmp")
    public String addEmp(Emp emp, HttpServletRequest request,HttpSession session)throws Exception{

                System.out.println(emp);
        boolean flag = empService.addEmp(emp);
        System.out.println(flag);
        if(flag){
            return "success";
        }else{
            return "successHire";
        }
    }
}
