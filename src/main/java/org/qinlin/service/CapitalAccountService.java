package org.qinlin.service;

import org.qinlin.dao.mapper.CapitalAccountMapper;
import org.qinlin.dao.mapper.CoinMapper;
import org.qinlin.dao.mapper.PriceMapper;
import org.qinlin.dao.mapper.TradeAccountMapper;
import org.qinlin.entity.CapitalAccount;
import org.qinlin.entity.TradeAccount;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.DecimalFormat;
import java.util.LinkedHashMap;
import java.util.List;

@Service
public class CapitalAccountService {
    @Resource
    CapitalAccountMapper mapper;
    @Resource
    CoinMapper coinMapper;
    @Resource
    PriceMapper priceMapper;
    @Resource
    TradeAccountMapper tradeAccountMapper;
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int transferIn(Integer userid, Integer coinid, double amount)
    {
        int existence = mapper.checkIfExist(userid, coinid);
        if(existence <= 0)
        {
            CapitalAccount account = new CapitalAccount();
            account.setAmount(0.000);
            account.setCoinid(coinid);
            account.setUserid(userid);
            mapper.transferInCreate(account);
            account.setAmount(amount);
            return mapper.update(account);
        }else
        {
            double originalAmount = mapper.selectAmountById(userid, coinid);
            CapitalAccount account = new CapitalAccount();
            account.setCoinid(coinid);
            account.setUserid(userid);
            account.setAmount(originalAmount+amount);
            return mapper.update(account);
        }
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int transferOut(Integer userid, Integer coinid, double amount)
    {
        int existence = mapper.checkIfExist(userid, coinid);
        if(existence <= 0)
        {
            CapitalAccount account = new CapitalAccount();
            account.setAmount(0.000);
            account.setCoinid(coinid);
            account.setUserid(userid);
            mapper.transferInCreate(account);
            return -1;
        }else
        {
            double originalAmount = mapper.selectAmountById(userid, coinid);
            if(originalAmount < amount)
                return -1;
            CapitalAccount account = new CapitalAccount();
            account.setCoinid(coinid);
            account.setUserid(userid);
            account.setAmount(originalAmount - amount);
            return mapper.update(account);
        }
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public double selectAmountById(Integer userid, Integer coinid)
    {
        try {
            return mapper.selectAmountById(userid, coinid);
        } catch (Exception e)
        {
            return 0.0;
        }
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public List<LinkedHashMap> selectAllCoinByUserId(Integer userid)
    {
        List<LinkedHashMap> listOfInfo = mapper.selectAllCoinByUserId(userid);
        double sum = 0;
        DecimalFormat df = new DecimalFormat("0.00");
        DecimalFormat df2 = new DecimalFormat("0.000000");
        for(LinkedHashMap map : listOfInfo)
        {
            int coinid = (int) map.get("coinid");
            LinkedHashMap coinInfo = coinMapper.selectAllCoinCompleteInfo(coinid);
            map.put("cn_name",coinInfo.get("cn_name"));
            map.put("abbre_name",coinInfo.get("abbre_name"));
            double price = priceMapper.selectPriceById(coinid);
            map.put("amount",df2.format(map.get("amount")));
            map.put("total_worth",df.format(price*Double.parseDouble((String) map.get("amount"))));
            map.put("coinImgSrc","/static/img/coin/"+map.get("coinid")+".jpg");
            sum+=Double.parseDouble((String)map.get("total_worth"));
        }

        for(LinkedHashMap map : listOfInfo)
        {
            map.put("percentage",df.format(Double.parseDouble((String)map.get("total_worth"))/sum));
        }
        return listOfInfo;
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int transferIntoTradeAccount(Integer userid, Integer coinid, Double amount)
    {
        int existence = mapper.checkIfExist(userid, coinid);
        if(existence <= 0)
        {
            CapitalAccount account = new CapitalAccount();
            account.setAmount(0.000);
            account.setCoinid(coinid);
            account.setUserid(userid);
            mapper.transferInCreate(account);
            return -1;
        }else
        {
            double originalAmount = mapper.selectAmountById(userid, coinid);
            if(originalAmount < Math.abs(amount))
            {
                return -1;
            }
            CapitalAccount account = new CapitalAccount();
            account.setCoinid(coinid);
            account.setUserid(userid);
            account.setAmount(amount);
            int tradeAccountExistence = tradeAccountMapper.checkIfExist(userid, coinid);
            if(tradeAccountExistence <= 0)
            {
                TradeAccount tradeAccount = new TradeAccount();
                tradeAccount.setAmount(0.00);
                tradeAccount.setCoinid(coinid);
                tradeAccount.setUserid(userid);
                tradeAccountMapper.transferInCreate(tradeAccount);
            }
            tradeAccountMapper.transferWithCapitalAccount(userid, coinid, Math.abs(amount));
            return mapper.transferWithTradeAccount(userid, coinid, amount);
        }
    }
}
