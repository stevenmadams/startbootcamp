package controllers;

import java.text.ParseException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.BootPrepDAO;
import entities.User;
import helpers.DateTimeHelper;

@Controller
@SessionAttributes("userId")
public class BootPrepController {

	@Autowired
	private BootPrepDAO dao;
	
	@ModelAttribute("userId")
	public int initUserId() {
		return 0;
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
			} else {
				mv.addObject("userId", 0);
			}
		}
		mv.addObject("user", u);
		return mv;
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
	
	
	
}
