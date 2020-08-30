package com.enneagram.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.enneagram.service.AdminService;
import com.enneagram.service.MemberService;
import com.enneagram.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;




@Controller
@RequestMapping("admin")
@Slf4j
public class AdminController {
	//private static final Logger LOG = LoggerFactory.getLogger(AdminController.class);  이걸써도되
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private MemberService memberService;
	
	// 관리자 로그인
	@RequestMapping("login")
	public String login(HttpSession session) {
		// 만약 이미 로그인이 되어있고, 그 로그인된사람이 관리자 권한을 가지고 있다면, 바로 관리자 페이지로 이동
		MemberVO member = (MemberVO) session.getAttribute("login");
		if(member!=null) {
			if(member.getCategory().equals("관리자")) {
				return "redirect:/admin/memberManage";
			}
		}
		return "admin/login";
	}
	
	@RequestMapping("login_ok")
	public void login_ok(MemberVO m, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		MemberVO member = memberService.login_confirm(m.getId());
		PrintWriter out = response.getWriter();

		if(member==null) {
			System.out.println(1);
			out.print("<script>");
			out.print("alert('아이디가없습니다');");
			out.print("location.href='"+request.getContextPath()+"/admin/login';");
			out.print("</script>");
		}else {
			if(!(member.getPassword().equals(m.getPassword()))) {
				out.print("<script>");
				out.print("alert('비밀번호가 같지 않습니다');");
				out.print("location.href='"+request.getContextPath()+"/admin/login';");
				out.print("</script>");
			}else {
				if(member.getCategory().equals("관리자")) {
					session.setAttribute("login", member);
					out.print("<script>");
					out.print("location.href='"+request.getContextPath()+"/admin/memberManage';");
					out.print("</script>");
				}else {
					out.print("<script>");
					out.print("alert('관리자 아이디가 아닙니다');");
					out.print("location.href='"+request.getContextPath()+"/admin/memberManage';");
					out.print("</script>");
				}
			}
			
		}
		out.close();
	}
	
	//회원 관리 페이지 이동
	@RequestMapping("/memberManage")
	public void memberManage() {
		
	}
	
	//게시글 관리 페이지 이동
	@RequestMapping("/boardManage")
	public void boardManage() {
		
	}
	
	//댓글 관리 페이지 이동
	@RequestMapping("/replyManage")
	public void replyManage() {
		
	}
	
	@RequestMapping("/dashboard")
	public void dashboard() {
		
	}
	
	@RequestMapping("/icons")
	public void icons() {
		
	}
	
	@RequestMapping("/maps")
	public void maps() {
		
	}
	
	@RequestMapping("/notifications")
	public void notifications() {
		
	}
	
	@RequestMapping("/table")
	public void table() {
		
	}
	
	@RequestMapping("/template")
	public void template() {
		
	}
	
	@RequestMapping("/typography")
	public void typography() {
		
	}
	
	@RequestMapping("/upgrade")
	public void upgrade() {
		
	}
	
	@RequestMapping("/user")
	public void user() {
		
	}
}
