package org.qinlin.controller;

import org.qinlin.entity.InternationalCurrency;
import org.qinlin.service.CurrencyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;

@Controller
@RequestMapping("currencyController")
public class CurrencyController {
    @Resource
    CurrencyService service;

    @RequestMapping("queryById")
    @ResponseBody
    LinkedHashMap selectCurrencyById(Integer currencyid)
    {
        return service.selectCurrencyById(currencyid);
    }
    @RequestMapping("selectAllCurrency")
    @ResponseBody
    public List<LinkedHashMap> selectAllCurrency()
    {
        return service.selectAllCurrency();
    }
}
