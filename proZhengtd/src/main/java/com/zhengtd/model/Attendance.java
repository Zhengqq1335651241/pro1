package com.zhengtd.model;

import java.io.Serializable;

/**
 * Created by Administrator on 2018/8/6.
 */
public class Attendance implements Serializable{//考勤
    private int at_id;
    private String at_workDate;
    private String at_onWork;
    private String at_offWork;
    private int at_eid;
    private int at_state;

    public Attendance() {
    }

    public Attendance(int at_id, String at_workDate, String at_onWork, String at_offWork, int at_eid, int at_state) {
        this.at_id = at_id;
        this.at_workDate = at_workDate;
        this.at_onWork = at_onWork;
        this.at_offWork = at_offWork;
        this.at_eid = at_eid;
        this.at_state = at_state;
    }

    @Override
    public String toString() {
        return "Attendance{" +
                "at_id=" + at_id +
                ", at_workDate='" + at_workDate + '\'' +
                ", at_onWork='" + at_onWork + '\'' +
                ", at_offWork='" + at_offWork + '\'' +
                ", at_eid=" + at_eid +
                ", at_state=" + at_state +
                '}';
    }

    public int getAt_id() {
        return at_id;
    }

    public void setAt_id(int at_id) {
        this.at_id = at_id;
    }

    public String getAt_workDate() {
        return at_workDate;
    }

    public void setAt_workDate(String at_workDate) {
        this.at_workDate = at_workDate;
    }

    public String getAt_onWork() {
        return at_onWork;
    }

    public void setAt_onWork(String at_onWork) {
        this.at_onWork = at_onWork;
    }

    public String getAt_offWork() {
        return at_offWork;
    }

    public void setAt_offWork(String at_offWork) {
        this.at_offWork = at_offWork;
    }

    public int getAt_eid() {
        return at_eid;
    }

    public void setAt_eid(int at_eid) {
        this.at_eid = at_eid;
    }

    public int getAt_state() {
        return at_state;
    }

    public void setAt_state(int at_state) {
        this.at_state = at_state;
    }
}
