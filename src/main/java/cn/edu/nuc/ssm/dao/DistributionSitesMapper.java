package cn.edu.nuc.ssm.dao;

import cn.edu.nuc.ssm.entity.TDistributionSite;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DistributionSitesMapper {


    List<TDistributionSite> listWithPage(@Param("start") int start, @Param("offset")int offset, @Param("distributionSiteName")String name);

    int count(@Param("distributionSiteName")String name);

    int insert(TDistributionSite data);

    TDistributionSite selectById(String id);

    int update(TDistributionSite data);

    int deleteById(String id);
}
