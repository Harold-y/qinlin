package org.qinlin.controller;

import org.qinlin.service.TradeAccountService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;

@Controller
@RequestMapping("tradeAccountController")
public class TradeAccountController {
    @Resource
    TradeAccountService service;

    @RequestMapping("selectAllCoinByUserId")
    @ResponseBody
    public List<LinkedHashMap> selectAllCoinByUserId(Integer userid)
    {
        return service.selectAllCoinByUserId(userid);
    }
    @RequestMapping("selectAmountById")
    @ResponseBody
    public double selectAmountById(Integer userid, Integer coinid)
    {
        return service.selectAmountById(userid, coinid);
    }
    @RequestMapping("transferIntoCapitalAccount")
    @ResponseBody
    public int transferIntoCapitalAccount(Integer userid, Integer coinid, Double amount)
    {
        return service.transferIntoCapitalAccount(userid, coinid, amount);
    }
}
