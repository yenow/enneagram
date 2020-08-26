
package com.enneagram.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/sample/*")
@Controller
public class SampleController3 {

	@GetMapping("/all")   // 로그인을 하지 않은 사용자도 접근가능한 URI
	public void doAll() {

		log.info("do all can access everybody");
	}

	@GetMapping("/member")     // 로그인을 한 사용자들만이 접근할수 있는 URI
	public void doMember() {

		log.info("logined member");
	}

	@GetMapping("/admin")  // 로그인을 한 사용자들 중에서 관리자 권한을 가진 사용자만이 접근할수 있는 uri
	public void doAdmin() {

		log.info("admin only");
	}

	/*
	 * @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
	 * 
	 * @GetMapping("/annoMember") public void doMember2() {
	 * 
	 * log.info("logined annotation member"); }
	 * 
	 * @Secured({ "ROLE_ADMIN" })
	 * 
	 * @GetMapping("/annoAdmin") public void doAdmin2() {
	 * 
	 * log.info("admin annotaion only"); }
	 */

}
