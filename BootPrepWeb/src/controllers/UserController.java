package controllers;

import java.text.ParseException;
import java.util.ArrayList;
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
	
	@ModelAttribute("users")
	public List<User> initSessionObject() {
		ArrayList<User> users = new ArrayList<>();
		return users;
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
			String password,
			String email, 
			String userPhoto,
			String createDate) {
//		Date date = null;
//		try {
//			date = DateTimeHelper.stringToDate(createDate);
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
		ModelAndView mv = new ModelAndView("userprofile.jsp");
		User input = validInputs(firstName, lastName, username, email, createDate, userPhoto, password);
		User u = null;
		if (input == null) {
			u = dao.getUserById(id);
			mv.setViewName("useredit.jsp");
			mv.addObject("user", u);
			return mv;
		}
		u = dao.updateUser(input, id);
		mv.addObject("user", u);
		return mv;
	}

	@RequestMapping(path = "usercreate.do")
	public ModelAndView UserCreate(String firstName, String lastName, String username, String email,
			String createDate, String password, String userPhoto) {
		User user = validInputs(firstName, lastName, username, email, createDate, userPhoto, password);
		ModelAndView mv = new ModelAndView("userprofile.jsp");
		if (user == null) {
			mv.setViewName("usercreate.jsp");
			mv.addObject( "error", "username must be 4 characters minimum, "
						+ "password must be 8 characters minimum.");
			return mv;
		}
		// Create a user object
		User u = createUser(mv, user);
		mv.addObject("user", u);
		return mv;
	}
	
	private User createUser(ModelAndView mv, User input) {
		int code = 0;
		User u = null;
		if ((code = dao.validUsernameAndEmail(input)) == 0) {
			u = dao.createUser(input);
			u = dao.login(u.getUsername(), u.getPassword());
			if (u != null) {
				mv.addObject("userId", u.getId());
				mv.addObject("auth", "true");
				mv.addObject("username", u.getUsername());
			} else {
				mv.addObject("error", "Error logging in. Please try again.");
			}
		} else {
			mv.addObject("error", setError(code));
		}
		return u;
	}
	
	private User validInputs(String firstName, String lastName, String username, 
			String email, String createDate, String userPhoto, String password) {
		User user = new User();
		String[] inputs = {firstName, lastName, username, email, password};
		for (String input : inputs) {
			if (input != null && emptyString(input)) {
				System.out.println("******************In if: "+input);
				return null;
			}
		}
		if (password.length() < 8) return null;
		if (username.length() < 4) return null;
		user.setFirstName(firstName.trim());
		user.setLastName(lastName.trim());
		user.setUsername(username.trim());
		user.setUserPhoto(userPhoto);
		user.setPassword(password);
		user.setEmail(email);
		try {
			user.setCreateDate(DateTimeHelper.stringToDate(createDate));
		} catch (ParseException e) { }
		return user;
	}
	
	private boolean emptyString(String input) {
		return input.trim().equals("");
	}
	
	private String setError(int code) {
		switch (code) {
		case -1:
			return "The requested username and email are already associated with an account.";
		case 1:
			return "That username is already taken";
		case 2:
			return "That email address is already being used";
		default:
			return "Error. Could not complete action.";
		}
	}
	
	// Delete a user object
	@RequestMapping(path = "userdelete.do")
	public String deleteUser(@ModelAttribute("userId") Integer id) {
		User user = dao.getUserById(id);
		ModelAndView mv = new ModelAndView("userprofile.jsp", "user", user);
		dao.deleteUser(id);
		return "redirect:/logout.do";
	}

	// Fill table for all users----------------------------------------------
	@RequestMapping(path = "getuser.do")
	public ModelAndView getVehicles(@ModelAttribute("user") List<User> user) {
		ModelAndView mv = new ModelAndView("admin.jsp");
		System.out.println("in getuser.do");
		mv.addObject("users", dao.getUser());
		System.out.println(user.size());
		mv.setViewName("userslist.jsp");
		System.out.println(dao.getUser()); // debug statement
		return mv;
	}
	
	@RequestMapping(path="userListResources.do")
	public ModelAndView userListResources(@ModelAttribute("userId") Integer id,
			@ModelAttribute("auth") String auth) {
		ModelAndView mv = new ModelAndView("userprofile.jsp");
		User u = dao.getUserById(id);
		List<Resource> resources = dao.getAllResourcesById(id);
		mv.addObject("resources", resources);
		mv.addObject("user", u);
		return mv;
	}
}
