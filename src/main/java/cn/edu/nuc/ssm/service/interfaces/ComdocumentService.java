package cn.edu.nuc.ssm.service.interfaces;

import java.util.List;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Comdocument;


public interface ComdocumentService {

	/**
	 * 根据ID删除公司业务
	 * @param id
	 * @return
	 */
    int deleteByPrimaryKey(Integer id);

    /**
     * 增加公司业务
     * @param record
     * @return
     */
    int insert(Comdocument record);

    /**
     * 根据需求增加公司业务
     * @param record
     * @return
     */
    int insertSelective(Comdocument record);

    /**
     * 根据ID查询公司业务
     * @param id
     * @return
     */
    Comdocument selectByPrimaryKey(Integer id);

    /**
     * 根据需求更新公司业务
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Comdocument record);

    /**
     * 更新公司业务
     * @param record
     * @return
     */
    int updateByPrimaryKey(Comdocument record);
    
    /**
     * 查询结果准备分页显示
     * @param start
     * @param offset
     * @return
     */
    PageInfo selectPageComdocument(int current);

	/**根据公司的cid查询出，该公司相关的证书
	 * @param cid 公司的id
	 * @return list
	 */
	List<Comdocument> selectBycid(int cid);

}
