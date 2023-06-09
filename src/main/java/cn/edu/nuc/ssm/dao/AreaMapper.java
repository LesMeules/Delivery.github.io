package cn.edu.nuc.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.nuc.ssm.entity.Area;

public interface AreaMapper {

	int deleteByPrimaryKey(Integer id);

	int deleteByParentId(Integer id);

	int insert(Area record);

	int insertSelective(Area record);

	Area selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Area record);

	int updateByPrimaryKey(Area record);

	List<Area> findByAid(@Param("start") int start, @Param("offset") int offset, @Param("areaName") String areaName);

	/**
	 * 查看省的数量
	 * 
	 * @return
	 */
	int count(@Param("areaName") String areaName);

	/**
	 * 列出一个省的子地域
	 * 
	 * @param aid
	 * @return list
	 */
	List<Area> sublist(@Param("aid") int aid);

	/**
	 * 保存省
	 * 
	 * @param area
	 * @return
	 */
	int savepro(Area area);

	List<Area> searchlist(@Param("areaName") String areaName, @Param("start") int start, @Param("offset") int offset);

	/**
	 * 保存市
	 * 
	 * @param area
	 * @return
	 */
	int savecity(Area area);

	List<Area> listAll();

}