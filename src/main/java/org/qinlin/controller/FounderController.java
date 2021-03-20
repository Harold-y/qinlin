package org.qinlin.controller;

import org.qinlin.service.FounderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;

@Controller
@RequestMapping("founderController")
public class FounderController {
    @Resource
    FounderService service;

    @RequestMapping("selectFounderByCoinId")
    @ResponseBody
    public List<LinkedHashMap> selectFounderByCoinId(Integer coinid)
    {
        return service.selectFounderByCoinId(coinid);
    }
}
