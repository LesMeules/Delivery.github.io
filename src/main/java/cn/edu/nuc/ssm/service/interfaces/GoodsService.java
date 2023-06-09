package cn.edu.nuc.ssm.service.interfaces;

import org.apache.ibatis.annotations.Param;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Goods;

public interface GoodsService {

	/**保存货物信息
	 * @param car
	 * @return
	 */
	int savegoods(Goods goods);

	/**列出货物名称
	 * @param current 当前页
	 * @param goodsname 货物名称
	 * @return
	 */
	PageInfo listPage(@Param("current")int current,@Param("goodsname") String goodsname);

	/**删除货物
	 * @param id 商品Id
	 * @return int
	 */
	int delete(int id);

	/**根据id查找商品
	 * @param id 商品id
	 * @return goods
	 */
	Goods findbyid(int id);

	/**
	 * @param goods
	 * @return
	 */
	int update(Goods goods);

	

}
