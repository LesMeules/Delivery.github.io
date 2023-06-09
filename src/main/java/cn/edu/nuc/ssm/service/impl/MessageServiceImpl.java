package cn.edu.nuc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nuc.ssm.dao.MessageMapper;
import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Message;
import cn.edu.nuc.ssm.service.interfaces.MessageService;
@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageMapper messageMapper;
	
	@Override
	public int savemess(Message message) {
		
		return messageMapper.insert(message);
	}

	
	 public PageInfo list(Integer current)
	 {
	   PageInfo pInfo = new PageInfo(current.intValue());
	   int count = this.messageMapper.count();
	   pInfo.setCount(count);
	   List<Message> list = this.messageMapper.findByAid(pInfo.getStart(), pInfo.getOffset());
	   pInfo.setList(list);
	   return pInfo;
	 }
	 public int delete(int id)
	 {
	   return this.messageMapper.deleteByPrimaryKey(Integer.valueOf(id));
	 }
	 public Message findByid(int id)
	 {
	   return this.messageMapper.selectByPrimaryKey(Integer.valueOf(id));
	 }

	
}
