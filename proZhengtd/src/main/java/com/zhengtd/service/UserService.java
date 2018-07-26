package com.zhengtd.service;

import com.zhengtd.model.User;

/**
 * Created by Administrator on 2018/7/25.
 */
public interface UserService {
    boolean addUser(User user);
    User getByLogin(User user);
}
