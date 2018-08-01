package com.zhengtd.service;

import com.zhengtd.model.Dept;

import java.util.List;

/**
 * Created by Administrator on 2018/7/31.
 */
public interface DeptService {
    boolean addDept(Dept dept);
    boolean deleteDept(Dept dept);
    boolean updateDept(Dept dept);
    Dept getDeptByID(Dept dept);
    Dept getDeptByDName(Dept dept);
    List<Dept> findAllDept();
}
