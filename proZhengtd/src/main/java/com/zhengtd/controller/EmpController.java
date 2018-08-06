package com.zhengtd.controller;

import com.zhengtd.model.*;
import com.zhengtd.service.*;
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
    @Resource
    private RcvService rcvService;

    @RequestMapping("/addEmpPage")//进入员工添加页面
    public String addEmpPage(HttpServletResponse response,
                             HttpServletRequest request,HttpSession session)throws Exception{
        response.setContentType("text/json; charset=UTF-8");
        int cv_id = Integer.parseInt(request.getParameter("cv_id"));
        Vitae vitae3 = vitaeService.getByIdVC(new Vitae(cv_id));
        List<Dept> depts = deptService.findAllDept();
        session.setAttribute("depts",depts);
        session.setAttribute("vitae3",vitae3);
        return "addEmp";
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

        Emp emp = new Emp(e_eName,e_ePass,e_sex,e_address,e_eduBackground,
                e_birthday,e_hometown,e_phone,e_email,
                e_major,e_graduateSchool,e_deptId,e_pId,e_state,e_hireDate);
        boolean flag = empService.addEmp(emp);

        Vitae vitae = (Vitae) session.getAttribute("vitae3");
        Rcv rcv = new Rcv();
        rcv.setRv_cvId(vitae.getCv_id());
        boolean flag1 = rcvService.deleteRcv(rcv);
        if(flag1&&flag){
            return "successHire";
        }else{
            return "successHire";
        }
    }

    @RequestMapping("/empLogin")//员工登陆
    public String empLogin(HttpSession session,HttpServletRequest request) throws Exception{
        String e_eName = request.getParameter("e_eName");
        String e_ePass = request.getParameter("e_ePass");
        Emp emp1 = new Emp();emp1.setE_eName(e_eName);emp1.setE_ePass(e_ePass);

        Emp emp = empService.getByLoginEmp(emp1);
        System.out.println(emp);
        if (null!=emp){
            session.setAttribute("emp",emp);
            return "EmpWindow";
        }
        return "../../index";
    }

    @RequestMapping("EmpHomePage")
    public String EmpHomePage()throws Exception{
        return "EmpWindow";
    }

    @RequestMapping("/EmpDetail")//员工个人信息页面
    public String EmpDetail(HttpSession session,HttpServletRequest request)throws Exception{
        Emp emp = (Emp) session.getAttribute("emp");
        Dept dept1 = new Dept();dept1.setD_id(emp.getE_deptId());
        Dept dept = deptService.getDeptByID(dept1);
        Position position1 = new Position();position1.setP_id(emp.getE_pId());
        Position position = positionService.getByID(position1);
        request.setAttribute("dept",dept);
        request.setAttribute("position",position);
        return "EmpDetail";
    }

    @RequestMapping("/updateEmpDetail")
    public String updateEmpDetail(HttpServletRequest request,HttpSession session)throws Exception{
        String e_eName = request.getParameter("e_eName");
        String e_ePass = request.getParameter("e_ePass");
        String e_phone = request.getParameter("e_phone");
        String e_email = request.getParameter("e_email");
        Emp emp = (Emp) session.getAttribute("emp");
        emp.setE_eName(e_eName);
        emp.setE_ePass(e_ePass);
        emp.setE_phone(e_phone);
        emp.setE_email(e_email);
        boolean flag = empService.updateEmp(emp);
        if(flag){
            request.setAttribute("str1","修改成功");
            return EmpDetail(session,request);
        }else{
            request.setAttribute("str1","修改失败");
            return EmpDetail(session,request);
        }
    }


}
