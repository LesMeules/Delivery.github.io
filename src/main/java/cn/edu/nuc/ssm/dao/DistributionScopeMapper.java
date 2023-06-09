package cn.edu.nuc.ssm.dao;

import cn.edu.nuc.ssm.entity.TDistributionScope;
import cn.edu.nuc.ssm.entity.TDistributionSite;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DistributionScopeMapper extends BaseMapper<TDistributionScope> {

    List<TDistributionScope> listwithpage(@Param("start") int start, @Param("offset")int offset, @Param("distributionSiteName")String name);

    int count(@Param("distributionScopeName") String name);
}
