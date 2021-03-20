package org.qinlin.service;

import org.qinlin.dao.mapper.SettlementMapper;
import org.qinlin.entity.Settlement;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.Random;

@Service
public class SettlementService {
    @Resource
    SettlementMapper mapper;

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int buy(Settlement record)
    {
        Random random = new Random();
        Date date = new Date();
        record.setSettleTime(date);
        record.setServiceChargeUsd((double) random.nextInt(10));
        return mapper.buy(record);
    }

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int sell(Settlement record)
    {
        Random random = new Random();
        Date date = new Date();
        record.setSettleTime(date);
        record.setServiceChargeUsd((double) random.nextInt(10));
        return mapper.sell(record);
    }
}
