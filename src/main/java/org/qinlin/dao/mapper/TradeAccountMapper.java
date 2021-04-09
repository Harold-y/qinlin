package org.qinlin.dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.qinlin.entity.CapitalAccount;
import org.qinlin.entity.TradeAccount;

import java.util.LinkedHashMap;
import java.util.List;

@Mapper
public interface TradeAccountMapper {
    int deleteByPrimaryKey(Integer accountid);

    int insert(TradeAccount record);

    int insertSelective(TradeAccount record);

    TradeAccount selectByPrimaryKey(Integer accountid);

    int updateByPrimaryKeySelective(TradeAccount record);

    int updateByPrimaryKey(TradeAccount record);

    @Select("select count(*) from trade_account where userid = #{userid} and coinid = #{coinid}")
    int checkIfExist(Integer userid, Integer coinid);

    @Select("select amount from trade_account where userid = #{userid} and coinid = #{coinid}")
    double selectAmountById(Integer userid, Integer coinid);

    @Insert("insert into trade_account (userid, coinid, amount) values (#{userid}, #{coinid}, #{amount})")
    int transferInCreate(TradeAccount account);

    @Select("select accountid, coinid, amount from trade_account where userid = #{userid}")
    List<LinkedHashMap> selectAllCoinByUserId(Integer userid);

    @Update("update trade_account set amount = (amount+(#{amount})) where userid=#{userid} and coinid=#{coinid}")
    int transferWithCapitalAccount(Integer userid, Integer coinid, Double amount);
}