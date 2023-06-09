package cn.edu.nuc.ssm.service.interfaces;

import java.util.List;

import cn.edu.nuc.ssm.entity.Sysfunction;
import cn.edu.nuc.ssm.entity.Sysuser;

public interface SysfunctionService {

	
	/** 
	 * @param existsysuser 登录的用户
	 * @return
	 */
	List<Sysfunction> initfunction(Sysuser existsysuser);
	

}
