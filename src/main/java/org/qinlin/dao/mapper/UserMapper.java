package org.qinlin.dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.qinlin.entity.User;

@Mapper
public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    @Insert("insert into user (username, phone, email, password, realname, uuid, timecreated) values (#{username}, #{phone}, #{email}, #{password}," +
            "#{realname}, #{uuid}, #{timecreated})")
    int insert(User record);

    int insertSelective(User record);

    @Select("select userid, username, phone, email, password, realname, uuid, timecreated from user where userid = #{userid}")
    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    @Select("select count(*) from user where email = #{email} and password = #{password}")
    int login(String email, String password);

    @Select("select userid from user where email = #{email} and password = #{password}")
    int checkUserId(String email, String password);
}