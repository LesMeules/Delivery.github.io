package cn.edu.nuc.ssm.service.interfaces;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.TDistributionScope;
import com.baomidou.mybatisplus.extension.service.IService;

public interface DistributionScopeService extends IService<TDistributionScope> {
    PageInfo listWithPage(Integer current, String name);
}
