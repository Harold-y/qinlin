package org.qinlin.controller;

import org.qinlin.service.CapitalAccountService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;

@Controller
@RequestMapping("capitalAccountController")
public class CapitalAccountController {
    @Resource
    CapitalAccountService service;

    @RequestMapping("transferIn")
    @ResponseBody
    public int transferIn(Integer userid, Integer coinid, double amount)
    {
        return service.transferIn(userid, coinid, amount);
    }

    @RequestMapping("transferOut")
    @ResponseBody
    public int transferOut(Integer userid, Integer coinid, double amount)
    {
        return service.transferOut(userid, coinid, amount);
    }

    @RequestMapping("selectAmountById")
    @ResponseBody
    public double selectAmountById(Integer userid, Integer coinid)
    {
        return service.selectAmountById(userid, coinid);
    }
    @RequestMapping("selectAllCoinByUserId")
    @ResponseBody
    public List<LinkedHashMap> selectAllCoinByUserId(Integer userid)
    {
        return service.selectAllCoinByUserId(userid);
    }
    @RequestMapping("transferIntoTradeAccount")
    @ResponseBody
    public int transferIntoTradeAccount(Integer userid, Integer coinid, Double amount)
    {
        return service.transferIntoTradeAccount(userid, coinid, amount);
    }
}
