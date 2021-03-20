package org.qinlin.dao.mapper;

import org.qinlin.entity.TradeAccount;

public interface TradeAccountMapper {
    int deleteByPrimaryKey(Integer accountid);

    int insert(TradeAccount record);

    int insertSelective(TradeAccount record);

    TradeAccount selectByPrimaryKey(Integer accountid);

    int updateByPrimaryKeySelective(TradeAccount record);

    int updateByPrimaryKey(TradeAccount record);
}