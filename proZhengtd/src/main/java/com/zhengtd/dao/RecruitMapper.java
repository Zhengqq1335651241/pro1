package com.zhengtd.dao;

import com.zhengtd.model.Recruit;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2018/7/25.
 */
@Repository
public interface RecruitMapper {
    boolean addRec(Recruit recruit);
    boolean deleteRec(Recruit recruit);
    List<Recruit> getAllRec();
    List<Recruit> getPageRec();
}
