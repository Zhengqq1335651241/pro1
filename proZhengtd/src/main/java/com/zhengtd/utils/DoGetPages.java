package com.zhengtd.utils;

/**
 * Created by Administrator on 2018/6/23.
 */
public class DoGetPages {
    //private static final int PAGESIZE = 1;//每页显示数据量
    //totalRows 总数据量
    public static int getTotalPages(int totalRows,int PAGESIZE){
        return totalRows%PAGESIZE==0?totalRows/PAGESIZE :totalRows/PAGESIZE + 1;
        //总数据量取余每页量为0则页数为商,否则为商加1
    }
}
