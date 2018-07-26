package com.zhengtd.service.Impl;

import com.zhengtd.dao.UserMapper;
import com.zhengtd.model.User;
import com.zhengtd.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/7/25.
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    @Override
    public boolean addUser(User user) {
        User user1 = userMapper.getByName(user);
        if(user1==null){
            return userMapper.addUser(user);
        }
        return false;
    }

    @Override
    public User getByLogin(User user) {
        return userMapper.getByLogin(user);
    }
}
