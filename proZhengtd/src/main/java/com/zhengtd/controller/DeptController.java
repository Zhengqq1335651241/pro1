package com.zhengtd.controller;

import com.zhengtd.model.Dept;
import com.zhengtd.model.Emp;
import com.zhengtd.model.Position;
import com.zhengtd.service.DeptService;
import com.zhengtd.service.EmpService;
import com.zhengtd.service.PositionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/7/31.
 */
@Controller
public class DeptController {
    @Resource
    private DeptService deptService;
    @Resource
    private PositionService positionService;
    @Resource
    private EmpService empService;

    @RequestMapping("/goDeptPostPage")//进入部门职位页面
    public String goDeptPostPage()throws Exception{
        return "DeptPost";
    }

    @RequestMapping("/lookDeptPost")//进入查看部门职位页面
    public String lookDeptPost(HttpServletRequest request)throws Exception{
        List<Position> positions1 = positionService.findAllPosition();
        List<Dept> depts1 = deptService.findAllDept();
        request.setAttribute("positions1",positions1);
        request.setAttribute("depts1",depts1);
        return "lookDeptPost";
    }

    @RequestMapping("/getPosition")//获取部门对应的职位
    @ResponseBody
    public Object getPosition(int d_id){
        Position position = new Position();
        position.setP_deptId(d_id);
        List<Position> t_positions = positionService.getByPDeptId(position);
        return t_positions;
    }

    @RequestMapping("/addDept")//添加部门
    public String addDept(HttpServletRequest request)throws Exception{
        String d_name = request.getParameter("d_name");
        String d_loc = request.getParameter("d_loc");
        String d_addTime = new SimpleDateFormat
                ("yyyy-MM-dd").format
                (new Date());
        Dept dept = new Dept();dept.setD_addTime(d_addTime);
        dept.setD_name(d_name);dept.setD_loc(d_loc);
        Dept dept1 = deptService.getDeptByDName(dept);
        if(dept1!=null){
            request.setAttribute("addDept2","有重复,部门添加失败");
            return "DeptPost";
        }else{
            boolean flag = deptService.addDept(dept);
            if(flag){
                request.setAttribute("addDept1","部门添加成功");
                return "DeptPost";
            }else{
                request.setAttribute("addDept2","部门添加失败");
                return "DeptPost";
            }
        }
    }

    @RequestMapping("/addPosition")//添加职位
    public String addPosition(HttpServletRequest request)throws Exception{
        String p_name = request.getParameter("p_name");
        String p_deptName = request.getParameter("p_deptName");
        String p_addTime = new SimpleDateFormat
                ("yyyy-MM-dd").format
                (new Date());
        Dept dept = new Dept();dept.setD_name(p_deptName);
        Dept dept1 = deptService.getDeptByDName(dept);
        Position position = new Position();
        position.setP_addTime(p_addTime);
        position.setP_name(p_name);position.setP_deptId(dept1.getD_id());
        List<Position> positions = positionService.getByPName(position);
        if(positions!=null){
            request.setAttribute("addPosition2","有重复,职位添加失败");
            return "DeptPost";
        }else{
            boolean flag = positionService.addPosition(position);
            if(flag){
                request.setAttribute("addPosition1","职位添加成功");
                return "DeptPost";
            }else{
                request.setAttribute("addPosition2","职位添加失败");
                return "DeptPost";
            }
        }
    }



    @RequestMapping("/deleteDept")//删除部门
    public String deleteDept(HttpServletRequest request)throws Exception{
        int d_id = Integer.parseInt(request.getParameter("d_id"));
        Position position1 = new Position();position1.setP_deptId(d_id);
        Emp emp = new Emp();emp.setE_deptId(d_id);
        List<Emp> empList = empService.getEmpByDept(emp);
        //若该部门下存在在职员工，不能进行删除；如果是一个空的部门，则连同职位一起删除；
        int count1 = empList.size();
        System.out.println();
        if(empList.size()==0){
            request.setAttribute("deleteDept1","部门删除成功");
            deptService.deleteDept(new Dept(d_id));
            positionService.deletePosition(position1);
            return lookDeptPost(request);
        }else{
            request.setAttribute("deleteDept2","部门删除失败");
            request.setAttribute("count1",count1);
            return lookDeptPost(request);
        }
    }



    @RequestMapping("/deletePosition")//删除职位
    public String deletePosition(HttpServletRequest request)throws Exception{
        int p_id = Integer.parseInt(request.getParameter("p_id"));
        System.out.println(p_id);
        Emp emp = new Emp();emp.setE_deptId(p_id);
        List<Emp> empList = empService.getEmpByDept(emp);

        if(empList.size()==0){
            request.setAttribute("deletePosition1","职位删除成功");
            positionService.deletePosition(new Position(p_id));
            return lookDeptPost(request);
        }else{
            request.setAttribute("deletePosition2","职位删除失败");
            return lookDeptPost(request);
        }
    }

