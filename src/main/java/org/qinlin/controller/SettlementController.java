package org.qinlin.controller;

import org.qinlin.entity.Settlement;
import org.qinlin.service.SettlementService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

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

    @RequestMapping("queryInfoByIdCount")
    @ResponseBody
    public int queryInfoByIdCount(Integer userid, Integer coinid, String startTime, String endTime)
    {
        return service.queryInfoByIdCount(userid, coinid, startTime, endTime);
    }
    @RequestMapping("queryInfoById")
    @ResponseBody
    public List<LinkedHashMap> queryInfoById(Integer userid, Integer coinid, String startTime, String endTime, Integer startIndex, Integer endIndex)
    {
        return service.queryInfoById(userid, coinid, startTime, endTime, startIndex, endIndex);
    }
}
