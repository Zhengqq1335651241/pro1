package com.zhengtd.controller;

import com.zhengtd.dao.VitaeMapper;
import com.zhengtd.service.VitaeService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/7/25.
 */
@Controller
public class VitaeController {
    @Resource
    private VitaeService vitaeService;


}
