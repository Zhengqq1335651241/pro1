package com.zhengtd.service.Impl;

import com.zhengtd.dao.AdminMapper;
import com.zhengtd.model.Admin;
import com.zhengtd.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/7/28.
 */
@Service
public class AdminServiceImpl implements AdminService{
    @Resource
    private AdminMapper adminMapper;

    @Override
    public Admin getByLoginA(Admin admin) {
        return adminMapper.getByLoginA(admin);
    }
}
