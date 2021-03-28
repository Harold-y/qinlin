package org.qinlin.service;

import org.qinlin.dao.mapper.BankMapper;
import org.qinlin.entity.Bank;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BankService {
    @Resource
    BankMapper mapper;

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public List<Bank> selectAllBankInfo()
    {
        return mapper.selectAllBankInfo();
    }

}
