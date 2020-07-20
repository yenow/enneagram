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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.anneagram.service.MemberService;
import com.anneagram.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController{

	@Autowired
	private MemberService memberSerivce;
    

	@RequestMapping("member_info_check")
	public void member_info_check() {
		
	}
	
	@RequestMapping("member_info_check_ok")
	public void member_info_check_ok(String password,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
			
		/* 여기부터시작 */
		if(memberVO.getUser_pw().equals(password)) {
			
		}else {
			
		}
	}
	
	/* 회원정보 수정 처리*/
	@RequestMapping("/member_info_update_ok")
	public void member_info_update_ok(MemberVO memberVO,HttpServletRequest request,HttpServletResponse response) {
		/* 처음알았다.. form으로 값 넘길때, name값이 같은게 있으면 'ㅇㅇㅇ','ㅇㅇㅇ'  이런식으로 값이 넘어오는군*/
		memberSerivce.memberUpdate(memberVO);
		PrintWriter out;
		
		try {
			out = response.getWriter();
			out.print("<script>");
			out.print("alert('수정되었습니다');");
			out.print("location.href='/';");
			out.print("</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/* 회원정보 수정 페이지 */
	@RequestMapping("/member_info_update")
	public String member_info_update(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		PrintWriter out = response.getWriter();
		/* 로그인이 안되어 있으면 경고창을 띄우고 싶음... ok페이지를 따로 만들어야하는듯*/
		if(session.getAttribute("login")==null){
			return "redirect:/member/login";
		}
		
		return "/member/member_info_update";
	
	}
	
	/* 회원정보 페이지 */
	@RequestMapping("/member_info")
	public String member_info(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException {	   // 리턴값이 void 일경우,, 매
		/* 혹시라도 로그인이 안된 상태에서 진입했을 경우, 경고창을 띄우고 메인페이지로 이동*/
		/*
		if(session.getAttribute("login")==null) {
			PrintWriter out = response.getWriter();
			out.print("<script>"); 
			out.print("alert('로그인이 필요합니다');");
			out.print("location.href='/member/login'");
			out.print("</script>");
		}
		*/
		//return "/member/member_info";
		
		PrintWriter out = response.getWriter();
		/* 로그인이 안되어 있으면 */
		if(session.getAttribute("login")==null){
			session.setAttribute("notLoginAccess", true);
			/* 스크립트 작동이 안됨  */
			return "redirect:/member/login";
		}
		
		return "/member/member_info";
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
		PrintWriter out = response.getWriter();

		/*
		System.out.println((boolean)session.getAttribute("notLoginAccess"));
		if(session.getAttribute("notLoginAccess")!=null) {
			if((boolean)session.getAttribute("notLoginAccess")==true) {
				System.out.println((boolean)session.getAttribute("notLoginAccess"));
				out.print("<script>"); 
				out.print("alert('로그인이 필요합니다');");
				out.print("</script>"); 
				session.setAttribute("notLoginAccess", false);
			}	
		}
		*/
		
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
				out.print("location.href='/';");
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
