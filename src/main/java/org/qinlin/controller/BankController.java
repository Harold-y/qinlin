package org.qinlin.controller;

import org.qinlin.entity.Bank;
import org.qinlin.service.BankService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("bankController")
public class BankController {

    @Resource
    BankService service;

    @RequestMapping("queryAllBanks")
    @ResponseBody
    public List<Bank> selectAllBankInfo()
    {
        return service.selectAllBankInfo();
    }

    @RequestMapping("determineBank")
    @ResponseBody
    public int determineBankIdByCardNumber(String firstSixNumbers)
    {
        if(firstSixNumbers.equals("195523"))
            return 1;
        if(firstSixNumbers.equals("122500") || firstSixNumbers.equals("919707"))
            return 2;
        if(firstSixNumbers.equals("909200"))
            return 3;
        if(firstSixNumbers.equals("203177"))
            return 4;
        return -1;
    }
}
