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

import cn.edu.nuc.ssm.entity.Comdocument;

import cn.edu.nuc.ssm.service.interfaces.ComdocumentService;

@Controller
@RequestMapping("/comdocument")
public class ComDocumentController {
	
	@Autowired
	private ComdocumentService comdocumentService;
	

	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(@ModelAttribute Comdocument comdocument){
		
		return "comdocument/add";
	}
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add2(Comdocument comdocument){
		
		Integer rtn = comdocumentService.insertSelective(comdocument);
		if(rtn>0){
			return "redirect:/comdocument/listbycid?cid=" + comdocument.getCid();
		}else{
			return "comdocument/add";
		}
	}
	
	
	/**通过id删除
	 * @param id 证书id
	 * @return
	 */
	@RequestMapping(value="delete",method=RequestMethod.GET)
	public String delete(@RequestParam("id")int id,@RequestParam("cid")int cid,Model model){
		
		Integer rtn = comdocumentService.deleteByPrimaryKey(id);
		if(rtn>0){
			
			return "redirect:/comdocument/listbycid?cid=" + cid;
		}else{
			
			model.addAttribute("msg", "发生错误");
			
			return "error";
		}
		
	}
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(@RequestParam(name="current",defaultValue="1") int current,Model model){
		PageInfo pi = comdocumentService.selectPageComdocument(current);
		model.addAttribute("pi",pi);
		return "comdocument/list";
	}
	
	
	@RequestMapping(value="/list",method=RequestMethod.POST)
	public String delete2(Integer id,Comdocument comdocument,Model model){
		
		PageInfo pi = new PageInfo();
		List<Comdocument> list = new ArrayList<Comdocument>();
		if(id==null) return "redirect:list";
		Comdocument c = comdocumentService.selectByPrimaryKey(id);
		list.add(c);
		pi.setList(list);
		model.addAttribute("pi",pi);
		return "comdocument/list";
	}
	
	/**通过cid列出公司的相关的证书信息
	 * @param cid 公司的id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listbycid",method=RequestMethod.GET)
	public String listbycid(@RequestParam("cid")int cid,Model model){
		
		
		List<Comdocument> list = comdocumentService.selectBycid(cid);
		
		model.addAttribute("list", list);
		
		return "comdocument/listbycid";
	}
	
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String toupdate(@RequestParam(name="id") Integer id,Model model){
		Comdocument comdocument = comdocumentService.selectByPrimaryKey(id);
		model.addAttribute("comdocument", comdocument);
		return "comdocument/edit";
	}
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(Comdocument comdocument){
		Integer rtn = comdocumentService.updateByPrimaryKeySelective(comdocument);
		if(rtn>0){
			
			return "redirect:/comdocument/listbycid?cid=" + comdocument.getCid();
		
		}else{
			
			return "error";
		}
		
	}
}