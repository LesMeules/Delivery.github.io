package cn.edu.nuc.ssm.service;

import cn.edu.nuc.ssm.entity.Logistics;
import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.dao.LogisticsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogisticsService {

    @Autowired
    LogisticsMapper logisticsMapper;

    public PageInfo getDoneOrder(int current,String lNumber) {
        int count = logisticsMapper.count1(lNumber);
        PageInfo pageInfo = new PageInfo();
        pageInfo.setCount(count);
        pageInfo.setCurrent(current);
        List<Logistics> list = logisticsMapper.getDoneOrder(pageInfo.getStart(), pageInfo.getOffset(),lNumber);
        pageInfo.setList(list);
        return pageInfo;
    }
    public PageInfo listWithPage(int current, String name) {
        int count = logisticsMapper.count(name);
        PageInfo pageInfo = new PageInfo();
        pageInfo.setCount(count);
        pageInfo.setCurrent(current);
        List<Logistics> list = logisticsMapper.listWithPage(pageInfo.getStart(), pageInfo.getOffset(), name);
        pageInfo.setList(list);
        return pageInfo;
    }

    public Long update2(Logistics logistics) {

        return logisticsMapper.update2(logistics);
    }

    public Logistics query(String lNumber) {
        return logisticsMapper.queryBylNumber(lNumber);
    }

    public Long updateAddressLogistics(Logistics logistics) {
        return logisticsMapper.updateAddressLogistics(logistics);
    }

    public Long update3(Logistics logistics) {
        return logisticsMapper.update3(logistics);
    }

    public Long update4(Logistics logistics) {
        return logisticsMapper.update4(logistics);
    }

    public Long doneOrder(String lNumber) {
        return logisticsMapper.doneOrder(lNumber);
    }



    public PageInfo listWithPageDone(int current, String lNumber) {
        return null;
    }
}
