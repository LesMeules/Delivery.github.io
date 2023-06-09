package cn.edu.nuc.ssm.controller;


import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import cn.edu.nuc.ssm.entity.Sysfunction;
import cn.edu.nuc.ssm.entity.Sysrole;
import cn.edu.nuc.ssm.entity.Sysuser;
import cn.edu.nuc.ssm.service.interfaces.RoleService;
import cn.edu.nuc.ssm.service.interfaces.SysfunctionService;
import cn.edu.nuc.ssm.service.interfaces.UserService;
import cn.edu.nuc.ssm.entity.Reg;

/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SysfunctionService sysfunctionService;
	
	@Autowired
	private RoleService roleService;
	
	/**
	 * 跳转到登录页面
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String tologin(){
		
		return "login";
	}
	
	/**
	 * frame中加载main的部分
	 * @return
	 */
	@RequestMapping(value="/welcome",method=RequestMethod.GET)
	public String welcome(){
		
		return "welcome";
	}
	/**
	 * 员工登录，并查处该员工拥有的权限功能
	 * @param sysuser
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(Sysuser sysuser, HttpSession session, Model model){
		
		Sysuser existsysuser = userService.login(sysuser.getUsername(),sysuser.getUserpwd());
		System.out.println("existsysuser.toString() = " + existsysuser.toString());
		session.setAttribute("user", existsysuser);
		
		if(existsysuser==null){
			
			model.addAttribute("msg", "用户名或密码错误");
			
			return "login";
		}
		
		return "redirect:/user/index";
	}
	/**
	 * 员工注销
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session){
		
		session.removeAttribute("user");
		session.removeAttribute("initfun");
		
		return "login";
	}
	
	/**
	 * 跳转到主页页面
	 * @return
	 */
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(Model model,HttpSession session){
		
		Sysuser sysuser = (Sysuser) session.getAttribute("user");
		
		List<Sysfunction> funlist=sysfunctionService.initfunction(sysuser);
		
		System.out.println(funlist);
		
		 if ((sysuser != null) && (funlist.size() > 0))
		 {
		      model.addAttribute("initfun", funlist);
		      model.addAttribute("user", sysuser);
		 } else {
		      model.addAttribute("msg", "登录会话失效");
		      return "forward:/user/login";
		 }
		
		return "index";
	}
	
	/**列出所有的员工，除了超级管理员
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listuser",method=RequestMethod.GET)
	public String listUser(Model model){
		
		List<Sysuser> list = userService.selectAllUser();
		
		System.out.println(list);
		
		model.addAttribute("listuser", list);
		
		return "sysuser/list";
		
	}
	
	/**跳转到员工更新页面
	 * @param sysuser
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String toupdate(Sysuser sysuser, Model model){
		
		Sysuser existuser = userService.selectByPrimaryKey(sysuser.getUserid());
		model.addAttribute("item", existuser);
		
		return "sysuser/edit";
	}
	
	/**更新员工信息
	 * @param sysuser
	 * @return
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String Update(Sysuser sysuser){
		int count = userService.updateUser(sysuser);
		if(count<=0){
			return "error";
		}
		
		return "redirect:/user/listuser";
	}
	
	/** 显示员工可以更新角色
	 * @return
	 */
	@RequestMapping(value="/listrolejson",method=RequestMethod.POST,produces="application/json; charset=UTF-8")
	public @ResponseBody List<Sysrole> areajson(){
		List<Sysrole> list = roleService.listAll();
		return list;
	}
	
	/**跳转到登录页面
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String toadd(){
		return "sysuser/add";
	}
	/**增加员工
	 * @param sysuser
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(Sysuser sysuser){
		int count = userService.saveuser(sysuser);
		if(count<0){
			return "error";
		}
		return "redirect:/user/listuser";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String Delete(Sysuser sysuser){
		if(sysuser.getUserid()==null){
			return "error";
		}
		int count = userService.delete(sysuser.getUserid());
		if(count<0){
			return "error";
		}
		return "redirect:/user/listuser";
	}

	/** 查看员工信息是否存在
	 * @param username
	 * @return
	 */
	@RequestMapping(value="/checkusername",method=RequestMethod.POST,produces="application/json; charset=UTF-8")
	public @ResponseBody Reg checkusername(String username){
		Reg reg = new Reg(200 , "ok");
		Sysuser finduser = userService.findbyusername(username);
		if(finduser==null){
			
			return reg;
		}
		reg.setCode(500);
		reg.setMsg("用户名重复");
		return reg;
	}
	/**跳转到个人设置页面
	 * @return
	 */
	@RequestMapping(value="/personalSetting")
	public String toPersonalSetting(HttpSession session,Model model){
		Sysuser sysuser = (Sysuser) session.getAttribute("user");
		System.out.println("sysuser.toString() = " + sysuser.toString());
		Sysuser existuser = userService.selectByUsername(sysuser.getUsername());
		model.addAttribute("item", existuser);
		return "sysuser/personalSetting";
	}
	/** 保存个人设置
	 * @param sysuser
	 * @return
	 */
	@PostMapping(value="/saveSetting")
	public String  personalSetting(Sysuser sysuser,Model model){
		int count = userService.updateEmp(sysuser);
		if(count<=0){
			return "error";
		}
		model.addAttribute("settingMsg","设置成功");
		return "forward:/user/personalSetting";
	}
	
	/**根据员工名搜索员工信息
	 * @param username 员工名
	 * @return
	 */
	@RequestMapping(value="/search",method=RequestMethod.POST)
	public String search(String username,Model model){
		if(username==null){
			username="";
		}
		List<Sysuser> searchlist = userService.searchbyusername(username);
		model.addAttribute("listuser", searchlist);
		return "sysuser/list";
	}
}
