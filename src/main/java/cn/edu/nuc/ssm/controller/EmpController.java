package cn.edu.nuc.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.edu.nuc.ssm.entity.PageInfo;
import cn.edu.nuc.ssm.entity.Area;
import cn.edu.nuc.ssm.entity.Company;
import cn.edu.nuc.ssm.entity.Emp;
import cn.edu.nuc.ssm.service.interfaces.AreaService;
import cn.edu.nuc.ssm.service.interfaces.CompanyService;
import cn.edu.nuc.ssm.service.interfaces.EmpService;
import cn.edu.nuc.ssm.util.IPTimeStamp;

@Controller
@RequestMapping("/emp")
public class EmpController {

    @Autowired
    private EmpService empService;
    @Autowired
    private AreaService areaService;
    @Autowired
    private CompanyService companyService;


    @RequestMapping(value = "/listjson", method = RequestMethod.POST, produces = "application/json; charset=UTF-8"
    )
    public @ResponseBody
    List<Company> companyjson() {

        List<Company> list = companyService.listAll();

        return list;
    }

    @RequestMapping(value = "/listarea", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public @ResponseBody List<Area> areajson() {

        List<Area> list = areaService.listAll();
        return list;
    }

    @RequestMapping(value = "/list")
    public String list(String current, String truename, Model model) {

        if (current == null && current != "") {

            current = "1";
        }
        if (truename == null) {

            truename = "";
        }

        List<Area> listarea = areaService.listAll();
        model.addAttribute("listarea", listarea);
        List<Company> listcompany = companyService.listAll();
        model.addAttribute("listcompany", listcompany);

        PageInfo pageInfo = empService.listAll(Integer.valueOf(current), truename);
        model.addAttribute("pager", pageInfo);

        return "emp/list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String toadd() {

        return "emp/add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Emp emp, @RequestParam("file") MultipartFile file, HttpServletRequest request) throws IOException {

        String realPath = request.getSession().getServletContext()
                .getRealPath("/assets/upload");
        File pathFile = new File(realPath);
        if (!pathFile.exists()) {
            //文件夹不存 创建文件
            pathFile.mkdirs();
        }
        System.out.println("文件类型：" + file.getContentType());
        System.out.println("文件名称：" + file.getOriginalFilename());
        System.out.println("文件大小:" + file.getSize());
        System.out.println(".................................................");
        IPTimeStamp ip = new IPTimeStamp();
        System.out.println(ip.getTimeStamp());
        String ext = FilenameUtils.getExtension(file.getOriginalFilename());
        String newfilename = ip.getTimeStamp() + "." + ext;

        FileUtils.copyInputStreamToFile(file.getInputStream(),
                new File(realPath, newfilename));
        //获取modelandview对象
        emp.setPhoto(newfilename);
        int count = empService.saveEmp(emp);
        System.out.println(count);
        return "redirect:/emp/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(Emp emp) {

        empService.delete(emp);
        return "redirect:/emp/list";
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public String toupdate(Emp emp, Model model) {

        Emp findemp = empService.findbyid(emp.getId());

        model.addAttribute("emp", findemp);

        return "emp/edit";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Emp emp, @RequestParam("file") MultipartFile file, HttpServletRequest request) throws IOException {

        String realPath = request.getSession().getServletContext()
                .getRealPath("/assets/upload");

        File pathFile = new File(realPath);

        if (!pathFile.exists()) {
            //文件夹不存 创建文件
            pathFile.mkdirs();
        }
        System.out.println("文件类型：" + file.getContentType());
        System.out.println("文件名称：" + file.getOriginalFilename());
        System.out.println("文件大小:" + file.getSize());
        System.out.println(".................................................");

        if (file != null && !"".equals(file.getOriginalFilename())) {

            Emp findemp = empService.findbyid(emp.getId());
            File sourcefile = new File(realPath + "/" + findemp.getPhoto());
            sourcefile.delete();
            IPTimeStamp ip = new IPTimeStamp();
            System.out.println(ip.getTimeStamp());
            String ext = FilenameUtils.getExtension(file.getOriginalFilename());
            String newfilename = ip.getTimeStamp() + "." + ext;

            FileUtils.copyInputStreamToFile(file.getInputStream(),
                    new File(realPath, newfilename));
            //获取modelandview对象
            emp.setPhoto(newfilename);
            int count = empService.update(emp);
            System.out.println(count);
        } else {

            empService.update(emp);
        }
        return "redirect:/emp/list";
    }

}
