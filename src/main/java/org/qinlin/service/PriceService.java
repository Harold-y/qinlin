package org.qinlin.service;

import org.qinlin.dao.mapper.PriceMapper;
import org.qinlin.dao.mapper.StatisticsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
public class PriceService {
    @Resource
    PriceMapper mapper;
    @Autowired
    StatisticsMapper statisticsMapper;

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public double selectPriceById(Integer id)
    {
        return mapper.selectPriceById(id);
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public double calculateVariation(Integer id)
    {
        double lastupdated = statisticsMapper.selectByCoinIdYesterday(id);
        return (selectPriceById(id) - lastupdated) / lastupdated;
    }
}
