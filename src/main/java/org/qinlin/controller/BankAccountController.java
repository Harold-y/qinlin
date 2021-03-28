package org.qinlin.controller;

import org.qinlin.entity.BankAccount;
import org.qinlin.service.BankAccountService;
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
@RequestMapping("bankAccountController")
public class BankAccountController {
    @Resource
    BankAccountService service;

    @RequestMapping("transferIn")
    @ResponseBody
    public int transferIn(Integer userid, Integer bankid, String bankaccount, double amount)
    {
        bankaccount = bankaccount.trim();
        return service.transferIn(userid, bankid, bankaccount, amount);
    }

    @RequestMapping("transferOut")
    @ResponseBody
    public int transferOut(Integer userid, Integer bankid, String bankaccount, double amount)
    {
        bankaccount = bankaccount.trim();
        return service.transferOut(userid, bankid, bankaccount, amount);
    }

    @RequestMapping("selectBankByUserId")
    @ResponseBody
    public List<LinkedHashMap> selectBankByUserId(Integer userid)
    {
        List<LinkedHashMap> listHashMap = service.selectBankByUserId(userid);
        for(LinkedHashMap map : listHashMap)
        {
            if(map!=null)
            {
                Integer id = (Integer) map.get("bankid");
                String imgSrc = "/static/img/bank/"+id+".jpg";
                map.put("imgSrc",imgSrc);
            }
        }
        return listHashMap;
    }

    @RequestMapping("insert")
    @ResponseBody
    public int insert(BankAccount account)
    {
        return service.insert(account);
    }
    @RequestMapping("deleteByPrimaryKey")
    @ResponseBody
    public int deleteByPrimaryKey(Integer id)
    {
        return service.deleteByPrimaryKey(id);
    }
}
