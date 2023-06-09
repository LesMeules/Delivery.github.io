package cn.edu.nuc.ssm.service.interfaces;


import java.util.List;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Cartype;

public interface CartypeService {

	
	
	
	/**列出车型信息
	 * @param current 当前页
	 * @param cartype 要搜索的车型的信息
	 * @return pageInfo
	 */
	PageInfo list(int current, String cartype);

	int savecartype(Cartype cartype);

	/**通过id查找车型
	 * @param id 要查找的id
	 * @return 车型
	 */
	Cartype findbyid(int id);

	/** 更新车型
	 * @param cartype
	 * @return
	 */
	int update(Cartype cartype);

	int delete(int id);

	/**列出所有的车型
	 * @return list
	 */
	List<Cartype> listAll();

}
