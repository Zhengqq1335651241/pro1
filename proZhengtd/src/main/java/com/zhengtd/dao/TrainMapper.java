package com.zhengtd.dao;

import com.zhengtd.model.Train;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/8/2.
 */
@Repository
public interface TrainMapper {
    boolean addTrain(Train train);
    boolean deleteTrain(Train train);
    boolean updateTrain(Train train);
    Train getTrainByTid(Train train);
    List<Train> getAllTrain(Train train);
    List<Train> getTrainPage(Map<String,Object> data);
    List<Train> getTrainByPush(Train train);
    List<Train> getTrainByEmpDeptID(Train train);
    List<Train> getTrainPageByEmp(Map<String,Object> data);
}
