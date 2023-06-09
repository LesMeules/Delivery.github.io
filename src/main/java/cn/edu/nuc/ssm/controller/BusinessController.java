package cn.edu.nuc.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.edu.nuc.ssm.entity.Business;
import cn.edu.nuc.ssm.service.interfaces.BusinessService;

@Controller
@RequestMapping("/business")
public class BusinessController {
	
	@Autowired
	private BusinessService businessService;
	
	/**通过公司cid查询相关公司的的业务信息
	 * @param cid
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listbycid")
	public String listByCompanycid(String cid,Model model){
		
		if(cid!=null && !"".equals(cid)){
			
			List<Business> list = businessService.listbycid(Integer.valueOf(cid));
			
			model.addAttribute("list",list);
		}else{
			
			model.addAttribute("msg", "发生错误");
			
			return "error";
			
		}
		
		return "business/listbycid";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String toadd(){
		
		
		return "business/add";
	}
	
	/**保存业务信息
	 * @param business
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(Business business){
		
		int count = businessService.savebusiness(business);
		
		if(count==1){
			
			return "forward:/business/listbycid";
			
		}
		
		return "error";
		
	}
	
	/**更新业务信息
	 * @param business
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String toupdate(Business business,Model model){
		
		Business business2 = businessService.selectByid(business.getId());
		
		model.addAttribute("business", business2);
		
		return "business/edit";
	}
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(Business business,Model model){
		
		int count =  businessService.update(business);
		
		if(count==1){
				
				return "forward:/business/listbycid";
				
			}
			
		return "error";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String delete(Business business,Model model){
		
		
		
		int count =  businessService.deletebyid(Integer.valueOf(business.getId()));
		
		System.out.println(count);
		
		
				
		return "forward:/business/listbycid";
				
		
	}
	
	
	
}
