package controllers;

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
			@RequestParam(value="username", required=false) String username,
			@RequestParam(value="password", required=false) String password) {
//		System.out.println(id);
		User u = null;
		ModelAndView mv = new ModelAndView("userprofile.jsp");
		if (username != null && password != null) {
			u = dao.login(username, password);
			if (u != null) {
				mv.addObject("userId", u.getId());
				mv.addObject("auth", "true");
				mv.addObject("username", u.getUsername());
			} else {
				mv.addObject("userId", 0);
				mv.addObject("auth", "false");
			}
		}
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
	
}
