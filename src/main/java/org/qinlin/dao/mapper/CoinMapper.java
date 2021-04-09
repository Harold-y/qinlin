package org.qinlin.dao.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.qinlin.entity.Coin;

import java.util.LinkedHashMap;
import java.util.List;

@Mapper
public interface CoinMapper {
    int deleteByPrimaryKey(Integer coinid);

    int insert(Coin record);

    int insertSelective(Coin record);

    Coin selectByPrimaryKey(Integer coinid);

    int updateByPrimaryKeySelective(Coin record);

    int updateByPrimaryKey(Coin record);

    @Select("select coin.coinid, cn_name, eng_name, abbre_name from coin")
    List<LinkedHashMap> selectAllCoinPartialInfo();

    @Select("select coin.coinid, cn_name, eng_name, abbre_name, coin_intro, coin_rating from coin where coinid = #{coinid}")
    LinkedHashMap selectAllCoinCompleteInfo(Integer coinid);
}