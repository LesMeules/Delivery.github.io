package cn.edu.nuc.ssm.service.impl;

import cn.edu.nuc.ssm.dao.DistributionScopeMapper;
import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.TDistributionScope;
import cn.edu.nuc.ssm.entity.TDistributionSite;
import cn.edu.nuc.ssm.service.interfaces.DistributionScopeService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DistributionScopeServiceImpl extends ServiceImpl<DistributionScopeMapper, TDistributionScope> implements DistributionScopeService {

    @Override
    public PageInfo listWithPage(Integer current, String name) {
        int count = this.baseMapper.count(name);
        PageInfo pageInfo = new PageInfo();
        pageInfo.setCount(count);
        pageInfo.setCurrent(current);

        List<TDistributionScope> list = this.baseMapper.listwithpage(pageInfo.getStart(), pageInfo.getOffset(), name);

        pageInfo.setList(list);

        return pageInfo;
    }
}
