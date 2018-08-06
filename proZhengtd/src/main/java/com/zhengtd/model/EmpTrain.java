package com.zhengtd.model;

import java.io.Serializable;

/**
 * Created by Administrator on 2018/8/2.
 */
public class EmpTrain implements Serializable {
    private int et_id;
    private int emp_id;
    private int train_id;

    public int getEt_id() {
        return et_id;
    }

    public void setEt_id(int et_id) {
        this.et_id = et_id;
    }

    public int getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(int emp_id) {
        this.emp_id = emp_id;
    }

    public int getTrain_id() {
        return train_id;
    }

    public void setTrain_id(int train_id) {
        this.train_id = train_id;
    }

    @Override
    public String toString() {
        return "EmpTrain{" +
                "et_id=" + et_id +
                ", emp_id=" + emp_id +
                ", train_id=" + train_id +
                '}';
    }
}
