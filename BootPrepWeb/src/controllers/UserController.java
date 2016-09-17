package controllers;

import java.text.ParseException;
import java.util.Date;
import java.util.Map;

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
	
	public UserDetails loadUserByUsername(String login)
            throws UsernameNotFoundException {
         
        User user = bootPrepDAO.getUser(login);
 
        return new User(
                user.getFirstName(), 
                user.getLastName(), 
                user.getUsername(), 
                user.getEmail(), 
                user.getPassword(), 
                user.getCreateDate().getId()));
	
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
	
	@RequestMapping(path="usercreate.do" method = RequestMethod.GET)
    public String UserCreate (Map<String, Object> model) {
        User userForm = new User();    
        model.put("userForm", userForm);
         
        return "Registration";
    }
	
	@RequestMapping(path="userprocess.do" method = RequestMethod.POST)
    public String userProcess(@ModelAttribute("userForm") User user,
            Map<String, Object> model) {
         
        // implement our user logic in the space......
         
        // for testing purpose:
        System.out.println("First Name: " + user.getFirstName());
        System.out.println("Last Name: " + user.getLastName());
        System.out.println("Username: " + user.getUsername());
        System.out.println("Password: " + user.getPassword());
        System.out.println("E-mail: " + user.getEmail());
        System.out.println("Start date: " + user.getCreateDate());
         
        return "RegistrationSuccess";
    }
	
	@RequestMapping(path= "userdelete.do" method = RequestMethod.DELETE)
	public String deleteUser(@PathVariable int userId) {
	  this.deleteUser(userId);
	  return "delete:/users/" + userId;
	}
}
