package cn.edu.nuc.ssm.service.interfaces;


import java.util.List;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Bank;

public interface BankService {

	/**
	 * 根据id删除银行信息
	 * @param id
	 * @return
	 */
    int deleteByPrimaryKey(Integer id);

    /**
     * 增加开户银行
     * @param record
     * @return
     */
    int insert(Bank record);

    /**
     * 根据需求增加银行信息
     * @param record
     * @return
     */
    int insertSelective(Bank record);

    /**
     * 根据id查询开户银行信息
     * @param id
     * @return
     */
    Bank selectByPrimaryKey(Integer id);

    /**
     * 根据需求更新开户银行信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Bank record);

    /**
     * 更新银行信息
     * @param record
     * @return
     */
    int updateByPrimaryKey(Bank record);
    
    /**
     * 查询结果分页显示
     * @param current
     * @return
     */
    PageInfo selectPageBank(Integer current);

	/**通过公司的id查询，该公司的开户银行信息
	 * @param cid 公司的id
	 * @return list
	 */
	List<Bank> listbycid(int cid);
    
}
