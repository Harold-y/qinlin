package org.qinlin.controller;

import org.qinlin.service.TransactionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

@RequestMapping("transactionController")
@Controller
public class TransactionController {
    @Resource
    TransactionService service;

    @ResponseBody
    @RequestMapping("queryInfoByUserid")
    public List<LinkedHashMap> queryInfoById(Integer userid, Integer coinid, String startTime, String endTime, Integer startIndex, Integer endIndex)
    {
        return service.queryInfoById(userid, coinid, startTime, endTime, startIndex, endIndex);
    }
    @ResponseBody
    @RequestMapping("queryInfoByUseridCount")
    public int queryInfoByIdCount(Integer userid, Integer coinid, String startTime, String endTime)
    {
        return service.queryInfoByIdCount(userid, coinid, startTime, endTime);
    }
}
