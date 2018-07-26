package com.zhengtd.model;

import java.io.Serializable;

/**
 * Created by Administrator on 2018/7/25.
 */
public class Vitae implements Serializable {
    private int cv_id;
    private int cv_uid;
    private String cv_name;
    private String cv_birthday;
    private String cv_sex;
    private String cv_address;
    private String cv_phone;
    private String cv_major;
    private String cv_email;
    private String cv_school;
    private String cv_able;
    private String cv_hometown;
    private String cv_experience;
    private String cv_other;

    public Vitae(int cv_id, int cv_uid, String cv_name, String cv_birthday, String cv_sex, String cv_address, String cv_phone, String cv_major, String cv_email, String cv_school, String cv_able, String cv_hometown, String cv_experience, String cv_other) {
        this.cv_id = cv_id;
        this.cv_uid = cv_uid;
        this.cv_name = cv_name;
        this.cv_birthday = cv_birthday;
        this.cv_sex = cv_sex;
        this.cv_address = cv_address;
        this.cv_phone = cv_phone;
        this.cv_major = cv_major;
        this.cv_email = cv_email;
        this.cv_school = cv_school;
        this.cv_able = cv_able;
        this.cv_hometown = cv_hometown;
        this.cv_experience = cv_experience;
        this.cv_other = cv_other;
    }

    public Vitae() {
    }

    public int getCv_id() {
        return cv_id;
    }

    public void setCv_id(int cv_id) {
        this.cv_id = cv_id;
    }

    public int getCv_uid() {
        return cv_uid;
    }

    public void setCv_uid(int cv_uid) {
        this.cv_uid = cv_uid;
    }

    public String getCv_name() {
        return cv_name;
    }

    public void setCv_name(String cv_name) {
        this.cv_name = cv_name;
    }

    public String getCv_birthday() {
        return cv_birthday;
    }

    public void setCv_birthday(String cv_birthday) {
        this.cv_birthday = cv_birthday;
    }

    public String getCv_sex() {
        return cv_sex;
    }

    public void setCv_sex(String cv_sex) {
        this.cv_sex = cv_sex;
    }

    public String getCv_address() {
        return cv_address;
    }

    public void setCv_address(String cv_address) {
        this.cv_address = cv_address;
    }

    public String getCv_phone() {
        return cv_phone;
    }

    public void setCv_phone(String cv_phone) {
        this.cv_phone = cv_phone;
    }

    public String getCv_major() {
        return cv_major;
    }

    public void setCv_major(String cv_major) {
        this.cv_major = cv_major;
    }

    public String getCv_email() {
        return cv_email;
    }

    public void setCv_email(String cv_email) {
        this.cv_email = cv_email;
    }

    public String getCv_school() {
        return cv_school;
    }

    public void setCv_school(String cv_school) {
        this.cv_school = cv_school;
    }

    public String getCv_able() {
        return cv_able;
    }

    public void setCv_able(String cv_able) {
        this.cv_able = cv_able;
    }

    public String getCv_hometown() {
        return cv_hometown;
    }

    public void setCv_hometown(String cv_hometown) {
        this.cv_hometown = cv_hometown;
    }

    public String getCv_experience() {
        return cv_experience;
    }

    public void setCv_experience(String cv_experience) {
        this.cv_experience = cv_experience;
    }

    public String getCv_other() {
        return cv_other;
    }

    public void setCv_other(String cv_other) {
        this.cv_other = cv_other;
    }

    @Override
    public String toString() {
        return "Vitae{" +
                "cv_id=" + cv_id +
                ", cv_uid=" + cv_uid +
                ", cv_name='" + cv_name + '\'' +
                ", cv_birthday='" + cv_birthday + '\'' +
                ", cv_sex='" + cv_sex + '\'' +
                ", cv_address='" + cv_address + '\'' +
                ", cv_phone='" + cv_phone + '\'' +
                ", cv_major='" + cv_major + '\'' +
                ", cv_email='" + cv_email + '\'' +
                ", cv_school='" + cv_school + '\'' +
                ", cv_able='" + cv_able + '\'' +
                ", cv_hometown='" + cv_hometown + '\'' +
                ", cv_experience='" + cv_experience + '\'' +
                ", cv_other='" + cv_other + '\'' +
                '}';
    }
}
