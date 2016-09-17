package controllers;

import java.text.ParseException;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(method = RequestMethod.GET)
    public String viewRegistration (Map<String, Object> model) {
        User userForm = new User();    
        model.put("userForm", userForm);
         
//        List<String> professionList = new ArrayList<>();
//        professionList.add("Hobbyist");
//        professionList.add("Will attend a coding boot camp");
//        professionList.add("");
//        model.put("professionList", professionList);
         
        return "Registration";
    }
	
	@RequestMapping(method = RequestMethod.POST)
    public String processRegistration(@ModelAttribute("userForm") User user,
            Map<String, Object> model) {
         
        // implement your own registration logic here...
         
        // for testing purpose:
        System.out.println("First Name: " + user.getFirstName());
        System.out.println("Last Name: " + user.getLastName());
        System.out.println("Username: " + user.getUsername());
        System.out.println("Password: " + user.getPassword());
        System.out.println("E-mail: " + user.getEmail());
        System.out.println("Start date: " + user.getCreateDate());
       // System.out.println("profession: " + user.getProfession());
         
        return "RegistrationSuccess";
    }
}
