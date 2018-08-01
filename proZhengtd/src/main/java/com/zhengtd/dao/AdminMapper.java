package com.zhengtd.dao;

import com.zhengtd.model.Admin;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2018/7/28.
 */
@Repository
public interface AdminMapper {
    boolean addAdmin(Admin admin);
    boolean deleteAdmin(Admin admin);
    boolean updateAdmin(Admin admin);
    Admin getByID(Admin admin);
    Admin getByLoginA(Admin admin);
}
