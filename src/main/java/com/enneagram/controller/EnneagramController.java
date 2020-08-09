package com.enneagram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.enneagram.service.EnneagramService;

@Controller
@RequestMapping("/enneagram")
public class EnneagramController {

	@Autowired
	private EnneagramService enneagramService;
	
	@RequestMapping("/enneagram")
	public void enneagram() {
		
	}
	
	@RequestMapping("/registration")
	public void registration() {
		
	}
	
	@RequestMapping("/write")
	public void write() {
		
	}
	
	@RequestMapping("/regist")
	public void regist(@RequestParam("editordata") String editordata) {
		System.out.println(editordata);
	}
}
