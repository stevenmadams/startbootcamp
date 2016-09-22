package controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import dao.BootPrepDAO;
import entities.Resource;
import entities.Tag;
import entities.User;

@Controller
@SessionAttributes({"userId","auth", "username"}) // auth set to true only on successful login
public class AuthenticationController {

	@Autowired
	private BootPrepDAO dao;
	
	// Trying to do something like this to share session info across controllers. 
//	@Autowired
//	private SessionInfo sessionInfo;
	
	// Session Attributes
	// Session Attributes
		@ModelAttribute("userId")
		public int initUserId(HttpSession session) {
			Integer id = (Integer) session.getAttribute("userId");
			if (id != null) {
				return id;
			}
			return 0;
		}
		@ModelAttribute("auth")
		public String initAuth(HttpSession session) {
			String auth = (String) session.getAttribute("auth");
			if (auth != null) {
				return auth;
			}
			return "";
		}
		@ModelAttribute("username")
		public String initUserName(HttpSession session) {
			String username = (String) session.getAttribute("username");
			if (username != null) {
				return username;
			}
			return "";
		}
	
	@RequestMapping(path="userprofile.do")
	public ModelAndView getUser(@ModelAttribute("userId") int id,
			@ModelAttribute("auth") String auth,
			@RequestParam(value="username", required=false) String username,
			@RequestParam(value="password", required=false) String password) {
		User u = null;
		ModelAndView mv = new ModelAndView("userprofile.jsp");

		if (id > 0 && auth.equals("true")) {
			u = dao.getUserById(id);
			List<Resource> resources = dao.getAllResourcesById(u.getId());
			mv.addObject("resources", resources);
		}
		userLogin(mv, u, username, password);
		adminCheck(mv, u);
		mv.addObject("user", u);
		return mv;
	}
	
	@RequestMapping(path="logout.do")
	public String logout(SessionStatus status, Model model) {
		model.addAttribute("auth", "false");
		model.addAttribute("userId", 0);
		model.addAttribute("username", "");
		status.setComplete();
		return "index.jsp";
	}
	
	private void userLogin(ModelAndView mv, User u, String username, String password) {
		if (username != null && password != null) {
			u = dao.login(username, password);
			if (u != null) {
				mv.addObject("userId", u.getId());
				mv.addObject("auth", "true");
				mv.addObject("username", u.getUsername());
				List<Resource> resources = dao.getAllResourcesById(u.getId());
				mv.addObject("resources", resources);
			} else {
				mv.addObject("error", "Invalid username or password.");
				mv.addObject("userId", 0);
				mv.addObject("auth", "false");
			}
		}

	}
	
	private void adminCheck(ModelAndView mv, User u) {

		if (u != null && u.getPrivelege() > 0) {
			List<Resource> allResources = dao.getAllResources();
			List<User> allUsers = dao.getAllUsers();
			List<Tag> allTags = dao.getAllTags();
			mv.addObject("allResources", allResources);
			mv.addObject("allUsers", allUsers);
			mv.addObject("allTags", allTags);
		}
	}
	
}
