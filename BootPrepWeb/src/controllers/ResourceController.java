package controllers;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.PersistenceException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.jpa.JpaSystemException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.BootPrepDAO;
import entities.Resource;
import entities.ResourceTag;
import entities.User;
import entities.UserData;
import entities.UserDataKey;

@Controller
@SessionAttributes({"userId","auth", "username"})
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
	@ModelAttribute("username")
	public String initUserName() {
		return "";
	}
	
	@RequestMapping(path="resourcelist.do")
	public ModelAndView listAllResources(@ModelAttribute("userId") int userId,
										 String view) {
		List<Resource> resources = new ArrayList<>();
		ModelAndView mv = new ModelAndView("resourcelist.jsp");
		if (view == null) view = "";
		switch (view) {
		case "add":
			resources = dao.getAllResourcesNotAdded(userId);
			mv.addObject("add", true);
			break;
		case "my":
			resources = dao.getAllResourcesById(userId);
			break;
		default:
			resources = dao.getAllResources();
			break;
		}
		mv.addObject("resources", resources); 
		return mv;
	}
	
	@RequestMapping(path="resourceadd.do")
	public ModelAndView addResourceToUser(@ModelAttribute("userId") int userId,
										  @ModelAttribute("auth") String auth,
										  Integer resourceId) {
		dao.addResourceToUser(userId, resourceId);
		return listAllResources(userId, "my");
	}
	
	@RequestMapping(path="resource.do")
	public ModelAndView viewResource(@ModelAttribute("userId") int userId,
			@ModelAttribute("auth") String auth,
			Integer resourceId) {
		ModelAndView mv = new ModelAndView("resource.jsp");
		mv = viewLoader(mv, userId, resourceId);
		return mv;
	}
	
	@RequestMapping(path="resourceRemove.do")
	public ModelAndView removeResourceFromUser(@ModelAttribute("userId") int userId,
									   @ModelAttribute("auth") String auth,
									   @RequestParam(value="view", required=false) String view,
									   Integer resourceId) {
		ModelAndView mv = new ModelAndView();
		User u = dao.removeResourceFromUser(userId, resourceId);
		if (view.equals("list")) {
			return listAllResources(userId, "my");
		} else if (view.equals("resource")) {
			mv.setViewName("resource.jsp");
			viewLoader(mv, userId, resourceId);
		} else {
			mv.setViewName("userprofile.jsp");
		}
		mv.addObject("user", u);
		if (u != null ) mv.addObject("resources", u.getResources());
		return mv;
	}
	
	@RequestMapping(path="resourceCreate.do")
	public ModelAndView goToCreatePage(@ModelAttribute("userId") int userId,
			   @ModelAttribute("auth") String auth,
			   String url, String name, String description, String video, String photo ) {
		ModelAndView mv = new ModelAndView("resourcelist.jsp");
		Resource input = validResource(url, name, description, video, photo);
		if (input == null) {
			mv.addObject("error", "Resource name can't be blank. Video must be a YouTube link.");
			mv.setViewName("resourcecreate.jsp");
			return mv;
		}
		Resource r = dao.createResource(input);
		return listAllResources(userId, "add");
	}
	
	private Resource validResource(String url, String name, String description, String video, String photo) {
		video = urlParse(video);
		if (name != null && name.trim().equals("")) {
			return null;
		}
		if (url != null && url.trim().equals("")) {
			return null;
		}
		return new Resource(url, name, description, video, photo);
	}
	
	private String urlParse(String video) {
		String formatted = "";
		if (!video.contains("youtube.com")) {
			return formatted;
		} else if (video.contains("youtube.com") && video.contains("watch\\?v=")) {
	System.out.println("HERE..." + video);
			String[] split = video.split("watch\\?v=");
			for (String string : split) {
				System.out.println(string);
			}
			formatted = split[0]+"embed/"+split[1];
		} else {
			return video;
		}
		return formatted;
	}
	
	@RequestMapping(path="resourceTagEdit.do")
	public ModelAndView addTagToResource(@ModelAttribute("userId") int userId,
			@ModelAttribute("auth") String auth,
			@RequestParam(value="action", required=false) String action, 
			@RequestParam(value="tagName", required=false) String tagName,
			@RequestParam(value="tagId", required=false) Integer tagId,
			Integer resourceId) {
		ModelAndView mv = new ModelAndView("resource.jsp");
		Resource r = null;
		if (userId == 0 || auth != "true") {
			mv.setViewName("userprofile.jsp");
			return mv;
		}
		switch (action) {
		case "add":
			addTag(mv, tagName, userId, resourceId);
			break;
		case "remove":
			removeTag(mv, userId, resourceId, tagId);
			break;
		default:
			viewLoader(mv, userId, resourceId);
			break;
		}
		return mv;
	}
	
	private void addTag(ModelAndView mv, String tagName, int userId, int resourceId) {
		Resource r = null;
		try { // exception thrown if resource already has the tag
			r = dao.addTagToResource(tagName, userId, resourceId);
		} catch (PersistenceException pe) {
			r = dao.getResourceById(resourceId);
			mv.addObject("error", "Resource already has this tag.");
		}
		viewLoader(mv, userId, resourceId);
	}
	
	private void removeTag(ModelAndView mv, int userId, int resourceId, int tagId) {
		Resource r = null;
		r = dao.removeTagFromResource(userId, resourceId, tagId);
		if (r == null) {
			mv.addObject("error", "Can only remove tags that you created.");
			r = dao.getResourceById(resourceId);
		}
		viewLoader(mv, userId, resourceId);
	}
	
	// general load things into view via the needed IDs
	private ModelAndView viewLoader(ModelAndView mv, int userId, int resourceId) {
		UserDataKey key = new UserDataKey(userId, resourceId);
		UserData ur = dao.getUserDataByKey(key);
		List<Integer> rtags = dao.resourceTagUserIds(userId, resourceId);
		if (ur != null && ur.getUser().getId() == userId) {
			mv.addObject("userHasResource", true);
		}
		Resource r = dao.getResourceById(resourceId);
		mv.addObject("userData", ur);
		mv.addObject("resource", r);
		mv.addObject("rTags", rtags);
		return mv;
	}
	
	
}
