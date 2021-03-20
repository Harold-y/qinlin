package org.qinlin.service;

import org.qinlin.dao.mapper.FounderMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;

@Service
public class FounderService {
    @Resource
    FounderMapper mapper;

    public List<LinkedHashMap> selectFounderByCoinId(Integer coinid)
    {
        List<LinkedHashMap> list = mapper.selectFounderByCoinId(coinid);
        for(LinkedHashMap map : list)
        {
            map.put("imgSrc","/static/img/founder/"+map.get("founderid")+".jpg");
        }
        return list;
    }
}
