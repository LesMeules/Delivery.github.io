package cn.edu.nuc.ssm.service;

import cn.edu.nuc.ssm.dao.LogisticsLogMapper;
import cn.edu.nuc.ssm.entity.Logistics;
import cn.edu.nuc.ssm.entity.LogisticsLog;
import cn.edu.nuc.ssm.entity.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogisticsLogServcie {
    @Autowired
    LogisticsLogMapper logisticsLogMapper;

    public Long insert(LogisticsLog logisticsLog) {
        return logisticsLogMapper.insert(logisticsLog);
    }

    public PageInfo listWithPage(int current, String number) {
        int count = logisticsLogMapper.count(number);
        PageInfo pageInfo = new PageInfo();
        pageInfo.setCount(count);
        pageInfo.setCurrent(current);
        List<LogisticsLog> list = logisticsLogMapper.listWithPage(pageInfo.getStart(), pageInfo.getOffset(), number);
        pageInfo.setList(list);
        return pageInfo;
    }
}
