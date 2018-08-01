package com.zhengtd.service.Impl;

import com.zhengtd.dao.RcvMapper;
import com.zhengtd.model.Rcv;
import com.zhengtd.service.RcvService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/7/27.
 */
@Service
public class RcvServiceImpl implements RcvService {
    @Resource
    private RcvMapper rcvMapper;

    @Override
    public boolean addRcv(Rcv rcv) {
        return rcvMapper.addRcv(rcv);
    }

    @Override
    public boolean deleteRcv(Rcv rcv) {
        return rcvMapper.deleteRcv(rcv);
    }

    @Override
    public boolean updateRcv(Rcv rcv) {
        return rcvMapper.updateRcv(rcv);
    }

    @Override
    public List<Rcv> getByUIDAllRcv(Rcv rcv) {
        return rcvMapper.getByUIDAllRcv(rcv);
    }

    @Override
    public List<Rcv> getPage(Map<String, Object> data) {
        return rcvMapper.getPage(data);
    }

    @Override
    public List<Rcv> getAllRcv() {
        return rcvMapper.getAllRcv();
    }

    @Override
    public Rcv getRcvById(Rcv rcv) {
        return rcvMapper.getRcvById(rcv);
    }

    @Override
    public List<Rcv> getByInvite(Rcv rcv) {
        return rcvMapper.getByInvite(rcv);
    }

    @Override
    public List<Rcv> getByState(Rcv rcv) {
        return rcvMapper.getByState(rcv);
    }
}
