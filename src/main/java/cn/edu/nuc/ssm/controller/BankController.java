package cn.edu.nuc.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Bank;
import cn.edu.nuc.ssm.service.interfaces.BankService;

@Controller
@RequestMapping("/bank")
public class BankController {
	
	@Autowired
	private BankService bankService;
	
	
	/**跳转天添加银行的页面
	 * @param bank 银行
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String toadd(@ModelAttribute Bank bank){
		
		return "bank/add";
	}
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(Bank bank,Model model){
		Integer count = bankService.insert(bank);
		if(count>0){
			return "redirect:/bank/listbycid?cid="+bank.getCid();
		}else{
			model.addAttribute("msg", "发生错误");
			return "error";
		}
		
	}
	
	
	@RequestMapping(value="delete",method=RequestMethod.GET)
	public String delete(@RequestParam("id")int id,@RequestParam("cid")int cid,Model model){
		
		Integer rtn = bankService.deleteByPrimaryKey(id);
		if(rtn>0){
			return "redirect:/bank/listbycid?cid=" + cid;
		}else{
			model.addAttribute("msg", "发生内部错误");
			return "error";
		}
		
	}
	
	@RequestMapping(value="list",method=RequestMethod.GET)
	public String list(@RequestParam(name="current",defaultValue="1") int current,Model model){
		PageInfo pi = bankService.selectPageBank(current);
		model.addAttribute("pi",pi);
		return "bank/list";
	}
	@RequestMapping(value="list",method=RequestMethod.POST)
	public String delete2(Integer id,Bank bank,Model model){
		
		PageInfo pi = new PageInfo();
		List<Bank> list = new ArrayList<Bank>();
		if(id==null) return "redirect:list";
		Bank b = bankService.selectByPrimaryKey(id);
		list.add(b);
		pi.setList(list);
		model.addAttribute("pi",pi);
		return "bank/list";
		
	}
	
	@RequestMapping(value="edit",method=RequestMethod.GET)
	public String edit(@RequestParam(name="id") Integer id,Model model){
		Bank bank = bankService.selectByPrimaryKey(id);
		model.addAttribute("bank", bank);
		return "bank/edit";
	}
	@RequestMapping(value="edit",method=RequestMethod.POST)
	public String edit2(Bank bank){
		Integer rtn = bankService.updateByPrimaryKeySelective(bank);
		if(rtn>0){
			return "redirect:list";
		}else{
			return "bank/edit";
		}
		
	}
	
	/**通cid查找公司相关的开户的银行信息
	 * @param cid 公司的id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listbycid",method=RequestMethod.GET)
	public String listbycid(@RequestParam("cid")int cid,Model model){
		
		List<Bank> list = bankService.listbycid(cid);
		
		model.addAttribute("list", list);
		
		return "bank/listbycid";
	}

	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String toupdate(@RequestParam(name="id") Integer id,Model model){
		
		
		Bank bank = bankService.selectByPrimaryKey(id);
		model.addAttribute("bank", bank);
		
		return "bank/edit";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(Bank bank,Model model){
		
		
		int count = bankService.updateByPrimaryKey(bank);
		
		
		if(count>0){
			return "redirect:/bank/listbycid?cid="+bank.getCid();
		}else{
			model.addAttribute("msg", "发生内部错误");
			return "error";
		}
		
		
		
		
	}
	
	
}