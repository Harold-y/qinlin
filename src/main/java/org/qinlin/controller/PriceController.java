package org.qinlin.controller;

import org.qinlin.service.PriceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("priceController")
public class PriceController {
    @Resource
    PriceService service;

    @RequestMapping("selectPriceById")
    @ResponseBody
    public double selectPriceById(Integer id)
    {
        return service.selectPriceById(id);
    }
}
