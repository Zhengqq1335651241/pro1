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

    @RequestMapping("/addEmpPage")//进入员工添加页面
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

    @RequestMapping("/empPass")//进入员工登陆页面
    public String empPass()throws Exception{
        return "EmpLogin";
    }


    @RequestMapping("/addEmp")//管理员添加员工
    public String addEmp(HttpServletRequest request,HttpSession session)throws Exception{

        String e_eName = request.getParameter("e_eName");
        String e_ePass = request.getParameter("e_ePass");
        String e_sex = request.getParameter("e_sex");
        String e_address = request.getParameter("e_address");
        String e_eduBackground = request.getParameter("e_eduBackground");
        String e_birthday = request.getParameter("e_birthday");
        String e_hometown = request.getParameter("e_hometown");
        String e_phone = request.getParameter("e_phone");
        String e_email = request.getParameter("e_email");
        String e_major = request.getParameter("e_major");
        String e_graduateSchool = request.getParameter("e_graduateSchool");
        int e_deptId = Integer.parseInt(request.getParameter("d_id"));
        int e_pId = Integer.parseInt(request.getParameter("p_id"));
        int e_state = Integer.parseInt(request.getParameter("e_state"));
        String e_hireDate = request.getParameter("e_hireDate");

        Emp emp = new Emp(e_eName,e_ePass,e_sex,e_address,e_eduBackground,e_birthday,e_hometown,e_phone,e_email,
                e_major,e_graduateSchool,e_deptId,e_pId,e_state,e_hireDate);
        boolean flag = empService.addEmp(emp);
        if(flag){
            return "success";
        }else{
            return "successHire";
        }
    }

    @RequestMapping("/empLogin")//员工登陆
    public String empLogin(HttpSession session,HttpServletRequest request) throws Exception{
        String e_eName = request.getParameter("e_eName");
        String e_ePass = request.getParameter("e_ePass");
        Emp emp = new Emp();emp.setE_eName(e_eName);emp.setE_ePass(e_ePass);

        Emp emp1 = empService.getByLoginEmp(emp);

        if (null!=emp1){
            session.setAttribute("emp",emp1);
            return "EmpWindow";
        }
        return "../../index";
    }
}
