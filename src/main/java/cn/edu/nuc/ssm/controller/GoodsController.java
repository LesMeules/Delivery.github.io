package cn.edu.nuc.ssm.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Cartype;
import cn.edu.nuc.ssm.entity.Goods;
import cn.edu.nuc.ssm.service.interfaces.CartypeService;
import cn.edu.nuc.ssm.service.interfaces.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private CartypeService cartypeService;
	
	/**跳转到添加页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String toadd(Model model){
		
	    List<Cartype> list = cartypeService.listAll();
		
		model.addAttribute("list", list);
		
		return "goods/add";
	}
	/**添加货物
	 * @param car
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(Goods goods){
		
		int count = goodsService.savegoods(goods);
		if(count <= 0){
			
			return "error";
		}
		return "redirect:/goods/list";
	}
	
	/**列出货物信息
	 * @param current 当前页面
	 * @param goodsname 货物名称
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list")
	public String list(@RequestParam(name="current",defaultValue="1")int current,@RequestParam(name="goodsname",defaultValue="")String goodsname,Model model){
		
		PageInfo pageInfo = goodsService.listPage(current,goodsname);
		
		model.addAttribute("pager", pageInfo);
		
		return "goods/list";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("id")int id){
		
		int count = goodsService.delete(id);
		
		if(count < 0){
			
			return "error";
		}
		
		return "redirect:/goods/list";
	}
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String toupdate(@RequestParam("id")int id,Model model){
		
		Goods goods = goodsService.findbyid(id);
		List<Cartype> list = cartypeService.listAll();
		
		
		if(goods==null){
			
			return "error";
		}
		model.addAttribute("goods", goods);
		model.addAttribute("list", list);
		
		return "goods/edit";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(Goods goods,Model model){
		
		
		  int count = goodsService.update(goods);
		
		
		if(count<=0){
			
			return "error";
		}
		
		
		return "redirect:/goods/list";
	}
}
