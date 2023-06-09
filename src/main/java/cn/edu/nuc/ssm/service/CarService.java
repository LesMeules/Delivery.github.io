package cn.edu.nuc.ssm.service;

import java.util.List;

import cn.edu.nuc.ssm.entity.TCar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nuc.ssm.dao.CarMapper;
import cn.edu.nuc.ssm.entity.PageInfo;

@Service
public class CarService {

    @Autowired
    private CarMapper carMapper;

    public int savecar(TCar TCar) {
        TCar tCar = carMapper.selectByPrimaryKey(TCar.getCarId());
        if (tCar != null) {
            return -1;
        } else {
            return carMapper.insert(TCar);
        }
    }


    public PageInfo listWidthPage(int current, String carName) {

        int count = carMapper.count(carName);

        PageInfo pageInfo = new PageInfo();
        pageInfo.setCount(count);

        pageInfo.setCurrent(current);

        List<TCar> list = carMapper.listWithPage(current, pageInfo.getStart(), pageInfo.getOffset(), carName);
        pageInfo.setList(list);
        return pageInfo;
    }


    public int delete(String id) {

        return carMapper.deleteByPrimaryKey(id);
    }


    public TCar findCarByid(String id) {
        return carMapper.selectByPrimaryKey(id);
    }


    public int update(TCar tCar) {
        return carMapper.updateByPrimaryKey(tCar);
    }


    public Long updateNowStatus(String usertruename) {
        return carMapper.updateNowStatus(usertruename);
    }
}
