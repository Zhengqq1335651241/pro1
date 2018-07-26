package com.zhengtd.model;

import java.io.Serializable;

/**
 * Created by Administrator on 2018/7/25.
 */
public class Recruit implements Serializable{
    private int r_id;
    private String r_job;
    private int r_salary;
    private String r_workTime;
    private String r_workPlace;
    private String r_treatment;
    private String r_jobRequirement;
    private String r_other;

    public Recruit() {
    }

    public Recruit(int r_id, String r_job, int r_salary, String r_workTime, String r_workPlace, String r_treatment, String r_jobRequirement, String r_other) {
        this.r_id = r_id;
        this.r_job = r_job;
        this.r_salary = r_salary;
        this.r_workTime = r_workTime;
        this.r_workPlace = r_workPlace;
        this.r_treatment = r_treatment;
        this.r_jobRequirement = r_jobRequirement;
        this.r_other = r_other;
    }

    @Override
    public String toString() {
        return "Recruit{" +
                "r_id=" + r_id +
                ", r_job='" + r_job + '\'' +
                ", r_salary=" + r_salary +
                ", r_workTime='" + r_workTime + '\'' +
                ", r_workPlace='" + r_workPlace + '\'' +
                ", r_treatment='" + r_treatment + '\'' +
                ", r_jobRequirement='" + r_jobRequirement + '\'' +
                ", r_other='" + r_other + '\'' +
                '}';
    }

    public int getR_id() {
        return r_id;
    }

    public void setR_id(int r_id) {
        this.r_id = r_id;
    }

    public String getR_job() {
        return r_job;
    }

    public void setR_job(String r_job) {
        this.r_job = r_job;
    }

    public int getR_salary() {
        return r_salary;
    }

    public void setR_salary(int r_salary) {
        this.r_salary = r_salary;
    }

    public String getR_workTime() {
        return r_workTime;
    }

    public void setR_workTime(String r_workTime) {
        this.r_workTime = r_workTime;
    }

    public String getR_workPlace() {
        return r_workPlace;
    }

    public void setR_workPlace(String r_workPlace) {
        this.r_workPlace = r_workPlace;
    }

    public String getR_treatment() {
        return r_treatment;
    }

    public void setR_treatment(String r_treatment) {
        this.r_treatment = r_treatment;
    }

    public String getR_jobRequirement() {
        return r_jobRequirement;
    }

    public void setR_jobRequirement(String r_jobRequirement) {
        this.r_jobRequirement = r_jobRequirement;
    }

    public String getR_other() {
        return r_other;
    }

    public void setR_other(String r_other) {
        this.r_other = r_other;
    }
}
