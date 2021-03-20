package org.qinlin.dao.mapper;

import org.qinlin.entity.HangBuy;

public interface HangBuyMapper {
    int deleteByPrimaryKey(Integer orderid);

    int insert(HangBuy record);

    int insertSelective(HangBuy record);

    HangBuy selectByPrimaryKey(Integer orderid);

    int updateByPrimaryKeySelective(HangBuy record);

    int updateByPrimaryKey(HangBuy record);
}