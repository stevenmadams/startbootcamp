package controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.BootPrepDAO;
import entities.Resource;

@Controller
@SessionAttributes({"userId","auth"})
public class ResourceController {

	@Autowired
	private BootPrepDAO dao;
	
	@RequestMapping(path="resourcelist.do")
	public ModelAndView listAllResources() {
		List<Resource> resources = new ArrayList<>();
		resources = dao.getAllResources();
		return new ModelAndView("resourcelist.jsp", "resources", resources);
	}
	
	
}
