package com.zhengtd.service;

import com.zhengtd.model.Vitae;

import java.util.List;

/**
 * Created by Administrator on 2018/7/25.
 */
public interface VitaeService {
    boolean addVitae(Vitae vitae);
    boolean deleteVitae(Vitae vitae);
    boolean updateVitae(Vitae vitae);
    List<Vitae> getByUidVitae(Vitae vitae);
    Vitae getByIdVC(Vitae vitae);
}
