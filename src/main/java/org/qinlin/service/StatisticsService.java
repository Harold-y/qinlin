package org.qinlin.service;

import org.qinlin.dao.mapper.StatisticsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

@Service
public class StatisticsService {
    @Resource
    StatisticsMapper mapper;

    public double selectByCoinIdYesterday(Integer id)
    {
        return mapper.selectByCoinIdYesterday(id);
    }

    public List<Double> selectWeekPrice(Integer id)
    {
        return mapper.selectWeekPrice(id);
    }

    public List<Date> selectDate(Integer id)
    {
        return mapper.selectDate(id);
    }

    public List<LinkedHashMap> selectWeekPriceList(Integer id)
    {
        return mapper.selectWeekPriceList(id);
    }
}
