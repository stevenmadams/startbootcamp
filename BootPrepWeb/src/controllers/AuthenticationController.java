package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.BootPrepDAO;
import entities.User;

@Controller
@SessionAttributes({"userId","auth"}) // auth set to true only on successful login
public class AuthenticationController {

	@Autowired
	private BootPrepDAO dao;
	
	@ModelAttribute("userId")
	public int initUserId() {
		return 0;
	}
	@ModelAttribute("auth")
	public String initAuth() {
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
			} else {
				mv.addObject("userId", 0);
				mv.addObject("auth", "false");
			}
		}
		mv.addObject("user", u);
		return mv;
	}
	
}
