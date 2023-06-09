package cn.edu.nuc.ssm.service.interfaces;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Emp;

public interface EmpService {
	
	/**保存公司的信息
	 * @param emp
	 * @return
	 */
	int saveEmp(Emp emp);
	
	/**列出所有的公司的信息
	 * @param current
	 * @param truename
	 * @return
	 */
	PageInfo listAll(int current,String truename);
	
	
	/**更新雇员的信息
	 * @param emp
	 * @return
	 */
	int update(Emp emp);
	
	/**通过id查找某一个公司的信息
	 * @param id
	 * @return
	 */
	Emp findbyid(int id);
	
	int delete(Emp emp);

}
