package org.qinlin.dao.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.qinlin.entity.Price;

@Mapper
public interface PriceMapper {
    int deleteByPrimaryKey(Integer priceid);

    int insert(Price record);

    int insertSelective(Price record);

    Price selectByPrimaryKey(Integer priceid);

    int updateByPrimaryKeySelective(Price record);

    int updateByPrimaryKey(Price record);

    @Select("select price_usd from price where coinid = #{coinid} limit 1")
    double selectPriceById(Integer coinid);

    double calculateVariation(Integer id);
}