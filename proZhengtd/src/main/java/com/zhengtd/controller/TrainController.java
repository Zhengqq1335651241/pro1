package com.zhengtd.controller;

import com.zhengtd.model.Dept;
import com.zhengtd.model.Emp;
import com.zhengtd.model.EmpTrain;
import com.zhengtd.model.Train;
import com.zhengtd.service.DeptService;
import com.zhengtd.service.EmpService;
import com.zhengtd.service.EmpTrainService;
import com.zhengtd.service.TrainService;
import com.zhengtd.utils.DoGetPages;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/8/2.
 */
@Controller
public class TrainController {
    @Resource
    private TrainService trainService;
    @Resource
    private DeptService deptService;
    @Resource
    private EmpService empService;
    @Resource
    private EmpTrainService empTrainService;

    @RequestMapping("/goTrainPage")
    public String goTrainPage()throws Exception{
        return "goTrainPage";
    }

    @RequestMapping("/goUpdateTrain")
    public String goUpdateTrain(HttpServletRequest request)throws Exception{
        int t_id = Integer.parseInt(request.getParameter("t_id"));
        Train train = new Train();train.setT_id(t_id);
        Train train1 = trainService.getTrainByTid(train);
        System.out.println(train1);
        request.setAttribute("train1",train1);
        return "goUpdateTrain";
    }

    @RequestMapping("/addTrainPage")
    public String addTrainPage(HttpServletRequest request)throws Exception{
        Train train = new Train();train.setT_push(1);
        List<Train> trains1 = trainService.getTrainByPush(train);
        List<Dept> depts1 = deptService.findAllDept();
        if(trains1.size()==0){
            request.setAttribute("str2","没有未发布培训");
            request.setAttribute("depts1",depts1);
            return "addTrain";
        }else{
            request.setAttribute("trains1",trains1);
            request.setAttribute("depts1",depts1);
            return "addTrain";
        }
    }

    @RequestMapping("/addTrain")//管理员添加培训
    public String addTrain(Train train,HttpServletRequest request)throws Exception{
        int t_obj = Integer.parseInt(request.getParameter("t_obj"));
        //如果添加对象为试用期的,先判断有无试用期的员工,有则添加入train和emptrain表;
        //如果添加对象为部门,先判断部门有没有员工,有则添加入train和emptrain表;
        if(t_obj==-1){
            Emp emp = new Emp();emp.setE_state(-1);
            List<Emp> empList = empService.getEmpByState(emp);
            System.out.println(empList);
            if(empList.size()==0) {
                request.setAttribute("str1","没有试用期员工");
                return addTrainPage(request);
            }else{
                for (Emp anEmpList : empList) {
                    int emp_id = anEmpList.getE_eid();
                    train.setT_obj(emp_id);
                    boolean flag = trainService.addTrain(train);
                    if (flag) {
                        EmpTrain empTrain = new EmpTrain();
                        empTrain.setEmp_id(emp_id);
                        empTrain.setTrain_id(train.getT_id());
                        boolean flag1 = empTrainService.addEmpTrain(empTrain);
                        if (flag1) {
                            request.setAttribute("str1", "添加成功");
                            return addTrainPage(request);
                        }
                    }
                }
            }
        }else{
            Emp emp = new Emp();emp.setE_deptId(t_obj);
            List<Emp> empList = empService.getEmpByDept(emp);
            if(empList.size()==0){
                request.setAttribute("str1","该部门没有员工");
                return addTrainPage(request);
            }else{
                for (Emp anEmpList : empList) {
                    int emp_id = anEmpList.getE_eid();
                    train.setT_obj(emp_id);
                    boolean flag = trainService.addTrain(train);
                    if (flag) {
                        EmpTrain empTrain = new EmpTrain();
                        empTrain.setEmp_id(emp_id);
                        empTrain.setTrain_id(train.getT_id());
                        boolean flag1 = empTrainService.addEmpTrain(empTrain);
                        if (flag1) {
                            request.setAttribute("str1", "添加成功");
                            return addTrainPage(request);
                        }
                    }
                }
            }
        }
        request.setAttribute("str1","添加出错");
        return addTrainPage(request);
    }
    @RequestMapping("/getAllTrain")//管理员查看所有培训
    public String getAllTrain(int currentPage, HttpSession session,
                              HttpServletRequest request)throws Exception{
        int push = 2;
        Train train = new Train();train.setT_push(push);
        List<Train> trains = trainService.getAllTrain(train);
        if(trains.size()==0){
            request.setAttribute("str1","没有培训信息,赶快去发布吧");
            return "goTrainPage";
        }else{
            final int PAGESIZE = 5;

            int totalRows = trains.size();
            int totalPages = DoGetPages.getTotalPages(totalRows,PAGESIZE);//总页数

            Map<String,Object> data = new HashMap<>();
            data.put("currentPage",(currentPage-1)*PAGESIZE+1);
            data.put("pageSize",(currentPage)*PAGESIZE);
            data.put("push",push);
            List<Train> trainList = trainService.getTrainPage(data);
            if(trainList.size()!=0){
                session.setAttribute("trainList",trainList);
                request.setAttribute("totalPages",totalPages);
                return "allTrainDetails";
            }
        }
        return "goTrainPage";
    }



    @RequestMapping("/deleteUnpushTrain")
    public String deleteUnpushTrain(HttpServletRequest request)throws Exception{
        int t_id = Integer.parseInt(request.getParameter("t_id"));
        Train train = new Train();train.setT_id(t_id);
        boolean flag = trainService.deleteTrain(train);
        if(flag){
            request.setAttribute("str3","删除成功");
            return addTrainPage(request);
        }else{
            request.setAttribute("str3","删除失败");
            return "addTrain";
        }
    }

    @RequestMapping("/deletePushTrain")
    public String deletePushTrain(HttpServletRequest request,HttpSession session)throws Exception{
        int t_id = Integer.parseInt(request.getParameter("t_id"));
        Train train = new Train();train.setT_id(t_id);
        boolean flag = trainService.deleteTrain(train);
        int currentPage=1;
        if(flag){
            request.setAttribute("str3","删除成功");
            return getAllTrain(currentPage,session, request);
        }else{
            request.setAttribute("str3","删除失败");
            return getAllTrain(currentPage,session, request);
        }
    }

    @RequestMapping("/updateUnPushTrain")
    public String updateUnPushTrain(Train train,HttpServletRequest request)throws Exception{
        boolean flag = trainService.updateTrain(train);
        if(flag){
            request.setAttribute("str1","修改发布成功");
            return goUpdateTrain(request);
        }else{
            request.setAttribute("str1","修改发布失败");
            return goUpdateTrain(request);
        }
    }
}
