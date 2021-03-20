package org.qinlin.controller;

import org.qinlin.entity.Coin;
import org.qinlin.service.CoinService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;

@Controller
@RequestMapping("coinController")
public class CoinController {
    @Resource
    CoinService service;

    @RequestMapping("queryAllPartial")
    @ResponseBody
    public List<LinkedHashMap> selectAllCoinPartialInfo()
    {
        return service.selectAllCoinPartialInfo();
    }

    @RequestMapping("queryCompleteInfoById")
    @ResponseBody
    public LinkedHashMap queryCompleteInfoById(Integer coinid)
    {
        return service.selectAllCoinCompleteInfo(coinid);
    }
}
