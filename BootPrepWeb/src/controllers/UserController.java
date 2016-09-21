package controllers;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.BootPrepDAO;
import entities.Resource;
import entities.User;
import helpers.DateTimeHelper;

@Controller
@SessionAttributes({"userId", "auth", "username"})
public class UserController {

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
	
	
	
	@RequestMapping(path="useredit.do")
	public ModelAndView userEdit(@ModelAttribute("userId")int id) {
		User u = dao.getUserById(id);
		ModelAndView mv = new ModelAndView("useredit.jsp", "user", u);
		return mv;
	}


	@RequestMapping(path="usersubmitedit.do")
	public ModelAndView userSubmitEdit(@ModelAttribute("userId")int id, 
			String firstName, 
			String lastName, 
			String username,
			String email, 
			String createDate) {
		Date date = null;
		try {
			date = DateTimeHelper.stringToDate(createDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		User u = dao.updateUser(new User(firstName, lastName, username, email, date), id);
		ModelAndView mv = new ModelAndView("userprofile.jsp", "user", u);
		return mv;
	}

	@RequestMapping(path = "usercreate.do")
	public ModelAndView UserCreate(String firstName, String lastName, String username, String email,
			String createDate, String password) {
		User user = new User();
		// Create a user object
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		try {
			user.setCreateDate(DateTimeHelper.stringToDate(createDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		User u = dao.createUser(user);
		ModelAndView mv = new ModelAndView("usercreate.jsp", "user", u);
		return mv;
	}
	
	// Delete a user object
	@RequestMapping(path = "userdelete.do")
	public ModelAndView deleteUser(@ModelAttribute("userId") Integer id) {
		User user = dao.getUserById(id);
		ModelAndView mv = new ModelAndView("userprofile.jsp", "user", user);
		System.out.println("in userdelete.do/UserController");
		dao.deleteUser(id);
		mv.setViewName("userdelete.jsp");
		mv.addObject("user");
		System.out.println(user);
		return mv;
	}

	
	@RequestMapping(path="userListResources.do")
	public ModelAndView userListResources(@ModelAttribute("userId") Integer id,
			@ModelAttribute("auth") String auth) {
		ModelAndView mv = new ModelAndView("userprofile.jsp");
		List<Resource> resources = dao.getAllResourcesById(id);
		User u = dao.getUserById(id);
		mv.addObject("resources", resources);
		mv.addObject("user", u);
		return mv;
	}
}
