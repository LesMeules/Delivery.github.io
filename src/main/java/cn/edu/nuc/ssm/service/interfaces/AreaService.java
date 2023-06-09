package cn.edu.nuc.ssm.service.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Area;

public interface AreaService {

	/**列出省
	 * @param current
	 * @return
	 */
	PageInfo list(int current,String areaName);
	
	
	/**通过省id列出市
	 * @param aid
	 * @return
	 */
	List<Area> sublist(@Param("aid") int aid);
	
	 /**保存省
     * @param area
     * @return
     */
    int savepro(Area area);


	/**保存市
	 * @param area
	 * @return
	 */
	int savecity(Area area);


	int updatepro(Area area);
	
	
	Area selectByid(int aid);


	int deletepro(Area area);

	List<Area> listAll();
	
}
