package cn.edu.nuc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nuc.ssm.dao.BankMapper;
import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Bank;
import cn.edu.nuc.ssm.service.interfaces.BankService;

@Service
public class BankServiceImpl implements BankService {

	@Autowired
	private BankMapper bankMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return bankMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Bank record) {
		// TODO Auto-generated method stub
		return bankMapper.insert(record);
	}

	@Override
	public int insertSelective(Bank record) {
		// TODO Auto-generated method stub
		return bankMapper.insertSelective(record);
	}

	@Override
	public Bank selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return bankMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Bank record) {
		// TODO Auto-generated method stub
		return bankMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Bank record) {
		// TODO Auto-generated method stub
		return bankMapper.updateByPrimaryKey(record);
	}

	@Override
	public PageInfo selectPageBank(Integer current) {
		PageInfo pi = new PageInfo(current);
		pi.setCount(bankMapper.selectBankCount());
		List<Bank> list = bankMapper.selectPageBank(pi.getStart(), pi.getOffset());
		pi.setList(list);
		return pi;
	}

	@Override
	public List<Bank> listbycid(int cid) {

		return bankMapper.selectbycid(cid);
	}

}
