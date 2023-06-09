package cn.edu.nuc.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Cartype;
import cn.edu.nuc.ssm.service.interfaces.CartypeService;

@Controller
@RequestMapping("/cartype")
public class CartypeController {

	@Autowired
	private CartypeService cartypeService;

	/**
	 * 列出车型信息
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list")
	public String list(@RequestParam(name = "current", defaultValue = "1") int current,
			@RequestParam(name = "carType", defaultValue = "") String carType, Model model) {

		PageInfo pageInfo = cartypeService.list(current, carType);

		model.addAttribute("pager", pageInfo);

		System.out.println(pageInfo);

		return "cartype/list";
	}

	/**
	 * 跳转到添加页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String toadd() {

		return "cartype/add";
	}

	/**
	 * 添加车型
	 * 
	 * @param cartype
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(Cartype cartype) {

		int count = cartypeService.savecartype(cartype);

		if (count <= 0) {

			return "error";
		}
		return "redirect:/cartype/list";
	}

	/**
	 * 跳转到更新页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String toupdate(@RequestParam("id") int id, Model model) {

		Cartype existcartype = cartypeService.findbyid(id);

		model.addAttribute("cartype", existcartype);

		return "cartype/edit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Cartype cartype) {

		int count = cartypeService.update(cartype);

		if (count < 0) {

			return "error";
		}

		return "redirect:/cartype/list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("id") int id) {

		int count = cartypeService.delete(id);

		if (count < 0) {

			return "error";
		}

		return "redirect:/cartype/list";
	}

}
