package com.zhengtd.dao;

import com.zhengtd.model.Attendance;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/8/6.
 */
@Repository
public interface AttendanceMapper {
    boolean addAttendRecord(Attendance attendance);
    boolean deleteAttendRecord(Attendance attendance);
    boolean updateAttendRecord(Attendance attendance);
    List<Attendance> getRecordByEmp(Attendance attendance);
    List<Attendance> getAll();
    List<Attendance> getPageRecord(Map<String,Object> data);
    Attendance getRecordByID(Attendance attendance);
}
