package cn.edu.nuc.ssm.dao;

import cn.edu.nuc.ssm.entity.Logistics;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LogisticsMapper {

    int count(@Param("lNumber") String name);

    List<Logistics> listWithPage(@Param("start") int start, @Param("offset") int offset,@Param("lNumber") String name);

    Long update2(Logistics logistics);

    Logistics queryBylNumber(String lNumber);

    Long updateAddressLogistics(Logistics logistics);

    Long update3(Logistics logistics);

    Long update4(Logistics logistics);

    Long doneOrder(String lNumber);

    List<Logistics> getDoneOrder(@Param("start") int start, @Param("offset") int offset, @Param("lNumber") String name);

    int count1(String lNumber);
}
