package controllers;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.BootPrepDAO;
import entities.Resource;
import entities.Tag;
import entities.User;
import helpers.DateTimeHelper;

@Controller
public class AdminController {
	
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
		
		@RequestMapping(path="admin.do")
		public ModelAndView adminEdit(@ModelAttribute("userId") int myId,
				@ModelAttribute("auth") String auth,
				@RequestParam(value="targetUserId", required=false) Integer targetUserId,
				@RequestParam("action") String action,
				@RequestParam(value="tagId", required=false) Integer tagId,
				@RequestParam(value="resourceId", required=false) Integer resourceId) {
			ModelAndView mv = new ModelAndView("userprofile.jsp");
			switch (action) {
			case "deleteTagDb":
				dao.deleteTagFromDb(tagId);
				break;
			case "deleteResource":
				System.out.println(resourceId + "...In admin.do");
				dao.deleteResource(resourceId);
				break;
			case "deleteTag":
				dao.deleteTagFromResource(resourceId, tagId);
				break;
			case "deleteUser":
				dao.deleteUser(targetUserId);
				break;
			case "addAdmin":
				dao.makeAdmin(targetUserId);
				break;
			case "removeAdmin":
				dao.removeAdmin(targetUserId);
				break;
			default:
				break;
			}
			reloadView(mv, myId, auth);
			return mv;
		}
		
		private void reloadView(ModelAndView mv, int id, String auth) {
			List<Resource> allResources = dao.getAllResources();
			List<User> allUsers = dao.getAllUsers();
			List<Tag> allTags = dao.getAllTags();
			User admin = dao.getUserById(id);
			mv.addObject("userId", id);
			mv.addObject("auth", true);
			mv.addObject("user", admin);
			mv.addObject("allResources", allResources);
			mv.addObject("allUsers", allUsers);
			mv.addObject("allTags", allTags);
		}
		
		@RequestMapping(path="adminsubmitedit.do")
        public ModelAndView userSubmitEdit(int userId, 
                String firstName, 
                String lastName, 
                String username,
                String password,
                String email, 
                String userPhoto,
                String createDate) {
            Date date = null;
            try {
                date = DateTimeHelper.stringToDate(createDate);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            User input = new User(firstName, lastName, username, email, userPhoto, date);
            input.setPassword(password);
            User u = dao.updateUser(input, userId);
            ModelAndView mv = new ModelAndView("userprofile.jsp", "user", u);
            return mv;
        }
	
}
