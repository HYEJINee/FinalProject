package com.four.myapp;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/read/*")
public class ReadController {
	
	@RequestMapping(value="read", method=RequestMethod.GET)
	public String registGet() {
		return "read/read";
	}
	
}
