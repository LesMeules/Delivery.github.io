package cn.edu.nuc.ssm.service.interfaces;

import java.util.List;

import cn.edu.nuc.ssm.entity.Business;

public interface BusinessService {
	
	
	/**通过公司id查询公司的业务
	 * @param cid 公司的id
	 * @return 该公司的相关的业务列表
	 */
	List<Business> listbycid(int cid);
	
	
	/**保存业务
	 * @param business 业务对象
	 * @return 1 成功 ,0失败
	 */
	int savebusiness(Business business);
	
	
	/**根据id查询业务信息
	 * @param id 
	 * @return 1成功，2为失败
	 */
	Business selectByid(int id);
	
	
	/**根据业务id更新
	 * @param 业务
	 * @return 1成功 ， 0失败
	 */
	int update(Business business);
	
	
	/**根据id删除业务
	 * @param id 业务id
	 * @return 1成功，0失败
	 */
	int deletebyid(int id);

}
