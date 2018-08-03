package com.zhengtd.service;

import com.zhengtd.model.Train;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/8/2.
 */
public interface TrainService {
    boolean addTrain(Train train);
    boolean deleteTrain(Train train);
    boolean updateTrain(Train train);
    Train getTrainByTid(Train train);
    List<Train> getAllTrain(Train train);
    List<Train> getTrainPage(Map<String,Object> data);
    List<Train> getTrainByPush(Train train);
}
