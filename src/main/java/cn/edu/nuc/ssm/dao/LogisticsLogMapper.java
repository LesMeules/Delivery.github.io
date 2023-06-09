package cn.edu.nuc.ssm.dao;

import cn.edu.nuc.ssm.entity.LogisticsLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LogisticsLogMapper {
    /**
     * 物流信息插入
     * @param logisticsLog
     * @return
     */
    Long insert(LogisticsLog logisticsLog);

    int count(@Param("lNumber")String number);

    List<LogisticsLog> listWithPage(@Param("start") int start, @Param("offset") int offset, @Param("lNumber") String number);
}
