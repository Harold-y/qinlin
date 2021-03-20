package org.qinlin.dao.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.qinlin.entity.Statistics;

import java.util.*;

@Mapper
public interface StatisticsMapper {
    int deleteByPrimaryKey(Integer statid);

    int insert(Statistics record);

    int insertSelective(Statistics record);

    Statistics selectByPrimaryKey(Integer statid);

    int updateByPrimaryKeySelective(Statistics record);

    int updateByPrimaryKey(Statistics record);

    @Select("select price from statistics where coinid = #{id} order by stat_time DESC limit 1")
    double selectByCoinIdYesterday(Integer id);

    @Select("select highestPrice from statistics where coinid = #{id} order by stat_time DESC limit 1")
    double selectHighestPriceById(Integer id);

    @Select("select tradeAmount from statistics where coinid = #{id} order by stat_time DESC limit 1")
    double selectTradeAmountById(Integer id);

    @Select("select price from statistics where coinid = #{id} and date_sub(CURDATE(),INTERVAL 7 DAY) <= DATE(stat_time)")
    List<Double> selectWeekPrice(Integer id);

    @Select("select stat_time from statistics where coinid = #{id} and date_sub(CURDATE(),INTERVAL 7 DAY) <= DATE(stat_time)")
    List<Date> selectDate(Integer id);

    @Select("select price,stat_time from statistics where coinid = #{id} and date_sub(CURDATE(),INTERVAL 7 DAY) <= DATE(stat_time)")
    List<LinkedHashMap> selectWeekPriceList(Integer id);
}