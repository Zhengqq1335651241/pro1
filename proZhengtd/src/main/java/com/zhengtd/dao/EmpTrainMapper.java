package com.zhengtd.dao;

import com.zhengtd.model.EmpTrain;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2018/8/2.
 */
@Repository
public interface EmpTrainMapper {
    boolean addEmpTrain(EmpTrain empTrain);
    boolean deleteEmpTrain(EmpTrain empTrain);
    List<EmpTrain> getAllEmpTrain(EmpTrain empTrain);
    List<EmpTrain> getTrainByEmpID(EmpTrain empTrain);
    List<EmpTrain> getTrainByTrainID(EmpTrain empTrain);
//    List<EmpTrain> getTrainByEmpId(int e_eid);
//    List<EmpTrain> getEmpByTrainId(int t_id);
}
