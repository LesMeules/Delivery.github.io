package cn.edu.nuc.ssm.controller;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.TDistributionScope;
import cn.edu.nuc.ssm.entity.TDistributionSite;
import cn.edu.nuc.ssm.service.DistributionSitesService;
import cn.edu.nuc.ssm.service.impl.DistributionScopeServiceImpl;
import cn.edu.nuc.ssm.service.interfaces.DistributionScopeService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mysql.cj.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/distributionSites")
public class DistributionSitesController {
    @Autowired
    DistributionSitesService distributionSitesService;

    @Autowired
    DistributionScopeService distributionScopeService;


    @RequestMapping("/area")
    public  String area(@RequestParam(name = "current", defaultValue = "1") int current, @RequestParam(name = "distributionSiteName", defaultValue = "") String name, Model model) {
        PageInfo list = distributionScopeService.listWithPage(current, name);

        model.addAttribute("area",list);
        return "distributionSites/area";
    }
    /**
     * 获取配送点列表
     *
     * @param current
     * @param name
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String list(@RequestParam(name = "current", defaultValue = "1") int current, @RequestParam(name = "distributionSiteName", defaultValue = "") String name, Model model) {
        PageInfo list = distributionSitesService.listWithPage(current, name);
        model.addAttribute("pager", list);
        return "distributionSites/list";
    }

    /**
     * 跳转到添加页面
     *
     * @return
     */
    @GetMapping("/add")
    public String add() {
        return "/distributionSites/add";
    }

    @PostMapping("/add")
    public String insert(TDistributionSite data) {
        int count = distributionSitesService.insert(data);
        if (count <= 0) {
            return "error";
        }
        return "redirect:/distributionSites/list";
    }

    @GetMapping("/update")
    public String edit(@RequestParam("id") String id, Model model) {
        TDistributionSite data = distributionSitesService.selectById(id);

        model.addAttribute("sites", data);
        return "/distributionSites/edit";
    }

    @PostMapping("/edit")
    public String update(TDistributionSite data) {
        int result = distributionSitesService.update(data);
        if (result <= 0) {
            return "error";
        }
        return "redirect:/distributionSites/list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") String id) {
        int result = distributionSitesService.delete(id);
        if (result <= 0) {
            return "error";
        }
        return "redirect:/distributionSites/list";
    }
}
