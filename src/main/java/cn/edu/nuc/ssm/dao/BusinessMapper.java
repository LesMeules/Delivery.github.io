package cn.edu.nuc.ssm.dao;

import java.util.List;

import cn.edu.nuc.ssm.entity.Business;

public interface BusinessMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Business record);

    int insertSelective(Business record);

    Business selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Business record);

    int updateByPrimaryKey(Business record);
    
    
    /**通过cid查询该公司相关的业务列表
     * @param cid 要查询公司的Id
     * @return 与公司相关的业务列表
     */
    List<Business> listBycid(int cid);
    
}