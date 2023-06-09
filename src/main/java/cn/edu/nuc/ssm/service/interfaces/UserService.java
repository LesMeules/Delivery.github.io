package cn.edu.nuc.ssm.service.interfaces;

import java.util.List;

import cn.edu.nuc.ssm.entity.Sysuser;

public interface UserService {

	/**用户登录
	 * @param username 用户名
	 * @param userpwd 密码
	 * @return sysuser
	 */
	Sysuser login(String username, String userpwd);

	/**列出所有的用户，除了超级管理员
	 * @return
	 */
	List<Sysuser> selectAllUser();

	Sysuser selectByPrimaryKey(Integer userid);

	/** 更新用户信息
	 * @param sysuser
	 * @return
	 */
	int updateUser(Sysuser sysuser);

	/** 保存用户信息
	 * @param sysuser
	 * @return
	 */
	int saveuser(Sysuser sysuser);

	/** 查看用户名是否存在
	 * @param username 用户名
	 * @return sysuser
	 */
	Sysuser findbyusername(String username);

	/**根据用户id删除用户
	 * @param userid
	 * @return
	 */
	int delete(Integer userid);

	/** 根据用户名查看用户信息
	 * @param username 用户名
	 * @return
	 */
	List<Sysuser> searchbyusername(String username);


	Sysuser selectByUsername(String username);

	int updateEmp(Sysuser sysuser);
}
