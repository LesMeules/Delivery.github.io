package cn.edu.nuc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nuc.ssm.dao.BusinessMapper;
import cn.edu.nuc.ssm.entity.Business;
import cn.edu.nuc.ssm.service.interfaces.BusinessService;

@Service
public class BusinessServiceImpl implements BusinessService {

	@Autowired
	private BusinessMapper businessMapper;

	@Override
	public List<Business> listbycid(int cid) {

		return businessMapper.listBycid(cid);
	}

	@Override
	public int savebusiness(Business business) {

		return businessMapper.insert(business);
	}

	@Override
	public Business selectByid(int id) {

		return businessMapper.selectByPrimaryKey(id);
	}

	@Override
	public int update(Business business) {

		return businessMapper.updateByPrimaryKey(business);
	}

	@Override
	public int deletebyid(int id) {

		return businessMapper.deleteByPrimaryKey(id);
	}

}
