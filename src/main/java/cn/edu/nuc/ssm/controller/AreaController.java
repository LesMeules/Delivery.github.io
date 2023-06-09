package cn.edu.nuc.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Area;
import cn.edu.nuc.ssm.service.interfaces.AreaService;

@Controller
@RequestMapping("/area")
public class AreaController {
	
	@Autowired
	private AreaService areaService;
	
	/**列出地域信息
	 * @param current
	 * @param areaName
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list")
	public String list(String current,String areaName,Model model){
		
		if(current==null && current!=""){
			
			current="1";
		}
		if(areaName==null){
			
			areaName="";
		}
		
		PageInfo pageInfo = areaService.list(Integer.valueOf(current),areaName);
		model.addAttribute("pager", pageInfo);
		
		
		return "area/list";
	}
	
	
	/**列出子地域信息
	 * @param aid
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listsub",method=RequestMethod.GET)
	public String listsub(String aid,Model model){
		
		if(aid==null && aid!=""){
			
			aid="1";
		}
		
		List<Area> list =  areaService.sublist(Integer.valueOf(aid));
		
		model.addAttribute("listsub", list);
		
		return "area/listsub";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(){
		
		return "area/add";
	}
	
	@RequestMapping(value="/addsub",method=RequestMethod.GET)
	public String addsub(){
		
		return "area/addsub";
	}
	
	/**保存省信息
	 * @param area
	 * @return
	 */
	@RequestMapping(value="/savepro",method=RequestMethod.POST)
	public String savepro(Area area){
		
		areaService.savepro(area);
		
		
		return "redirect:/area/list";
	}
	
	/**保存城市信息
	 * @param area
	 * @return
	 */
	@RequestMapping(value="/savecity",method=RequestMethod.POST)
	public String savecity(Area area){
		
		areaService.savecity(area);
		
		
		return "redirect:/area/listsub?aid="+area.getParentid();
	}
	
	
	
	@RequestMapping(value="/updatepro",method=RequestMethod.GET)
	public String toupdatepro(Area area,Model model){
		
		Area findarea = areaService.selectByid(area.getId());
		
		model.addAttribute("area", findarea);
		
		
		return "area/edit";
	}
	/**更新城市信息
	 * @param area
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/updatepro",method=RequestMethod.POST)
	public String updatepro(Area area){
		
		areaService.updatepro(area);
		
		
		return "redirect:/area/list";
	}
	
	@RequestMapping(value="deletepro",method=RequestMethod.GET)
	public String deletepro(Area area){
		
		Area findarea = areaService.selectByid(area.getId());
		
		areaService.deletepro(findarea);
		
		return "redirect:/area/list";
	}
	
}
