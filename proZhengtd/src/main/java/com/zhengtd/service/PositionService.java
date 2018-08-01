package com.zhengtd.service;

import com.zhengtd.model.Position;

import java.util.List;

/**
 * Created by Administrator on 2018/7/31.
 */
public interface PositionService {
    boolean addPosition(Position position);
    boolean deletePosition(Position position);
    boolean updatePosition(Position position);
    Position getByID(Position position);
    List<Position> getByPName(Position position);
    List<Position> getByPDeptId(Position position);
    List<Position> findAllPosition();
}
