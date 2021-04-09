package org.qinlin.dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.qinlin.entity.Settlement;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

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

    @Select("select count(*) from settlement where coinid = #{coinid} and userid = #{userid} " +
            " and UNIX_TIMESTAMP(settle_time) >= UNIX_TIMESTAMP(#{startTime}) and UNIX_TIMESTAMP(settle_time) <= UNIX_TIMESTAMP(#{endTime})" +
            " ")
    int queryInfoByIdCount(Integer userid, Integer coinid, String startTime, String endTime);

    @Select("select settlementid, amount, settle_time, total_charge,type,service_charge_usd from settlement where coinid = #{coinid} and userid = #{userid}" +
            " and UNIX_TIMESTAMP(settle_time) >= UNIX_TIMESTAMP(#{startTime}) and UNIX_TIMESTAMP(settle_time) <= UNIX_TIMESTAMP(#{endTime})" +
            " order by settlementid limit #{startIndex}, #{endIndex}")
    List<LinkedHashMap> queryInfoById(Integer userid, Integer coinid, String startTime, String endTime, Integer startIndex, Integer endIndex);
}