package org.qinlin.controller;

import org.qinlin.entity.Settlement;
import org.qinlin.service.SettlementService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("settlementController")
public class SettlementController {
    @Resource
    SettlementService service;

    @RequestMapping("buy")
    @ResponseBody
    public int buy(Settlement record)
    {
        return service.buy(record);
    }

    @RequestMapping("sell")
    @ResponseBody
    public int sell(Settlement record)
    {
        return service.sell(record);
    }
}
