package com.zhengtd.service.Impl;

import com.zhengtd.dao.EmpTrainMapper;
import com.zhengtd.model.EmpTrain;
import com.zhengtd.service.EmpTrainService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/8/3.
 */
@Service
public class EmpTrainServiceImpl implements EmpTrainService {
    @Resource
    private EmpTrainMapper empTrainMapper;

    @Override
    public boolean addEmpTrain(EmpTrain empTrain) {
        return empTrainMapper.addEmpTrain(empTrain);
    }

    @Override
    public boolean deleteEmpTrain(EmpTrain empTrain) {
        return empTrainMapper.deleteEmpTrain(empTrain);
    }

    @Override
    public List<EmpTrain> getAllEmpTrain(EmpTrain empTrain) {
        return empTrainMapper.getAllEmpTrain(empTrain);
    }
}
