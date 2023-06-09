package cn.edu.nuc.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.nuc.ssm.entity.Sysuser;

public interface sysuserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(Sysuser record);

    int insertSelective(Sysuser record);

    Sysuser selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(Sysuser record);

    int updateByPrimaryKey(Sysuser record);

	/**用户登录
	 * @param username 用户名
	 * @param userpwd 用户密码
	 * @return sysuser
	 */
	Sysuser login(@Param("username")String username, @Param("userpwd") String userpwd);

	
	/**列出所有的用户，除了超级管理员
	 * @param model
	 * @return
	 */
	List<Sysuser> selectAllUser();

	/**查看用户名是否重复
	 * @param username 用户名
	 * @return
	 */
	Sysuser findbyusername(String username);

	/** 根据用户名查看用户信息
	 * @param username 用户名
	 * @return
	 */
	List<Sysuser> searchbyusername(String username);


	Sysuser selectByUsername(String username);

	int epdateEmp(Sysuser sysuser);
}