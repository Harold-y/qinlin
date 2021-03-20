package org.qinlin.service;

import org.qinlin.dao.mapper.UserMapper;
import org.qinlin.entity.User;
import org.qinlin.util.AESUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class UserService {
    @Autowired
    UserMapper mapper;

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public List<User> selectAllUsers()
    {
        return null;
    }

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int insert(User record)
    {
        if(record.getUsername() == null || record.getEmail() == null || record.getPassword() == null)
            return -1;
        String uuid = UUID.randomUUID().toString();
        record.setUuid(uuid);
        String encrypted = AESUtils.aesEncryptStr(record.getPassword(), AESUtils.getPkey());
        record.setPassword(encrypted);
        record.setTimecreated(new Date());
        return mapper.insert(record);
    }

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public boolean login(String email, String password, HttpSession session)
    {
        String encrypted = AESUtils.aesEncryptStr(password, AESUtils.getPkey());
        if(mapper.login(email, encrypted) == 1)
        {
            User user = mapper.selectByPrimaryKey(mapper.checkUserId(email, encrypted));
            session.setAttribute("userid", user.getUserid());
            session.setAttribute("username", user.getUsername());
            session.setAttribute("uuid", user.getUuid());
            session.setAttribute("userEntity", user);
            return true;
        }else
        {
            return false;
        }
    }


}
