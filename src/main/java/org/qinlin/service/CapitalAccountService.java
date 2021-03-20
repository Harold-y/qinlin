package org.qinlin.service;

import org.qinlin.dao.mapper.CapitalAccountMapper;
import org.qinlin.entity.CapitalAccount;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
public class CapitalAccountService {
    @Resource
    CapitalAccountMapper mapper;
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
}
