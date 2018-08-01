package com.zhengtd.service.Impl;

import com.zhengtd.dao.EmpMapper;
import com.zhengtd.model.Emp;
import com.zhengtd.service.EmpService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/7/30.
 */
@Service
public class EmpServiceImpl implements EmpService {
    @Resource
    private EmpMapper empMapper;

    @Override
    public boolean addEmp(Emp emp) {
        return empMapper.addEmp(emp);
    }

    @Override
    public boolean updateEmp(Emp emp) {
        return empMapper.updateEmp(emp);
    }

    @Override
    public boolean deleteEmp(Emp emp) {
        return empMapper.deleteEmp(emp);
    }

    @Override
    public Emp getEmpById(Emp emp) {
        return empMapper.getEmpById(emp);
    }

    @Override
    public List<Emp> getEmpByDept(Emp emp) {
        return empMapper.getEmpByDept(emp);
    }

    @Override
    public List<Emp> getEmpByPost(Emp emp) {
        return empMapper.getEmpByPost(emp);
    }
}
