package cn.edu.nuc.ssm.service;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.TCar;
import cn.edu.nuc.ssm.entity.TDistributionSite;
import cn.edu.nuc.ssm.dao.DistributionSitesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DistributionSitesService {
    @Autowired
    DistributionSitesMapper distributionSitesMapper;

    public PageInfo listWithPage(Integer current, String name) {
        int count = distributionSitesMapper.count(name);
        PageInfo pageInfo = new PageInfo();
        pageInfo.setCount(count);
        pageInfo.setCurrent(current);

        List<TDistributionSite> list = distributionSitesMapper.listWithPage(pageInfo.getStart(), pageInfo.getOffset(), name);

        pageInfo.setList(list);

        return pageInfo;
    }

    public int insert(TDistributionSite data) {
        return distributionSitesMapper.insert(data);
    }

    public TDistributionSite selectById(String id) {
        return distributionSitesMapper.selectById(id);
    }

    public int update(TDistributionSite data) {
        return distributionSitesMapper.update(data);
    }

    public int delete(String id) {
        return distributionSitesMapper.deleteById(id);
    }
}
