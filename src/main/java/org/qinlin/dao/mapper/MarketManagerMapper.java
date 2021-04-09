package org.qinlin.dao.mapper;

import org.qinlin.entity.MarketManager;

public interface MarketManagerMapper {
    int deleteByPrimaryKey(Integer managerid);

    int insert(MarketManager record);

    int insertSelective(MarketManager record);

    MarketManager selectByPrimaryKey(Integer managerid);

    int updateByPrimaryKeySelective(MarketManager record);

    int updateByPrimaryKey(MarketManager record);
}