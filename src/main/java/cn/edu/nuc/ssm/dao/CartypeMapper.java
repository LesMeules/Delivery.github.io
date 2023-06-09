package cn.edu.nuc.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.nuc.ssm.entity.Cartype;

public interface CartypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Cartype record);

    int insertSelective(Cartype record);

    Cartype selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Cartype record);

    int updateByPrimaryKey(Cartype record);

	

	

	/**按车型类型统计该车型的数量
	 * @param carType 车型
	 * @return
	 */
	int count(@Param("carType")String carType);

	/**
	 * @param start 开始的位置
	 * @param offset 依傍偏移量
	 * @param carType 车型
	 * @return list
	 */
	List<Cartype> findByCidPage(@Param("start")int start,@Param("offset") int offset,@Param("carType") String carType);

	/**通过id查找
	 * @param id 要查找的id
	 * @return
	 */
	Cartype findByCid(int id);

	/**列出所有的车型
	 * @return
	 */
	List<Cartype> listAll();
}