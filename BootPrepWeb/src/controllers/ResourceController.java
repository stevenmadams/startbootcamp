package controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.BootPrepDAO;
import entities.Resource;
import entities.User;
import entities.UserResource;
import entities.UserResourceKey;

@Controller
@SessionAttributes({"userId","auth"})
public class ResourceController {

	@Autowired
	private BootPrepDAO dao;
	
	// Session Attributes
	@ModelAttribute("userId")
	public int initUserId() {
		return 0;
	}
	@ModelAttribute("auth")
	public String initAuth() {
		return "";
	}
	
	@RequestMapping(path="resourcelist.do")
	public ModelAndView listAllResources() {
		List<Resource> resources = new ArrayList<>();
		resources = dao.getAllResources();
		ModelAndView mv = new ModelAndView("resourcelist.jsp", "resources", resources); 
		return mv;
	}
	
	@RequestMapping(path="resourceadd.do")
	public ModelAndView addResourceToUser(@ModelAttribute("userId") int userId,
										  @ModelAttribute("auth") String auth,
										  int resourceId) {
		ModelAndView mv = new ModelAndView("resourcelist.jsp");
		dao.addResourceToUser(userId, resourceId);
		return mv;
	}
	
	@RequestMapping(path="resource.do")
	public ModelAndView viewResource(@ModelAttribute("userId") int userId,
			@ModelAttribute("auth") String auth,
			int resourceId) {
		
		ModelAndView mv = new ModelAndView("resource.jsp");
		Resource r = dao.getResourceById(resourceId);
		UserResourceKey key = new UserResourceKey(userId, resourceId);
		UserResource ur = dao.getUserResourceByKey(key);
		mv.addObject("userData", ur);
		mv.addObject("resource", r);
		return mv;
	}
	
	@RequestMapping(path="resourceRemove.do")
	public ModelAndView removeResourceFromUser(@ModelAttribute("userId") int userId,
											   @ModelAttribute("auth") String auth,
											   int resourceId) {
		ModelAndView mv = new ModelAndView("userprofile.jsp");
		User u = dao.removeResourceFromUser(userId, resourceId);
		mv.addObject("resources", u.getResources());
		return mv;
	}
	
	@RequestMapping(path="resourceCreate.do")
	public ModelAndView goToCreatePage(@ModelAttribute("userId") int userId,
			   @ModelAttribute("auth") String auth,
			   String url, String name, String description ) {
		ModelAndView mv = new ModelAndView("resourcecreate.jsp");
		Resource r = dao.createResource(new Resource(url, name, description));
		mv.addObject("newResource", r);
		return mv;
	}
	
}
