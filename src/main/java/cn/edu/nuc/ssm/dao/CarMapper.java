package cn.edu.nuc.ssm.dao;

import java.util.List;

import cn.edu.nuc.ssm.entity.TCar;
import org.apache.ibatis.annotations.Param;

public interface CarMapper {
    int deleteByPrimaryKey(String id);

    int insert(TCar record);

    int insertSelective(TCar record);

    TCar selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(TCar record);

    int updateByPrimaryKey(TCar record);

	/**统计车辆的数目
	 * @param carName
	 * @return
	 */
	int count(String carName);

	
	/**
	 * 列出车辆信息，带分页功能，
	 * @param current 当前页
	 * @param start 开始的页面
	 * @param offset 偏移量
	 * @param carName 车名
	 * @return list
	 */
	List<TCar> listWithPage(@Param("current")int current, @Param("start")int start, @Param("offset")int offset, @Param("carOwner")String carName);

	Long updateNowStatus(String usertruename);
}