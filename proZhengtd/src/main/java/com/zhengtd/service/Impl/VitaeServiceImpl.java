package com.zhengtd.service.Impl;

import com.zhengtd.dao.VitaeMapper;
import com.zhengtd.model.Vitae;
import com.zhengtd.service.VitaeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/7/25.
 */
@Service
public class VitaeServiceImpl implements VitaeService {
    @Resource
    private VitaeMapper vitaeMapper;

    @Override
    public boolean addVitae(Vitae vitae) {
        return vitaeMapper.addVitae(vitae);
    }

    @Override
    public boolean deleteVitae(Vitae vitae) {
        return vitaeMapper.deleteVitae(vitae);
    }

    @Override
    public boolean updateVitae(Vitae vitae) {
        return vitaeMapper.updateVitae(vitae);
    }

    @Override
    public Vitae getByUidVitae(Vitae vitae) {
        return vitaeMapper.getByUidVitae(vitae);
    }
}
