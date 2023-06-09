package cn.edu.nuc.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.nuc.ssm.entity.Goods;

public interface GoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);

	/**统计货物的数据
	 * @param goodsname 货物名称
	 * @return int
	 */
	int count(String goodsname);

	/**列出所有的货物，带分页
	 * @param start 开始页
	 * @param offset 偏移量
	 * @param goodsname 货物名称
	 * @return list
	 */
	List<Goods> listWidthPage(@Param("start")int start,@Param("offset") int offset,@Param("goodsname") String goodsname);
}