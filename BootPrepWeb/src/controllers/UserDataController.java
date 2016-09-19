package controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.BootPrepDAO;

@Controller
@SessionAttributes({"userId", "auth", "username"})
public class UserDataController {

	@Autowired
	private BootPrepDAO dao;
	
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
		
		@RequestMapping(path="userDataUpdate.do")
		public ModelAndView update(@ModelAttribute("userId") int id,
				@ModelAttribute("auth") String auth,
				@RequestParam("notes") String notes) {
			ModelAndView mv = new ModelAndView("resource.jsp");
			
			
			
			return mv;
		}
	
	
}
