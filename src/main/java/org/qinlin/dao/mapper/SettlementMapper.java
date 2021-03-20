package org.qinlin.dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.qinlin.entity.Settlement;

@Mapper
public interface SettlementMapper {
    int deleteByPrimaryKey(Integer settlementid);

    @Insert("insert into settlement ")
    int insert(Settlement record);

    int insertSelective(Settlement record);

    Settlement selectByPrimaryKey(Integer settlementid);

    int updateByPrimaryKeySelective(Settlement record);

    int updateByPrimaryKey(Settlement record);

    @Insert("insert into settlement (userid, coinid, amount, price, total_charge, service_charge_usd, settle_time, type)" +
            " values (#{userid}, #{coinid}, #{amount}, #{price}, #{totalCharge}, #{serviceChargeUsd}, #{settleTime}, 'buy')")
    int buy(Settlement record);

    @Insert("insert into settlement (userid, coinid, amount, price, total_charge, service_charge_usd, settle_time, type)" +
            " values (#{userid}, #{coinid}, #{amount}, #{price}, #{totalCharge}, #{serviceChargeUsd}, #{settleTime}, 'sell')")
    int sell(Settlement record);
}