package controllers;

import java.text.ParseException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.BootPrepDAO;
import entities.User;
import helpers.DateTimeHelper;

@Controller
@SessionAttributes("userId")
public class UserController {

	@Autowired
	private BootPrepDAO dao;

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
			String createDate) {
		System.out.println("at start of usercreate.do");
		User user = new User();

		// Create a user object
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setUsername(username);
		user.setEmail(email);

		try {
			user.setCreateDate(DateTimeHelper.stringToDate(createDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		System.out.println("at end of usercreate.do");

		User u = dao.createUser(user);
		ModelAndView mv = new ModelAndView("usercreate.jsp", "user", u);
		return mv;
	}
}
