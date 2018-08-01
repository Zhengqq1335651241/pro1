package com.zhengtd.dao;

import com.zhengtd.model.Emp;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2018/7/30.
 */
@Repository
public interface EmpMapper {
    boolean addEmp(Emp emp);
    boolean updateEmp(Emp emp);
    boolean deleteEmp(Emp emp);
    Emp getEmpById(Emp emp);
    List<Emp> getEmpByDept(Emp emp);
    List<Emp> getEmpByPost(Emp emp);
}
