package com.zhengtd.dao;

import com.zhengtd.model.Dept;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2018/7/31.
 */
@Repository
public interface DeptMapper {
    boolean addDept(Dept dept);
    boolean deleteDept(Dept dept);
    boolean updateDept(Dept dept);
    Dept getDeptByID(Dept dept);
    Dept getDeptByDName(Dept dept);
    List<Dept> findAllDept();
}
