package org.qinlin.service;

import org.qinlin.dao.mapper.BankAccountMapper;
import org.qinlin.entity.BankAccount;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;

@Service
public class BankAccountService {
    @Resource
    BankAccountMapper mapper;

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int transferIn(Integer userid, Integer bankid, String bankaccount, double amount)
    {
        double checkingAccountAmount = mapper.selectCheckingAccountById(userid, bankid, bankaccount);
        BankAccount account = new BankAccount();
        account.setUserid(userid);
        account.setBankid(bankid);
        account.setBankaccount(bankaccount);
        account.setCheckingaccount(checkingAccountAmount + amount);
        return mapper.update(account);
    }

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int transferOut(Integer userid, Integer bankid, String bankaccount, double amount)
    {
        double checkingAccountAmount = mapper.selectCheckingAccountById(userid, bankid, bankaccount);
        if(checkingAccountAmount < amount)
            return -1;
        BankAccount account = new BankAccount();
        account.setUserid(userid);
        account.setBankid(bankid);
        account.setBankaccount(bankaccount);
        account.setCheckingaccount(checkingAccountAmount - amount);
        return mapper.update(account);
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public List<LinkedHashMap> selectBankByUserId(Integer userid)
    {
        return mapper.selectBankByUserId(userid);
    }
}
