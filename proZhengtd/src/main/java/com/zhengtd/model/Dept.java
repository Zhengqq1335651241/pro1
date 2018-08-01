package com.zhengtd.model;

import java.io.Serializable;

/**
 * Created by Administrator on 2018/7/31.
 */
public class Dept implements Serializable{
    private int d_id;
    private String d_name;
    private String d_loc;
    private String d_addTime;

    @Override
    public String toString() {
        return "Dept{" +
                "d_id=" + d_id +
                ", d_name='" + d_name + '\'' +
                ", d_loc='" + d_loc + '\'' +
                ", d_addTime='" + d_addTime + '\'' +
                '}';
    }

    public String getD_addTime() {
        return d_addTime;
    }

    public void setD_addTime(String d_addTime) {
        this.d_addTime = d_addTime;
    }

    public int getD_id() {
        return d_id;
    }

    public void setD_id(int d_id) {
        this.d_id = d_id;
    }

    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }

    public String getD_loc() {
        return d_loc;
    }

    public void setD_loc(String d_loc) {
        this.d_loc = d_loc;
    }

    public Dept() {

    }

    public Dept(int d_id) {

        this.d_id = d_id;
    }
}
