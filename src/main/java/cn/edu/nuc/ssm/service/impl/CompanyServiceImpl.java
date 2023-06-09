package cn.edu.nuc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nuc.ssm.dao.CompanyMapper;
import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Company;
import cn.edu.nuc.ssm.service.interfaces.CompanyService;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyMapper companyMapper;

	@Override
	public int saveCompany(Company company) {

		return companyMapper.insertSelective(company);
	}

	@Override
	public PageInfo listAll(int current, String companyName) {

		PageInfo pInfo = new PageInfo(current);
		int count = companyMapper.count(companyName);
		pInfo.setCount(count);
		List<Company> list = companyMapper.selectAll(companyName, pInfo.getStart(), pInfo.getOffset());

		pInfo.setList(list);

		return pInfo;
	}

	@Override
	public int update(Company company) {

		return companyMapper.updateByPrimaryKey(company);
	}

	@Override
	public Company findbyid(int id) {

		return companyMapper.selectByPrimaryKey(id);
	}

	@Override
	public int delete(Company company) {

		return companyMapper.deleteByPrimaryKey(company.getId());
	}

	@Override
	public List<Company> listAll() {

		return companyMapper.listAll();
	}

}
