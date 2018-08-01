package com.zhengtd.service;

import com.zhengtd.model.Recruit;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/7/25.
 */
public interface RecruitService {
    boolean addRec(Recruit recruit);
    boolean deleteRec(Recruit recruit);
    boolean updateRec(Recruit recruit);
    List<Recruit> getAllRec();
    Recruit getRecById(Recruit recruit);
    List<Recruit> getByState(Recruit recruit);
    List<Recruit> getPageRec(Map<String,Object> data);
}
