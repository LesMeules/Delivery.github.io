package cn.edu.nuc.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.nuc.ssm.entity.Emp;

public interface EmpMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Emp record);

	int insertSelective(Emp record);

	Emp selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Emp record);

	int updateByPrimaryKey(Emp record);

	int count(@Param("truename") String truename);

	List<Emp> selectAll(@Param("truename") String truename, @Param("start") int start, @Param("offset") int offset);

}