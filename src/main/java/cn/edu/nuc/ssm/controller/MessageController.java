package cn.edu.nuc.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Message;
import cn.edu.nuc.ssm.service.interfaces.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(Message message,Model model){
		
		int count = messageService.savemess(message);
		if(count>0){
			
			model.addAttribute("msg", "留言成功");
		}else{
			
			model.addAttribute("msg", "留言失败");
		}
		
		return "forward:/msg.jsp";
	}
	
	 @RequestMapping({"/list"})
	 public String list(String current, Model model) {
	   if ((current == null) && (current != ""))
	   {
	     current = "1";
	   }
	   PageInfo pageInfo = this.messageService.list(Integer.valueOf(current));
	   model.addAttribute("pager", pageInfo);
	   return "message/list";
	 }
	 @RequestMapping(value={"delete"}, method={RequestMethod.GET})
	 public String delete(@RequestParam("id") int id) {
	   int count = this.messageService.delete(id);
	   if (count <= 0)
	   {
	     return "error";
	   }
	   return "redirect:/message/list";
	 }
	 
	 @RequestMapping(value={"view"}, method={RequestMethod.GET})
	 public String view(@RequestParam("id") int id, Model model) {
	   Message message = this.messageService.findByid(id);
	   model.addAttribute("message", message);
	   return "message/view";
	 }
	

}
