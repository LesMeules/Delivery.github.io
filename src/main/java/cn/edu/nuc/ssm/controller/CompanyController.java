package cn.edu.nuc.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Area;
import cn.edu.nuc.ssm.entity.Company;
import cn.edu.nuc.ssm.service.interfaces.AreaService;
import cn.edu.nuc.ssm.service.interfaces.CompanyService;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private AreaService areaService;
	@Autowired
	private CompanyService companyService;

	@RequestMapping(value = "/listarea", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public @ResponseBody List<Area> areajson() {

		List<Area> list = areaService.listAll();

		return list;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String toadd() {

		return "company/add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(Company company) {

		int count = companyService.saveCompany(company);

		System.out.println(count);

		return "company/add";
	}

	@RequestMapping(value = "/list")
	public String list(String current, String companyName, Model model) {

		if (current == null && current != "") {

			current = "1";
		}
		if (companyName == null) {

			companyName = "";
		}

		List<Area> listarea = areaService.listAll();
		model.addAttribute("listarea", listarea);
		PageInfo pageInfo = companyService.listAll(Integer.valueOf(current), companyName);
		model.addAttribute("pager", pageInfo);

		return "company/list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String toupdate(Company company, Model model) {

		Company findcompany = companyService.findbyid(company.getId());

		model.addAttribute("company", findcompany);

		return "company/edit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Company company) {

		companyService.update(company);

		return "redirect:/company/list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Company company) {

		companyService.delete(company);

		return "redirect:/company/list";
	}

}
