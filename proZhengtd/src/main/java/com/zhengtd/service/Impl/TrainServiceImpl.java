package com.zhengtd.service.Impl;

import com.zhengtd.dao.TrainMapper;
import com.zhengtd.model.Train;
import com.zhengtd.service.TrainService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/8/2.
 */
@Service
public class TrainServiceImpl implements TrainService {
    @Resource
    private TrainMapper trainMapper;

    @Override
    public boolean addTrain(Train train) {
        return trainMapper.addTrain(train);
    }

    @Override
    public boolean deleteTrain(Train train) {
        return trainMapper.deleteTrain(train);
    }

    @Override
    public boolean updateTrain(Train train) {
        return trainMapper.updateTrain(train);
    }

    @Override
    public Train getTrainByTid(Train train) {
        return trainMapper.getTrainByTid(train);
    }

    @Override
    public List<Train> getAllTrain(Train train) {
        return trainMapper.getAllTrain(train);
    }

    @Override
    public List<Train> getTrainByPush(Train train) {
        return trainMapper.getTrainByPush(train);
    }

    @Override
    public List<Train> getTrainPage(Map<String, Object> data) {
        return trainMapper.getTrainPage(data);
    }
}
