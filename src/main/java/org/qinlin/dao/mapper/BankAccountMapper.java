package org.qinlin.dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.qinlin.entity.BankAccount;
import org.qinlin.entity.CapitalAccount;

import java.util.LinkedHashMap;
import java.util.List;

@Mapper
public interface BankAccountMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BankAccount record);

    int insertSelective(BankAccount record);

    BankAccount selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BankAccount record);

    int updateByPrimaryKey(BankAccount record);

    @Select("select checkingaccount from bank_account where userid = #{userid} and bankid = #{bankid} and bankaccount = #{bankaccount}")
    double selectCheckingAccountById(Integer userid, Integer bankid, String bankaccount);

    @Update("update bank_account set checkingaccount = #{checkingaccount} where userid = #{userid} and bankid = #{bankid} and bankaccount=#{bankaccount}")
    int update(BankAccount account);

    @Select("select bank_account.bankid, bankaccount, bank_cn_name, bank_eng_name, bank_abbre_name from bank, bank_account " +
            "where userid = #{userid} and bank.bankid = bank_account.bankid")
    List<LinkedHashMap> selectBankByUserId(Integer userid);

}