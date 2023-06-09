package cn.edu.nuc.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nuc.ssm.dao.sysuserMapper;
import cn.edu.nuc.ssm.entity.Sysuser;
import cn.edu.nuc.ssm.service.interfaces.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private sysuserMapper sysuserMapper;

    @Override
    public Sysuser login(String username, String userpwd) {

        return sysuserMapper.login(username, userpwd);
    }

    @Override
    public List<Sysuser> selectAllUser() {

        return sysuserMapper.selectAllUser();
    }

    @Override
    public Sysuser selectByPrimaryKey(Integer userid) {

        return sysuserMapper.selectByPrimaryKey(userid);
    }

    @Override
    public int updateUser(Sysuser sysuser) {
        System.out.println(sysuser.getUsertruename());
        return sysuserMapper.updateByPrimaryKey(sysuser);
    }

    @Override
    public int saveuser(Sysuser sysuser) {
        sysuser.setUserpwd("123");
        return sysuserMapper.insert(sysuser);
    }

    @Override
    public Sysuser findbyusername(String username) {

        return sysuserMapper.findbyusername(username);
    }

    @Override
    public int delete(Integer userid) {

        return sysuserMapper.deleteByPrimaryKey(userid);
    }

    @Override
    public List<Sysuser> searchbyusername(String username) {

        return sysuserMapper.searchbyusername(username);
    }

    @Override
    public Sysuser selectByUsername(String username) {
        return sysuserMapper.selectByUsername(username);
    }

    @Override
    public int updateEmp(Sysuser sysuser) {
        return sysuserMapper.epdateEmp(sysuser);
    }

}
