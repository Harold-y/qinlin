package org.qinlin.controller;

import org.qinlin.entity.User;
import org.qinlin.service.UserService;
import org.qinlin.util.AESUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.UUID;

@Controller
@RequestMapping("userController")
public class UserController {
    @Resource
    UserService service;

    @RequestMapping("insert")
    @ResponseBody
    public int insertIntoUser(User user)
    {
        return service.insert(user);
    }

    @RequestMapping("login")
    @ResponseBody
    public boolean login(String email, String password, HttpSession session)
    {
        return service.login(email, password, session);
    }

    @RequestMapping("removeSession")
    @ResponseBody
    public int removeSession(HttpSession session)
    {
        session.invalidate();
        return 1;
    }
}
