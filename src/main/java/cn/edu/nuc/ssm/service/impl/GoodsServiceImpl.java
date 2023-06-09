package cn.edu.nuc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nuc.ssm.dao.GoodsMapper;
import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Goods;
import cn.edu.nuc.ssm.service.interfaces.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsMapper goodsMapper;

	@Override
	public int savegoods(Goods goods) {
		
		return goodsMapper.insert(goods);
	}

	@Override
	public PageInfo listPage(int current, String goodsname) {
		
		int count = goodsMapper.count(goodsname);
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setCurrent(current);
		pageInfo.setCount(count);
		
		List<Goods> list = goodsMapper.listWidthPage(pageInfo.getStart(),pageInfo.getOffset(),goodsname);
		
		pageInfo.setList(list);
		
		return pageInfo;
	}

	@Override
	public int delete(int id) {
		
		return goodsMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Goods findbyid(int id) {
		
		return goodsMapper.selectByPrimaryKey(id);
	}

	@Override
	public int update(Goods goods) {
		
		return goodsMapper.updateByPrimaryKey(goods);
	}
	
	
}
