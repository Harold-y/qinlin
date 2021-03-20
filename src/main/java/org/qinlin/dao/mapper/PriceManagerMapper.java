package org.qinlin.dao.mapper;

import org.qinlin.entity.PriceManager;

public interface PriceManagerMapper {
    int deleteByPrimaryKey(Integer managerid);

    int insert(PriceManager record);

    int insertSelective(PriceManager record);

    PriceManager selectByPrimaryKey(Integer managerid);

    int updateByPrimaryKeySelective(PriceManager record);

    int updateByPrimaryKey(PriceManager record);
}