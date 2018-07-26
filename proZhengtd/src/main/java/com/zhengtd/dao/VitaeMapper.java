package com.zhengtd.dao;

import com.zhengtd.model.Vitae;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2018/7/25.
 */
@Repository
public interface VitaeMapper {
    boolean addVitae(Vitae vitae);
    boolean deleteVitae(Vitae vitae);
    boolean updateVitae(Vitae vitae);
    Vitae getByUidVitae(Vitae vitae);
}
