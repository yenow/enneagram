package com.enneagram.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {   // 이 인터페이스를 구현 
	// 접근제한시 다양한 처리를 하고싶다면 인터페이스 구현이 좋다

  @Override
  public void handle(HttpServletRequest request, 
      HttpServletResponse response, AccessDeniedException accessException)
      throws IOException, ServletException {

    log.error("Access Denied Handler");

    log.error("Redirect....");

    response.sendRedirect("/accessError");

  }

}
