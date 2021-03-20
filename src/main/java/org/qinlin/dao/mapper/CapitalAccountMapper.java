package org.qinlin.dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.qinlin.entity.CapitalAccount;

@Mapper
public interface CapitalAccountMapper {
    int deleteByPrimaryKey(Integer accountid);

    int insert(CapitalAccount record);

    int insertSelective(CapitalAccount record);

    CapitalAccount selectByPrimaryKey(Integer accountid);

    int updateByPrimaryKeySelective(CapitalAccount record);

    int updateByPrimaryKey(CapitalAccount record);

    @Select("select count(*) from capital_account where userid = #{userid} and coinid = #{coinid}")
    int checkIfExist(Integer userid, Integer coinid);

    @Select("select amount from capital_account where userid = #{userid} and coinid = #{coinid}")
    double selectAmountById(Integer userid, Integer coinid);

    @Update("update capital_account set amount = #{amount} where userid = #{userid} and coinid = #{coinid}")
    int update(CapitalAccount account);

    @Insert("insert into capital_account (userid, coinid, amount) values (#{userid}, #{coinid}, #{amount})")
    int transferInCreate(CapitalAccount account);

}