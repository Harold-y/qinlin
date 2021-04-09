package org.qinlin.dao.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.qinlin.entity.InternationalCurrency;

import java.util.LinkedHashMap;
import java.util.List;

@Mapper
public interface InternationalCurrencyMapper {
    int deleteByPrimaryKey(Integer currencyid);

    int insert(InternationalCurrency record);

    int insertSelective(InternationalCurrency record);

    InternationalCurrency selectByPrimaryKey(Integer currencyid);

    int updateByPrimaryKeySelective(InternationalCurrency record);

    int updateByPrimaryKey(InternationalCurrency record);

    @Select("select currency_eng_name, currency_cn_name, currency_abbre_name, exchangerate_usd from international_currency where currencyid = #{currencyid}")
    LinkedHashMap selectCurrencyById(Integer currencyid);

    @Select("select currencyid, currency_eng_name, currency_cn_name, currency_abbre_name, exchangerate_usd from international_currency")
    List<LinkedHashMap> selectAllCurrency();
}