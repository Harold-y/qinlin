package org.qinlin.service;

import org.qinlin.dao.mapper.TransactionMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

@Service
public class TransactionService {
    @Resource
    TransactionMapper mapper;

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public List<LinkedHashMap> queryInfoById(Integer userid, Integer coinid, String startTime, String endTime, Integer startIndex, Integer endIndex)
    {
        return mapper.queryInfoById(userid, coinid, startTime, endTime, startIndex, endIndex);
    }

    public int queryInfoByIdCount(Integer userid, Integer coinid, String startTime, String endTime)
    {
        return mapper.queryInfoByIdCount(userid, coinid, startTime, endTime);
    }
}
