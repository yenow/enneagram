package com.enneagram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.enneagram.service.EnneagramService;
import com.enneagram.vo.EnneagramVO;

@Controller
@RequestMapping("/enneagram")
public class EnneagramController {

	@Autowired
	private EnneagramService enneagramService;
	
	/* 에니어그램 정보 가져오기 */
	@RequestMapping("/enneagram")
	public void enneagram(EnneagramVO en,Model m) {
		EnneagramVO e = enneagramService.select(en);  
		m.addAttribute("e", e);
	}
	
	/* 등록페이지 이동 */
	@RequestMapping("/registration")
	public void registration() {
		
	}
	
	/* 에니어그램 등록 */
	@RequestMapping("/regist")
	public String regist(EnneagramVO en) {
		System.out.println(en.getCategory());
		System.out.println(en.getContent());
		System.out.println(en.getType());
		System.out.println(en.getTitle());
		System.out.println(en.getEclass());
		enneagramService.insert(en);
		return "redirect:/";
	}
}
