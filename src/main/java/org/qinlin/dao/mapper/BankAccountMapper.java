package org.qinlin.dao.mapper;

import org.apache.ibatis.annotations.*;
import org.qinlin.entity.BankAccount;
import org.qinlin.entity.CapitalAccount;

import java.util.LinkedHashMap;
import java.util.List;

@Mapper
public interface BankAccountMapper {
    @Delete("delete from bank_account where id = #{id}")
    int deleteByPrimaryKey(Integer id);

    @Insert("insert into bank_account (userid, bankid, bankaccount, checkingaccount) values (#{userid}, #{bankid}, #{bankaccount},#{checkingaccount})")
    int insert(BankAccount record);

    int insertSelective(BankAccount record);

    BankAccount selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BankAccount record);

    int updateByPrimaryKey(BankAccount record);

    @Select("select checkingaccount from bank_account where userid = #{userid} and bankid = #{bankid} and bankaccount = #{bankaccount}")
    double selectCheckingAccountById(Integer userid, Integer bankid, String bankaccount);

    @Update("update bank_account set checkingaccount = #{checkingaccount} where userid = #{userid} and bankid = #{bankid} and bankaccount=#{bankaccount}")
    int update(BankAccount account);

    @Select("select bank_account.id, bank_account.bankid, bankaccount, bank_cn_name, bank_eng_name, bank_abbre_name,checkingaccount from bank, bank_account " +
            "where userid = #{userid} and bank.bankid = bank_account.bankid")
    List<LinkedHashMap> selectBankByUserId(Integer userid);

}