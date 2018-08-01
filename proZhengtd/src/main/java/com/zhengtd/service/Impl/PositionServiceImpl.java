package com.zhengtd.service.Impl;

import com.zhengtd.dao.PositionMapper;
import com.zhengtd.model.Position;
import com.zhengtd.service.PositionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/7/31.
 */
@Service
public class PositionServiceImpl implements PositionService {
    @Resource
    private PositionMapper positionMapper;

    @Override
    public boolean addPosition(Position position) {
        List<Position> list = positionMapper.getByPName(position);
        if(list.size()==0) {
            return positionMapper.addPosition(position);
        }
        return false;
    }

    @Override
    public boolean deletePosition(Position position) {
        return positionMapper.deletePosition(position);
    }

    @Override
    public boolean updatePosition(Position position) {
        return positionMapper.updatePosition(position);
    }

    @Override
    public Position getByID(Position position) {
        return positionMapper.getByID(position);
    }

    @Override
    public List<Position> getByPName(Position position) {
        return positionMapper.getByPName(position);
    }

    @Override
    public List<Position> getByPDeptId(Position position) {
        return positionMapper.getByPDeptId(position);
    }

    @Override
    public List<Position> findAllPosition() {
        return positionMapper.findAllPosition();
    }
}


