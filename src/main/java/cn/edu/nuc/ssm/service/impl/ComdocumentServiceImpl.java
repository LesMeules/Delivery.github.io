package cn.edu.nuc.ssm.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.edu.nuc.ssm.dao.ComdocumentMapper;
import cn.edu.nuc.ssm.entity.PageInfo;

import cn.edu.nuc.ssm.entity.Comdocument;



import cn.edu.nuc.ssm.service.interfaces.ComdocumentService;

@Service
public class ComdocumentServiceImpl implements ComdocumentService {

	@Autowired
	private ComdocumentMapper comdocumentMapper;
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return comdocumentMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Comdocument record) {
		// TODO Auto-generated method stub
		return comdocumentMapper.insert(record);
	}

	@Override
	public int insertSelective(Comdocument record) {
		// TODO Auto-generated method stub
		return comdocumentMapper.insertSelective(record);
	}

	@Override
	public Comdocument selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return comdocumentMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Comdocument record) {
		// TODO Auto-generated method stub
		return comdocumentMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Comdocument record) {
		// TODO Auto-generated method stub
		return comdocumentMapper.updateByPrimaryKey(record);
	}

	@Override
	public PageInfo selectPageComdocument(int current) {
		PageInfo pi = new PageInfo(current);
		int count = comdocumentMapper.selectCount();
		pi.setCount(count);
		List<Comdocument>  list = comdocumentMapper.selectPageComdocument(pi.getStart(), pi.getOffset());
		pi.setList(list);
		return pi;
	}

	@Override
	public List<Comdocument> selectBycid(int cid) {
		
		return comdocumentMapper.selectBycid(cid);
	}
}
