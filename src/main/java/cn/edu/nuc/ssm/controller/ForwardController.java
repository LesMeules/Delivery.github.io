package cn.edu.nuc.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ForwardController {
    @GetMapping("/")
    public String login(){
        return "login";
    }

}
