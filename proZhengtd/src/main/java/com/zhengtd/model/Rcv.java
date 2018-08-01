package com.zhengtd.model;

import java.io.Serializable;

/**
 * Created by Administrator on 2018/7/27.
 */
public class Rcv implements Serializable{
    private int rv_id;
    private int rv_rid;
    private int rv_uid;
    private int rv_cvId;
    private String rv_time;
    private int rv_state;
    private String rv_job;
    private String rv_uname;
    private int rv_invite;

    public Rcv() {
    }

    public int getRv_invite() {
        return rv_invite;
    }

    public void setRv_invite(int rv_invite) {
        this.rv_invite = rv_invite;
    }

    public int getRv_uid() {

        return rv_uid;
    }

    public void setRv_uid(int rv_uid) {
        this.rv_uid = rv_uid;
    }

    public int getRv_id() {
        return rv_id;
    }

    public void setRv_id(int rv_id) {
        this.rv_id = rv_id;
    }

    public int getRv_rid() {
        return rv_rid;
    }

    public void setRv_rid(int rv_rid) {
        this.rv_rid = rv_rid;
    }

    public int getRv_cvId() {
        return rv_cvId;
    }

    public void setRv_cvId(int rv_cvId) {
        this.rv_cvId = rv_cvId;
    }

    public String getRv_time() {
        return rv_time;
    }

    public void setRv_time(String rv_time) {
        this.rv_time = rv_time;
    }

    public int getRv_state() {
        return rv_state;
    }

    public void setRv_state(int rv_state) {
        this.rv_state = rv_state;
    }

    public String getRv_job() {
        return rv_job;
    }

    public void setRv_job(String rv_job) {
        this.rv_job = rv_job;
    }

    public String getRv_uname() {
        return rv_uname;
    }

    public void setRv_uname(String rv_uname) {
        this.rv_uname = rv_uname;
    }

    public Rcv(int rv_id) {
        this.rv_id = rv_id;
    }

    @Override
    public String toString() {
        return "Rcv{" +
                "rv_id=" + rv_id +
                ", rv_rid=" + rv_rid +
                ", rv_uid=" + rv_uid +
                ", rv_cvId=" + rv_cvId +
                ", rv_time='" + rv_time + '\'' +
                ", rv_state=" + rv_state +
                ", rv_job='" + rv_job + '\'' +
                ", rv_uname='" + rv_uname + '\'' +
                ", rv_invite=" + rv_invite +
                '}';
    }
}
