package com.zhengtd.service.Impl;

import com.zhengtd.dao.RecruitMapper;
import com.zhengtd.model.Recruit;
import com.zhengtd.service.RecruitService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/7/25.
 */
@Service
public class RecruitServiceImpl implements RecruitService {
    @Resource
    private RecruitMapper recruitMapper;

    @Override
    public boolean addRec(Recruit recruit) {
        return recruitMapper.addRec(recruit);
    }

    @Override
    public boolean deleteRec(Recruit recruit) {
        return recruitMapper.deleteRec(recruit);
    }

    @Override
    public List<Recruit> getAllRec() {
        return recruitMapper.getAllRec();
    }

    @Override
    public List<Recruit> getPageRec(Map<String,Object> data) {
        return recruitMapper.getPageRec(data);
    }

    @Override
    public List<Recruit> getByState(Recruit recruit) {
        return recruitMapper.getByState(recruit);
    }

    @Override
    public Recruit getRecById(Recruit recruit) {
        return recruitMapper.getRecById(recruit);
    }

    @Override
    public boolean updateRec(Recruit recruit) {
        return recruitMapper.updateRec(recruit);
    }
}
