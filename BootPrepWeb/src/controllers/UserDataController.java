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
import entities.Resource;
import entities.UserData;
import entities.UserDataKey;

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
		public ModelAndView update(@ModelAttribute("userId") int userId,
				@ModelAttribute("auth") String auth,
				@RequestParam("resourceId") Integer resourceId,
				@RequestParam(value="notes", required=false) String notes,
				@RequestParam(value="completed", required=false) boolean completed,
				@RequestParam(value="rating", required=false) Integer rating) {
			ModelAndView mv = new ModelAndView("resource.jsp");
System.out.println("Notes send to controlelr: " + notes);
			Resource r = dao.getResourceById(resourceId);
			UserDataKey key = new UserDataKey(userId, resourceId);
			UserData updated = new UserData(rating, notes, !completed);
			updated = dao.updateUserData(key, updated);
			mv.addObject("resource", r);
			mv.addObject("userData", updated);
System.out.println("Sent out of controller:" + updated.getNotes());
			return mv;
		}
	
	
}
