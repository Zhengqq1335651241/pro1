package com.zhengtd.dao;

import com.zhengtd.model.User;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2018/7/25.
 */
@Repository
public interface UserMapper {
    boolean addUser(User user);
    User getByLogin(User user);
    User getByName(User user);
}
