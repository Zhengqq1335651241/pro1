package com.zhengtd.model;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2018/8/2.
 */
public class Train implements Serializable {
    private int t_id;
    private String t_topic;
    private String t_content;
    private String t_startTime;
    private String t_endTime;
    private String t_place;
    private int t_push;
    private int t_obj;


    public Train() {
    }

    public int getT_obj() {
        return t_obj;
    }

    public void setT_obj(int t_obj) {
        this.t_obj = t_obj;
    }

    public Train(int t_id, String t_topic, String t_content, String t_startTime, String t_endTime, String t_place, int t_push, int t_obj) {
        this.t_id = t_id;
        this.t_topic = t_topic;
        this.t_content = t_content;
        this.t_startTime = t_startTime;
        this.t_endTime = t_endTime;
        this.t_place = t_place;
        this.t_push = t_push;
        this.t_obj = t_obj;
    }

    public int getT_push() {
        return t_push;
    }

    public void setT_push(int t_push) {
        this.t_push = t_push;
    }

    @Override
    public String toString() {
        return "Train{" +
                "t_id=" + t_id +
                ", t_topic='" + t_topic + '\'' +
                ", t_content='" + t_content + '\'' +
                ", t_startTime='" + t_startTime + '\'' +
                ", t_endTime='" + t_endTime + '\'' +
                ", t_place='" + t_place + '\'' +
                ", t_push=" + t_push +
                ", t_obj=" + t_obj +
                '}';
    }

    public String getT_startTime() {
        return t_startTime;
    }

    public void setT_startTime(String t_startTime) {
        this.t_startTime = t_startTime;
    }

    public String getT_endTime() {
        return t_endTime;
    }

    public void setT_endTime(String t_endTime) {
        this.t_endTime = t_endTime;
    }

    public int getT_id() {
        return t_id;
    }

    public void setT_id(int t_id) {
        this.t_id = t_id;
    }

    public String getT_topic() {
        return t_topic;
    }

    public void setT_topic(String t_topic) {
        this.t_topic = t_topic;
    }

    public String getT_content() {
        return t_content;
    }

    public void setT_content(String t_content) {
        this.t_content = t_content;
    }


    public String getT_place() {
        return t_place;
    }

    public void setT_place(String t_place) {
        this.t_place = t_place;
    }


}
