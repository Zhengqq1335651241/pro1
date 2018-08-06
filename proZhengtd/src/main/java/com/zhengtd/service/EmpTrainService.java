package com.zhengtd.service;

import com.zhengtd.model.EmpTrain;

import java.util.List;

/**
 * Created by Administrator on 2018/8/3.
 */
public interface EmpTrainService {
    boolean addEmpTrain(EmpTrain empTrain);
    boolean deleteEmpTrain(EmpTrain empTrain);
    List<EmpTrain> getAllEmpTrain(EmpTrain empTrain);
    List<EmpTrain> getTrainByEmpID(EmpTrain empTrain);
    List<EmpTrain> getTrainByTrainID(EmpTrain empTrain);
}
