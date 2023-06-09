package cn.edu.nuc.ssm.controller;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.service.CarService;
import cn.edu.nuc.ssm.service.interfaces.CartypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping({"/front"})
public class FrontController
{

  @Autowired
  private CartypeService cartypeService;

  @Autowired
  private CarService carService;

  @RequestMapping({"/list"})
  public String list(@RequestParam(name="current", defaultValue="1") int current, @RequestParam(name="search", defaultValue="") String search, Model model, @RequestParam("csid") int csid)
  {
    if (csid == 1) {
    	
      PageInfo pageInfo = this.cartypeService.list(current, search);
      System.out.println("------------1111111-----------");
      model.addAttribute("pager", pageInfo);
      
    }
    else if (csid == 2)
    {
      PageInfo pageInfo = this.carService.listWidthPage(current, search);
      System.out.println("------------2222222-----------");
      model.addAttribute("carpager", pageInfo);
    }

    return "forward:/search.jsp";
  }
}