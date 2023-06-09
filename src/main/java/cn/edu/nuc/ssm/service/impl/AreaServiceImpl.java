package cn.edu.nuc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.nuc.ssm.dao.AreaMapper;
import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Area;
import cn.edu.nuc.ssm.service.interfaces.AreaService;

@Service
public class AreaServiceImpl implements AreaService {

	@Autowired
	private AreaMapper areaMapper;

	@Override
	public PageInfo list(int current, String areaName) {

		PageInfo pInfo = new PageInfo(current);
		int count = areaMapper.count(areaName);
		pInfo.setCount(count);

		List<Area> list = areaMapper.findByAid(pInfo.getStart(), pInfo.getOffset(), areaName);

		pInfo.setList(list);

		return pInfo;
	}

	@Override
	public List<Area> sublist(int aid) {

		List<Area> list = areaMapper.sublist(aid);

		return list;
	}

	@Override
	public int savepro(Area area) {

		area.setLevel("省");
		area.setParentid(-1);

		return areaMapper.savepro(area);
	}

	@Override
	public int savecity(Area area) {

		area.setLevel("市");
		return areaMapper.savecity(area);
	}

	@Override
	public int updatepro(Area area) {

		return areaMapper.updateByPrimaryKey(area);
	}

	@Override
	public Area selectByid(int aid) {

		return areaMapper.selectByPrimaryKey(aid);
	}

	@Transactional
	@Override
	public int deletepro(Area area) {

		int count = areaMapper.deleteByPrimaryKey(area.getId());

		count = areaMapper.deleteByParentId(area.getId());

		return count;
	}

	@Override
	public List<Area> listAll() {

		List<Area> list = areaMapper.listAll();

		return list;
	}

}
