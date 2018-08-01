package com.zhengtd.service.Impl;

import com.zhengtd.dao.DeptMapper;
import com.zhengtd.model.Dept;
import com.zhengtd.service.DeptService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/7/31.
 */
@Service
public class DeptServiceImpl implements DeptService {
    @Resource
    private DeptMapper deptMapper;

    @Override
    public boolean addDept(Dept dept) {
        Dept dept1= deptMapper.getDeptByDName(dept);
        if(dept1==null){
            return deptMapper.addDept(dept);
        }
        return false;
    }

    @Override
    public boolean deleteDept(Dept dept) {
        return deptMapper.deleteDept(dept);
    }

    @Override
    public boolean updateDept(Dept dept) {
        return deptMapper.updateDept(dept);
    }

    @Override
    public Dept getDeptByID(Dept dept) {
        return deptMapper.getDeptByID(dept);
    }

    @Override
    public Dept getDeptByDName(Dept dept) {
        return deptMapper.getDeptByDName(dept);
    }

    @Override
    public List<Dept> findAllDept() {
        return deptMapper.findAllDept();
    }
}
