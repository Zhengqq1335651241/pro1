package com.zhengtd.dao;

import com.zhengtd.model.Recruit;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/7/25.
 */
@Repository
public interface RecruitMapper {
    boolean addRec(Recruit recruit);
    boolean deleteRec(Recruit recruit);
    boolean updateRec(Recruit recruit);
    Recruit getRecById(Recruit recruit);
    List<Recruit> getAllRec();
    List<Recruit> getByState(Recruit recruit);
    List<Recruit> getPageRec(Map<String,Object> data);
}
