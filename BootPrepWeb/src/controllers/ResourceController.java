package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import dao.BootPrepDAO;

@Controller
public class ResourceController {

	@Autowired
	private BootPrepDAO dao;
	
	
	
}
