package cn.edu.nuc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nuc.ssm.dao.CartypeMapper;
import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Cartype;
import cn.edu.nuc.ssm.service.interfaces.CartypeService;

@Service
public class CartypeServiceImpl implements CartypeService {

	@Autowired
	private CartypeMapper cartypeMapper;

	@Override
	public PageInfo list(int current, String carType) {
		
		PageInfo pInfo = new PageInfo(current);
		
		int count = cartypeMapper.count(carType);
		pInfo.setCount(count);
		
		List<Cartype> list=cartypeMapper.findByCidPage(pInfo.getStart(),pInfo.getOffset(),carType);
		
		pInfo.setList(list);
		
		return pInfo;
	}

	@Override
	public int savecartype(Cartype cartype) {
		
		return cartypeMapper.insert(cartype);
	}

	@Override
	public Cartype findbyid(int id) {
		
		return cartypeMapper.findByCid(id);
	}

	@Override
	public int update(Cartype cartype) {
		
		return cartypeMapper.updateByPrimaryKey(cartype);
	}

	@Override
	public int delete(int id) {
		
		return cartypeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Cartype> listAll() {
		
		return cartypeMapper.listAll();
	}
	
	

	
	
}
