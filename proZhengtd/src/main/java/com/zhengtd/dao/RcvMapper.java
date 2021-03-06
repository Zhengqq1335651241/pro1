package com.zhengtd.dao;

import com.zhengtd.model.Rcv;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/7/27.
 */
@Repository
public interface RcvMapper {
    boolean addRcv(Rcv rcv);
    boolean deleteRcv(Rcv rcv);
    boolean updateRcv(Rcv rcv);
    boolean deleteAllRcv();
    boolean deleteUserRcv(Rcv rcv);
    List<Rcv> getByUIDAllRcv(Rcv rcv);
    List<Rcv> getPage(Map<String,Object> data);
    List<Rcv> getAllRcv();
    Rcv getRcvById(Rcv rcv);
    List<Rcv> getByInvite(Rcv rcv);
    List<Rcv> getByState(Rcv rcv);
    List<Rcv> getPageUser(Map<String,Object> data);
}
