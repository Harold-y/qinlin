package org.qinlin.dao.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.qinlin.entity.Bank;

import java.util.LinkedHashMap;

@Mapper
public interface BankMapper {
    int deleteByPrimaryKey(Integer bankid);

    int insert(Bank record);

    int insertSelective(Bank record);

    Bank selectByPrimaryKey(Integer bankid);

    int updateByPrimaryKeySelective(Bank record);

    int updateByPrimaryKey(Bank record);

    @Select("select bank_cn_name, bank_eng_name, bank_abbre_name from bank where bankid = #{bankid}")
    LinkedHashMap selectBankByBankId(Integer bankid);
}