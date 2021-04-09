package org.qinlin.controller;

import org.qinlin.service.StatisticsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

@Controller
@RequestMapping("statisticsController")
public class StatisticsController {
    @Resource
    StatisticsService service;

    @ResponseBody
    @RequestMapping("selectWeekPrice")
    public List<Double> selectWeekPrice(Integer coinid)
    {
        return service.selectWeekPrice(coinid);
    }

    @ResponseBody
    @RequestMapping("selectDate")
    public List<Date> selectDate(Integer coinid)
    {
        return service.selectDate(coinid);
    }

    @ResponseBody
    @RequestMapping("selectWeekPriceList")
    public List<LinkedHashMap> selectWeekPriceList(Integer coinid)
    {
        return service.selectWeekPriceList(coinid);
    }
}
