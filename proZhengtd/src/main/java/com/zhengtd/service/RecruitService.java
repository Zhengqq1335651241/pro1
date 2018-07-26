package com.zhengtd.service;

import com.zhengtd.model.Recruit;

import java.util.List;

/**
 * Created by Administrator on 2018/7/25.
 */
public interface RecruitService {
    boolean addRec(Recruit recruit);
    boolean deleteRec(Recruit recruit);
    List<Recruit> getAllRec();
    List<Recruit> getPageRec();
}
