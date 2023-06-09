package cn.edu.nuc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nuc.ssm.dao.EmpMapper;
import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Emp;
import cn.edu.nuc.ssm.service.interfaces.EmpService;

@Service
public class EmpServiceImpl implements EmpService {

	@Autowired
	private EmpMapper empMapper;

	@Override
	public int saveEmp(Emp emp) {

		return empMapper.insert(emp);
	}

	@Override
	public PageInfo listAll(int current, String truename) {

		PageInfo pInfo = new PageInfo(current);
		int count = empMapper.count(truename);
		pInfo.setCount(count);
		List<Emp> list = empMapper.selectAll(truename, pInfo.getStart(), pInfo.getOffset());

		pInfo.setList(list);

		return pInfo;
	}

	@Override
	public int update(Emp emp) {

		return empMapper.updateByPrimaryKey(emp);
	}

	@Override
	public Emp findbyid(int id) {

		return empMapper.selectByPrimaryKey(id);
	}

	@Override
	public int delete(Emp emp) {

		return empMapper.deleteByPrimaryKey(emp.getId());
	}

}
