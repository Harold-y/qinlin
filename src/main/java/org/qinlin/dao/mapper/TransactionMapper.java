package org.qinlin.dao.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.qinlin.entity.Transaction;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

@Mapper
public interface TransactionMapper {
    int deleteByPrimaryKey(Integer transactionid);

    int insert(Transaction record);

    int insertSelective(Transaction record);

    Transaction selectByPrimaryKey(Integer transactionid);

    int updateByPrimaryKeySelective(Transaction record);

    int updateByPrimaryKey(Transaction record);

    @Select("select transactionid, amount, transaction_time, total_charge, buyerid, sellerid from transaction where coinid = #{coinid} and (buyerid = #{userid} or sellerid = #{userid})" +
            " and UNIX_TIMESTAMP(transaction_time) >= UNIX_TIMESTAMP(#{startTime}) and UNIX_TIMESTAMP(transaction_time) <= UNIX_TIMESTAMP(#{endTime})" +
            " order by transactionid limit #{startIndex}, #{endIndex}")
    List<LinkedHashMap> queryInfoById(Integer userid, Integer coinid, String startTime, String endTime, Integer startIndex, Integer endIndex);

    @Select("select count(*) from transaction where coinid = #{coinid} and (buyerid = #{userid} or sellerid = #{userid})" +
            " and UNIX_TIMESTAMP(transaction_time) >= UNIX_TIMESTAMP(#{startTime}) and UNIX_TIMESTAMP(transaction_time) <= UNIX_TIMESTAMP(#{endTime})" +
            " ")
    int queryInfoByIdCount(Integer userid, Integer coinid, String startTime, String endTime);
}