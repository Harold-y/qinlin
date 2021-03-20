package org.qinlin.dao.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.qinlin.entity.Founder;

import java.util.LinkedHashMap;
import java.util.List;

@Mapper
public interface FounderMapper {
    int deleteByPrimaryKey(Integer founderid);

    int insert(Founder record);

    int insertSelective(Founder record);

    Founder selectByPrimaryKey(Integer founderid);

    int updateByPrimaryKeySelective(Founder record);

    int updateByPrimaryKey(Founder record);

    @Select("select founderid, founder_name, intro, position from founder where coinid = #{coinid}")
    List<LinkedHashMap> selectFounderByCoinId(Integer coinid);
}