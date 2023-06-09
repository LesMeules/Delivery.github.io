package cn.edu.nuc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.nuc.ssm.dao.SysroleMapper;
import cn.edu.nuc.ssm.entity.Sysfunction;
import cn.edu.nuc.ssm.entity.Sysrole;
import cn.edu.nuc.ssm.service.interfaces.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private SysroleMapper sysroleMapper;

	@Override
	public List<Sysrole> listAll() {

		return sysroleMapper.listAll();
	}

	@Override
	public Sysrole findbyid(Integer roleid) {

		return sysroleMapper.selectByPrimaryKey(roleid);
	}

	@Override
	public int updateRole(Sysrole sysrole) {

		return sysroleMapper.updateByPrimaryKey(sysrole);
	}

	@Override
	public int saverole(Sysrole sysrole) {

		return sysroleMapper.insert(sysrole);
	}

	@Override
	public List<Sysrole> listbyrolename(String rolename) {

		return sysroleMapper.searchbyrolename(rolename);
	}

	@Override
	public List<Sysfunction> initfunlist(int roleid) {

		return sysroleMapper.initfunlist(roleid);
	}

	@Transactional
	@Override
	public Integer saveright(int roleid, Integer[] funids) {

		int count = sysroleMapper.deleteright(roleid);

		if (count < 0) {

			throw new RuntimeException("删除权限信息失败");
		}
		count = sysroleMapper.saveright(roleid, funids);

		if (count < 0) {

			throw new RuntimeException("保存权限信息失败");
		}

		return count;
	}

}
