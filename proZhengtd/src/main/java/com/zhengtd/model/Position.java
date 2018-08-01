package com.zhengtd.model;

import java.io.Serializable;

/**
 * Created by Administrator on 2018/7/31.
 */
public class Position implements Serializable{
    private int p_id;
    private String p_name;
    private int p_deptId;
    private String p_addTime;


    @Override
    public String toString() {
        return "Position{" +
                "p_id=" + p_id +
                ", p_name='" + p_name + '\'' +
                ", p_deptId=" + p_deptId +
                ", p_addTime='" + p_addTime + '\'' +
                '}';
    }

    public String getP_addTime() {
        return p_addTime;
    }

    public void setP_addTime(String p_addTime) {
        this.p_addTime = p_addTime;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public int getP_deptId() {
        return p_deptId;
    }

    public void setP_deptId(int p_deptId) {
        this.p_deptId = p_deptId;
    }

    public Position() {

    }

    public Position(int p_id) {

        this.p_id = p_id;
    }

    public Position(int p_id, String p_name, int p_deptId) {

        this.p_id = p_id;
        this.p_name = p_name;
        this.p_deptId = p_deptId;
    }
}
