package cn.edu.nuc.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.nuc.ssm.entity.Bank;

public interface BankMapper {
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
     * 查询开户银行总记录
     * @return
     */
    int selectBankCount();
    
    /**
     * 查询结果分页显示
     * @param start
     * @param offset
     * @return
     */
    List<Bank> selectPageBank(@Param("start") int start,@Param("offset") int offset);

	/**通过公司的cid，查询相关公司的开户银行的信息
	 * @param cid 公司的id
	 * @return list
	 */
	List<Bank> selectbycid(int cid);
    
}