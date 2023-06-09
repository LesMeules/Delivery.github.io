package cn.edu.nuc.ssm.controller;

import cn.edu.nuc.ssm.entity.Logistics;
import cn.edu.nuc.ssm.entity.LogisticsLog;
import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Sysuser;
import cn.edu.nuc.ssm.service.CarService;
import cn.edu.nuc.ssm.service.LogisticsLogServcie;
import cn.edu.nuc.ssm.service.LogisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * @author Administrator
 */
@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    LogisticsService logisticsService;
    @Autowired
    LogisticsLogServcie logisticsLogService;
    @Autowired
    CarService carService;


    @RequestMapping("/received")
    public String received(HttpSession session, Logistics logistics, LogisticsLog logisticsLog) {
        Sysuser user = (Sysuser) session.getAttribute("user");
        System.out.println("user = " + user);
        logisticsLog.setlNumber(logistics.getlNumber());
        logisticsLog.setTime(new Date());
        logisticsLog.setInfo("您的快递订单显示已被签收，操作人：" + user.getUsertruename() + "，如有疑问，请联系：" + user.getUserphone());
        logisticsLogService.insert(logisticsLog);
        System.out.println("user.tostring() = " + user.toString());
        logistics.setDeliver(user.getUsertruename());
        logisticsService.update4(logistics);
        /*
            完成订单
         */
        logisticsService.doneOrder(logistics.getlNumber());
        return "redirect:list";
    }

    @RequestMapping("/arriveAddress")
    public String arriveAddress(HttpSession session, Logistics logistics, LogisticsLog logisticsLog) {
        Logistics allInfo = logisticsService.query(logistics.getlNumber());
        Sysuser user = (Sysuser) session.getAttribute("user");
        System.out.println("user = " + user);
        logisticsLog.setlNumber(logistics.getlNumber());
        logisticsLog.setTime(new Date());
        logisticsLog.setInfo("快递订单已到达:" + allInfo.getToAddress() + "服务站，快递小哥：" + user.getUsertruename() + "扫件，正在火速派送，如有疑问，请联系：" + user.getUserphone());
        logisticsLogService.insert(logisticsLog);
        System.out.println("user.tostring() = " + user.toString());
        logistics.setLogisticsAddress(allInfo.getToAddress());
        logistics.setDeliver(user.getUsertruename());
        logisticsService.update3(logistics);
        return "redirect:list";
    }

    @RequestMapping(value = "/updateLogistics", method = RequestMethod.POST)
    public String updateLogistics(Logistics logistics, HttpSession session, LogisticsLog logisticsLog) {
        Long result = logisticsService.updateAddressLogistics(logistics);
        Sysuser user = (Sysuser) session.getAttribute("user");
        System.out.println("user = " + user);
        logisticsLog.setlNumber(logistics.getlNumber());
        logisticsLog.setTime(new Date());
        logisticsLog.setInfo("快递订单已到达" + logistics.getLogisticsAddress() + "配送员:" + user.getUsertruename() + "扫件，正在配送的路上，请耐心等待，如有疑问，请联系：" + user.getUserphone());
        logisticsLogService.insert(logisticsLog);
        return "redirect:list";
    }

    @RequestMapping(value = "/updateLogistics", method = RequestMethod.GET)
    public String toUpdateView(@RequestParam("lNumber") String lNumber, Model model) {
        Logistics l = logisticsService.query(lNumber);
        model.addAttribute("car", l);
        return "order/editLogistics";
    }

    @RequestMapping("/list")
    public String list(@RequestParam(name = "current", defaultValue = "1") int current, @RequestParam(name = "lNumber", defaultValue = "") String lNumber, Model model, HttpSession session) {
        Sysuser user = (Sysuser) session.getAttribute("user");
        System.out.println("user.toString() = " + user.toString());
        System.out.println("user.getUsertruename() = " + user.getUsertruename());
        model.addAttribute("usergetTrueName", user.getUsertruename());
        PageInfo list = logisticsService.listWithPage(current, lNumber);
        System.out.println("list = " + list);
        model.addAttribute("pager", list);
        return "order/list";
    }

    @RequestMapping("/doneLogistics")
    public String selectByDone(@RequestParam(name = "current", defaultValue = "1") int current,@RequestParam(name = "lNumber", defaultValue = "") String lNumber,Model model){
        PageInfo list = logisticsService.getDoneOrder(current,lNumber);
        model.addAttribute("pager", list);
        return "order/doneLogistics";
    }


    /**
     * 收件操作，获取登录名，把订单状态种类变成2
     *
     * @param session
     * @param logistics
     * @return
     */
    @RequestMapping("/update2")
    public String update(HttpSession session, Logistics logistics, LogisticsLog logisticsLog) {
        Sysuser user = (Sysuser) session.getAttribute("user");
        System.out.println("user = " + user);
        logisticsLog.setlNumber(logistics.getlNumber());
        logisticsLog.setTime(new Date());
        logisticsLog.setInfo("快递订单已被配送员:" + user.getUsertruename() + "扫件，正在火速配送，如有疑问，请联系：" + user.getUserphone());
        logisticsLogService.insert(logisticsLog);
        System.out.println("user.tostring() = " + user.toString());
        logistics.setDeliver(user.getUsertruename());
        logisticsService.update2(logistics);
        carService.updateNowStatus(user.getUsertruename());
        return "redirect:list";
    }

    /**
     * 物流信息
     *
     * @return
     */
    @RequestMapping("/logistics")
    public String logistics(@RequestParam(name = "current", defaultValue = "1") int current, @RequestParam(name = "number", defaultValue = "") String number, Model model) {
        PageInfo list = logisticsLogService.listWithPage(current, number);
        System.out.println("list = " + list);
        model.addAttribute("list", list);
        return "order/logistics";
    }

}
