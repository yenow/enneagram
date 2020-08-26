package com.enneagram.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) //  Authentication 사용자가 가진 권한
			throws IOException, ServletException {

		log.warn("Login Success");

		List<String> roleNames = new ArrayList<>();  // 권한 롤 이름

		auth.getAuthorities().forEach(authority -> {

			roleNames.add(authority.getAuthority());

		});   // 사용자가 가진 권한을 roleNAmes에 담네

		log.warn("ROLE NAMES: " + roleNames);

		if (roleNames.contains("ROLE_ADMIN")) {   // 권한에 따라서 다른 페이지로 이동하게하네

			response.sendRedirect("/sample/admin");
			return;
		}

		if (roleNames.contains("ROLE_MEMBER")) {   // 권한에 따라서 다른 페이지로 이동하게하네

			response.sendRedirect("/sample/member");
			return;
		}

		response.sendRedirect("/");
	}
}


