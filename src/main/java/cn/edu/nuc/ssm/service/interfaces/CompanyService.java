package cn.edu.nuc.ssm.service.interfaces;

import java.util.List;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Company;

public interface CompanyService {

	/**
	 * 保存公司信息
	 * 
	 * @param company
	 * @return
	 */
	int saveCompany(Company company);

	/**
	 * 列出所有的公司，带分页、
	 * 
	 * @param current
	 * @param companyName
	 * @return
	 */
	PageInfo listAll(int current, String companyName);

	/**
	 * 更新公司的信息
	 * 
	 * @param company
	 * @return
	 */
	int update(Company company);

	/**
	 * 通过公司的id查找某一个公司的信息
	 * 
	 * @param id
	 * @return
	 */
	Company findbyid(int id);

	/**
	 * 删除公司的信息
	 * 
	 * @param company
	 * @return
	 */
	int delete(Company company);

	/**
	 * 列出所有的公司的信息
	 * 
	 * @return
	 */
	List<Company> listAll();

}
