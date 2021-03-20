package org.qinlin.dao.mapper;

import org.qinlin.entity.HangSell;

public interface HangSellMapper {
    int deleteByPrimaryKey(Integer orderid);

    int insert(HangSell record);

    int insertSelective(HangSell record);

    HangSell selectByPrimaryKey(Integer orderid);

    int updateByPrimaryKeySelective(HangSell record);

    int updateByPrimaryKey(HangSell record);
}