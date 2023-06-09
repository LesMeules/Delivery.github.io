package cn.edu.nuc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nuc.ssm.dao.SysfunctionMapper;
import cn.edu.nuc.ssm.entity.Sysfunction;
import cn.edu.nuc.ssm.entity.Sysuser;
import cn.edu.nuc.ssm.service.interfaces.SysfunctionService;

@Service
public class SysfunctionServiceImpl implements SysfunctionService {
	
	@Autowired
	private SysfunctionMapper sysfunctionMapper;

	@Override
	public List<Sysfunction> initfunction(Sysuser existsysuser) {
		
		return sysfunctionMapper.initfunction(existsysuser);
	}

}
