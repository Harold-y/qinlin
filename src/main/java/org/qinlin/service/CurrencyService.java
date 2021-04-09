package org.qinlin.service;

import org.qinlin.dao.mapper.InternationalCurrencyMapper;
import org.qinlin.entity.InternationalCurrency;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;

@Service
public class CurrencyService {
    @Resource
    InternationalCurrencyMapper mapper;

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public LinkedHashMap selectCurrencyById(Integer currencyid)
    {
        return mapper.selectCurrencyById(currencyid);
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public List<LinkedHashMap> selectAllCurrency()
    {
        return mapper.selectAllCurrency();
    }
}
