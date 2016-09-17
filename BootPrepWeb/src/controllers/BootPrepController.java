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
	
	
	
	
	
	
	
}
