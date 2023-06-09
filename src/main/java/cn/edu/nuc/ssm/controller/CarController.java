package cn.edu.nuc.ssm.controller;

import java.util.List;

import cn.edu.nuc.ssm.entity.TCar;
import cn.edu.nuc.ssm.service.CarService;
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
@RequestMapping("/car")
public class CarController {

    @Autowired
    private CarService carService;

    @Autowired
    private CartypeService cartypeService;

    /**
     * 跳转到添加车辆页面
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String toadd(Model model) {

//		List<Cartype> list = cartypeService.listAll();

//		model.addAttribute("list", list);

        return "car/add";
    }

    /**
     * 添加车辆
     *
     * @param TCar
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(TCar TCar, Model model) {

        int count = carService.savecar(TCar);

        if (count == -1) {
            model.addAttribute("carMsg", "车牌号已存在");
            model.addAttribute("carIdTemp", TCar.getCarId());
            return "car/add";
        } else {
            return "redirect:/car/list";
        }

    }

    /**
     * 列出车辆信息，带分页
     *
     * @param current
     * @param carName
     * @param model
     * @return
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(name = "current", defaultValue = "1") int current, @RequestParam(name = "carOwner", defaultValue = "") String carName, Model model) {
        PageInfo pageInfo = carService.listWidthPage(current, carName);
        System.out.println("pageInfo = " + pageInfo);
        model.addAttribute("pager", pageInfo);
        return "car/list";
    }

    /**
     * 删除车辆信息
     *
     * @param id 车辆id
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam("id") String id) {

        int count = carService.delete(id);

        if (count <= 0) {

            return "error";
        }

        return "redirect:/car/list";
    }

    /**
     * 跳转到编辑页面
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String toupate(@RequestParam("id") String id, Model model) {

        TCar TCar = carService.findCarByid(id);
//		List<Cartype> list = cartypeService.listAll();

        model.addAttribute("car", TCar);
//		model.addAttribute("list", list);

        return "car/edit";
    }

    /**
     * 提交更新信息
     *
     * @param TCar
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(TCar TCar) {

        int count = carService.update(TCar);

        if (count <= 0) {

            return "error";
        }

        return "redirect:/car/list";
    }

}