    @RequestMapping("/adminLookPosition")//管理员查看职位
    public String adminLookPosition(HttpServletRequest request)throws Exception{
        int d_id = Integer.parseInt(request.getParameter("d_id"));
        Position position = new Position();position.setP_deptId(d_id);
        List<Position> positions2 = positionService.getByPDeptId(position);
        System.out.println(positions2);
        if(positions2.size()!=0){
            request.setAttribute("positions2",positions2);
            return "adminLookPositionPage";
        }else{
            request.setAttribute("str1","此部门没有职位");
            return lookDeptPost(request);
        }
    }

    @RequestMapping("/adminLookEmp")//管理员查看部门员工
    public String adminLookEmp(HttpServletRequest request)throws Exception{
        int d_id = Integer.parseInt(request.getParameter("d_id"));
        Emp emp = new Emp();emp.setE_deptId(d_id);
        List<Emp> emp1 = empService.getEmpByDept(emp);
        if(emp1.size()!=0){
            request.setAttribute("emp1",emp1);
            return "adminLookEmpPage";
        }else{
            request.setAttribute("str1","此部门没有员工");
            return lookDeptPost(request);
        }
    }

    @RequestMapping("/updateDeptPage")//进入修改页面
    public String updateDeptPage(HttpServletRequest request)throws Exception{
        int d_id = Integer.parseInt(request.getParameter("d_id"));
        Dept dept2 = deptService.getDeptByID(new Dept(d_id));
        Position position = new Position();
        position.setP_deptId(d_id);
        List<Position> positions2 = positionService.getByPDeptId(position);
        System.out.println(dept2);
        System.out.println(positions2);
        request.setAttribute("dept2",dept2);
        request.setAttribute("positions2",positions2);
        return "updateDeptPage";
    }

    @RequestMapping("/updateDept")//修改部门
    public String updateDept(HttpServletRequest request)throws Exception{
        int d_id = Integer.parseInt(request.getParameter("d_id"));
        String d_name = request.getParameter("d_name");
        String d_loc = request.getParameter("d_loc");
        String d_addTime = request.getParameter("d_addTime");
        Dept dept = new Dept();dept.setD_addTime(d_addTime);
        dept.setD_id(d_id);dept.setD_name(d_name);dept.setD_loc(d_loc);

        if(deptService.updateDept(dept)){
            request.setAttribute("updateDept1","部门修改成功");
            return updateDeptPage(request);
        }else{
            request.setAttribute("updateDept1","部门修改失败");
            return updateDeptPage(request);
        }
    }

    @RequestMapping("/updatePosition")
    public String updatePosition(HttpServletRequest request)throws Exception{
        int p_id = Integer.parseInt(request.getParameter("p_id"));
        String p_name = request.getParameter("p_name");
        Position position = new Position();
        position.setP_id(p_id);position.setP_name(p_name);
        if(positionService.updatePosition(position)){
            request.setAttribute("updatePosition1","职位修改成功");
            return lookDeptPost(request);
        }else{
            request.setAttribute("updatePosition2","职位修改失败");
            return lookDeptPost(request);
        }
    }

    @RequestMapping("/EmpLookDeptPost")//员工进入查看部门职位页面
    public String EmpLookDeptPost(HttpServletRequest request)throws Exception{
        List<Position> positions1 = positionService.findAllPosition();
        List<Dept> depts1 = deptService.findAllDept();
        request.setAttribute("positions1",positions1);
        request.setAttribute("depts1",depts1);
        return "EmpLookDeptPostPage";
    }

    @RequestMapping("/empLookPosition")//员工查看职位
    public String empLookPosition(HttpServletRequest request)throws Exception{
        int d_id = Integer.parseInt(request.getParameter("d_id"));
        Position position = new Position();position.setP_deptId(d_id);
        List<Position> positions2 = positionService.getByPDeptId(position);
        if(positions2.size()!=0){
            request.setAttribute("positions2",positions2);
            return "empLookPosition";
        }else{
            request.setAttribute("str1","此部门没有职位");
            return EmpLookDeptPost(request);
        }
    }

    @RequestMapping("/empLookEmp")//员工查看部门员工
    public String empLookEmp(HttpServletRequest request)throws Exception{
        int d_id = Integer.parseInt(request.getParameter("d_id"));
        Emp emp = new Emp();emp.setE_deptId(d_id);
        List<Emp> emp1 = empService.getEmpByDept(emp);
        if(emp1.size()!=0){
            request.setAttribute("emp1",emp1);
            return "empLookEmp";
        }else{
            request.setAttribute("str1","此部门没有员工");
            return EmpLookDeptPost(request);
        }
    }
}
