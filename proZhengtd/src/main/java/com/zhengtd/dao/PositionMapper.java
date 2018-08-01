package com.zhengtd.dao;

import com.zhengtd.model.Position;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2018/7/31.
 */
@Repository
public interface PositionMapper {
    boolean addPosition(Position position);
    boolean deletePosition(Position position);
    boolean updatePosition(Position position);
    Position getByID(Position position);
    List<Position> getByPName(Position position);
    List<Position> getByPDeptId(Position position);
    List<Position> findAllPosition();
}
