package com.anneagram.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.anneagram.service.MemberService;
import com.anneagram.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController{

	@Autowired
	private MemberService memberSerivce;
    
	@RequestMapping("/member_info_update.jsp")
	public void member_info_update(){
		
	}
	
	
	/* 회원정보 페이지 */
	@RequestMapping("/member_info")
	public ModelAndView member_info(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = new MemberVO();
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(session.getAttribute("login")!=null) {
			System.out.println(((MemberVO)session.getAttribute("login")).getUser_id());
			memberVO = memberSerivce.login_confirm(((MemberVO)session.getAttribute("login")).getUser_id());
		}else {
			/* 혹시라도 로그인이 안된 상태에서 진입했을 경우, 경고창을 띄우고 메인페이지로 이동*/
			out.print("<script>"); 
			out.print("alert('로그인이 필요합니다');");
			out.print("location.href='/'");
			out.print("</script>");
		}
		mv.addObject("member_info", memberVO);
		mv.setViewName("/member/member_info");
		return mv;
	}
	
	/* 회원가입 페이지 */
	@RequestMapping("/member_insert")
	public void member_insert(){
		
	}
	
	/* 회원가입처리 */
	@RequestMapping("/member_insert_ok")
	public ModelAndView member_insert_ok(MemberVO m) {
		ModelAndView mv = new ModelAndView("redirect:/");
		memberSerivce.memberInsert(m);
		return mv;
	}

	@RequestMapping("/login")
	public void login() {
		
	}

	@RequestMapping("/login_ok")
	public void login_ok(MemberVO m, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		MemberVO member = memberSerivce.login_confirm(m.getUser_id()); // user_id로 member객체 정보 가져오기
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (member.getUser_pw() == null) {
			out.print("<script>"); 
			out.print("alert('아이디가없습니다');");
			out.print("history.back();");
			out.print("</script>"); 
			out.close();
		} else {
			if (member.getUser_pw().equals(m.getUser_pw())) {
				session.setAttribute("login", member); // login 성공할경우 "login"세션
				out.print("<script>"); 
				out.print("alert('로그인에 성공하셨습니다');");
				out.print("location.href='/'");
				out.print("</script>");
				
				/* 서버에서 redirect하면 왜 안될까?   PrintWriter  out.println랑  view호출을 동시에 하니까 에러가 난다.
				ServletContext sc = this.getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("http://localhost:8181/");
				rd.forward(request, response);*/
				out.close();
			} else {
				out.print("<script>"); 
				out.print("alert('비밀번호가 틀립니다');");
				out.print("history.back()");
				out.print("</script>"); 
				out.close();
			}
		}
		
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		return "redirect:/";
	}

}
