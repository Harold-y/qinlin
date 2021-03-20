package org.qinlin.service;

import org.qinlin.dao.mapper.CoinMapper;
import org.qinlin.dao.mapper.PriceMapper;
import org.qinlin.dao.mapper.StatisticsMapper;
import org.qinlin.entity.Coin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.DecimalFormat;
import java.util.LinkedHashMap;
import java.util.List;

@Service
public class CoinService {
    @Autowired
    CoinMapper mapper;
    @Resource
    PriceMapper priceMapper;
    @Autowired
    StatisticsMapper statisticsMapper;
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public List<LinkedHashMap> selectAllCoinPartialInfo()
    {
        List<LinkedHashMap> originList = mapper.selectAllCoinPartialInfo();
        for(LinkedHashMap map : originList)
        {
            int coinid = (int) map.get("coinid");
            double price = priceMapper.selectPriceById(coinid);
            double yesterday = statisticsMapper.selectByCoinIdYesterday(coinid);
            double variation = (price - yesterday) / yesterday * 100;
            DecimalFormat df = new DecimalFormat("###########0.00");
            variation = Double.parseDouble(df.format(variation));
            map.put("Price", price);
            map.put("Variation", variation);
        }
        return originList;
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public LinkedHashMap selectAllCoinCompleteInfo(Integer coinid)
    {
        double price = priceMapper.selectPriceById(coinid);
        double yesterday = statisticsMapper.selectByCoinIdYesterday(coinid);
        double variation = (price - yesterday) / yesterday * 100;
        DecimalFormat df = new DecimalFormat("###########0.00");
        variation = Double.parseDouble(df.format(variation));
        LinkedHashMap map = mapper.selectAllCoinCompleteInfo(coinid);
        map.put("Price", price);
        map.put("Variation", variation);
        map.put("highestPrice",statisticsMapper.selectHighestPriceById(coinid));
        map.put("tradeAmount",statisticsMapper.selectTradeAmountById(coinid));
        return map;
    }
}
