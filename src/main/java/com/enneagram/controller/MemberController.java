package com.enneagram.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.enneagram.service.EnneagramService;
import com.enneagram.service.MemberService;
import com.enneagram.vo.EnneagramVO;
import com.enneagram.vo.MemberVO;
import com.enneagram.vo.PersonalityVO;

@Controller
@RequestMapping("/member")
public class MemberController{

	@Autowired
	private MemberService memberSerivce;
	@Autowired
	private EnneagramService enneagramService;
    
	
	/* 윤신영 - 네이버 콜백함수 */
	@RequestMapping("callback")
	public String callback(String state, String code, HttpServletRequest request, HttpServletResponse response, Model m) throws IOException {
		
		memberSerivce.naverlogin(state,code,request,response,m);
		/*
		PrintWriter out = response.getWriter();

		String clientId = "zu4797T1LS7jgoNCtB7V";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "7PAKNjszhO";// 애플리케이션 클라이언트 시크릿값";
		String redirectURI = URLEncoder.encode("http://localhost:8383/enneagram/member/callback", "UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		String access_token = "";
		String refresh_token = "";
		System.out.println("apiURL=" + apiURL);
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.print("responseCode=" + responseCode);
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}

			br.close();
			if (responseCode == 200) {
				out.println(res.toString());
				System.out.println();
				System.out.println(res.toString());   // 문자열로 Json  이네,,  여기에 접근토큰  , refresh_token , token_type, expires_in 이런 속성값들이 있ㄷ음,, 이걸 파싱해야함
				// 이거 json 형태 데이터인데 변환하는거 필요함
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		*/

		/* 여기서부터 데이터베이스에 회원테이블에 저장을 하고 만약 똑같은 사람이 있으면 안하고, 
		 * 로그인을 한거니까 로그인 세션에 등록을 해야지
		 * */
		
		return "redirect:/";
	}
	
	/* 마이페이지 */
	@RequestMapping("myPage")
	public void myPage() {
		
	}
	
	/* select태그에서 변경시 아작스로 성격 반환 */
	@RequestMapping("/myTypeAjax")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> myTypeAjax(int pno){
		ResponseEntity<Map<String,Object>> re;
		try {
			
			PersonalityVO p = memberSerivce.myPersonaltiy(pno);
			
			EnneagramVO e = new EnneagramVO();
			e.setCategory("eclass");
			e.setEclass(p.getEclass());
			EnneagramVO eclass= enneagramService.select(e);
			e.setCategory("type");
			e.setType(p.getType());
			EnneagramVO type= enneagramService.select(e);
			
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("eclass", eclass);
			map.put("type", type);
			map.put("typeData", p);
			
			re = new ResponseEntity(map, HttpStatus.OK);
			return re;
		} catch (Exception e) {
			return new ResponseEntity("fail", HttpStatus.BAD_REQUEST);
		}

	}
	
	/* 마이페이지 - 내 성향*/
	@RequestMapping("/mytype")
	public String mytype(HttpSession session,Model model,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		
		int mno;
		if(session.getAttribute("login")==null) {
			/*
			 * out.print("<script>"); out.print("alert('로그인이 필요합니다');");
			 * out.print("location.href='/enneagram';"); // 이런거,, contextRoot를 가져와야하는데..
			 * out.print("</script>");
			 */
			return "redirect:/member/login";
		}else {
			mno = ((MemberVO)session.getAttribute("login")).getMno();
			System.out.println(mno);
		}
		
		/* 내 검사 리스트를 가져옴*/
		List<PersonalityVO> pList = memberSerivce.myPersonaltiyList(mno);
		
		PersonalityVO recently = new PersonalityVO();
		EnneagramVO eclass =  new EnneagramVO();
		EnneagramVO type = new EnneagramVO();
		
		/* 검사결과가 없을경우 */
		if(pList.isEmpty()==true) {
			System.out.println("리스트 없음");
		}else {
			/* 가장 최근의 성향 가져오기*/
			recently = pList.get(0);
			Date recent = pList.get(0).getRegdate();
			System.out.println(recent.getTime());
			for(PersonalityVO p : pList) { 
				System.out.println(p.getRegdate());
				System.out.println(p.getRegdate().getTime());
				if(recent.getTime() - p.getRegdate().getTime() < 0) {
					recent = p.getRegdate();
					recently = p;
				}
			}
		
			/*  pList sort 작업,,  가장 최신의 테스트가 맨 앞쪽으로감 */
			pList.sort(new Comparator<PersonalityVO>() {

				@Override
				public int compare(PersonalityVO o1, PersonalityVO o2) {
					if(o1.getRegdate().getTime() - o2.getRegdate().getTime() < 0) {
						return 1;
					}
					return -1;
				}
			});
			
			EnneagramVO e = new EnneagramVO();
			e.setCategory("eclass");
			e.setEclass(recently.getEclass());
			eclass= enneagramService.select(e);
			e.setCategory("type");
			e.setType(recently.getType());
			type= enneagramService.select(e);
			
			System.out.println(eclass);
			System.out.println(eclass.getEclass());
			System.out.println(type);
			System.out.println(type.getType());
			
			model.addAttribute("pList", pList);
			model.addAttribute("recently", recently);
			model.addAttribute("eclass", eclass);
			model.addAttribute("type", type);
			
		}

		return "/member/mytype";
	}
	
	/* 비밀번호 확인 -> 개인정보수정페이지 */
	@RequestMapping("member_info_check_ok")
	public void member_info_check_ok(String password,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		PrintWriter out = response.getWriter();
		/* 여기부터시작 */
		if(memberVO.getPassword().equals(password)) {
			out.print("<script>");
			out.print("location.href='/enneagram/member/member_info';");  // 컨텍스트루트...
			out.print("</script>");
		}else {
			out.print("<script>");
			out.print("alert('비밀번호가 같지 않습니다');");
			out.print("location.href='/enneagram/member/myPage';");
			out.print("</script>");
		}
	}
	
	/* 회원정보 수정 처리 */
	@RequestMapping("/member_info_update_ok")
	public void member_info_update_ok(MemberVO memberVO,HttpServletRequest request,HttpServletResponse response) {
		/* 처음알았다.. form으로 값 넘길때, name값이 같은게 있으면 'ㅇㅇㅇ','ㅇㅇㅇ'  이런식으로 값이 넘어오는군*/
		memberSerivce.memberUpdate(memberVO);
		PrintWriter out;
		
		try {
			out = response.getWriter();
			out.print("<script>");
			out.print("alert('수정되었습니다');");
			out.print("location.href='"+request.getContextPath()+"';");
			out.print("</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/* 회원정보수정 페이지 */
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
	public void member_insert_ok(MemberVO m, HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView("redirect:/");
		PrintWriter out = response.getWriter();
		try {
			memberSerivce.memberInsert(m);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("<script>"); 
			out.print("alert('아이디가 중복되었습니다');");
			out.print("history.back();");
			out.print("</script>"); 
			out.close();
			
		}
		out.print("<script>"); 
		out.print("alert('아이디를 입력해주세요');");
		out.print("location.href='/enneagram';");
		out.print("</script>"); 
		out.close();
		
	}

	public String generateState() {
		SecureRandom random = new SecureRandom();
		return new BigInteger(130, random).toString(32);
	}
	
	@RequestMapping("/login")
	public void login(HttpServletRequest request,Model m) throws UnsupportedEncodingException {
		String state = generateState();
		request.getSession().setAttribute("state", state);

		String clientId = "zu4797T1LS7jgoNCtB7V";// 애플리케이션 클라이언트 아이디값";
		String redirectURI = URLEncoder.encode("http://localhost:8383/enneagram/member/callback", "UTF-8");
		SecureRandom random = new SecureRandom();
		// String state = new BigInteger(130, random).toString();
		String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&state=" + state;
		m.addAttribute("apiURL", apiURL);
	}

	@RequestMapping("/login_ok")
	public void login_ok(MemberVO m, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		MemberVO member = memberSerivce.login_confirm(m.getId()); // user_id로 member객체 정보 가져오기
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
		System.out.println(member);
		if(m.getId()==null) {
			out.print("<script>"); 
			out.print("alert('아이디를 입력해주세요');");
			out.print("history.back();");
			out.print("</script>"); 
			out.close();
		}
		
		if (member.getPassword() == null) {
			out.print("<script>"); 
			out.print("alert('아이디가없습니다');");
			out.print("history.back();");
			out.print("</script>"); 
			out.close();
		} else {
			if (member.getPassword().equals(m.getPassword())) {
				session.setAttribute("login", member); // login 성공할경우 "login"세션
				out.print("<script>"); 
				out.print("alert('로그인에 성공하셨습니다');");
				out.print("location.href='/enneagram';");
				out.print("</script>");
				
				/* 서버에서 redirect하면 왜 안될까?   PrintWriter  out.println랑  view호출을 동시에 하니까 에러가 난다.
				ServletContext sc = this.getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("http://localhost:8181/");
				rd.forward(request, response);*/
				out.close();
			} else {
				out.print("<script>"); 
				out.print("alert('비밀번호가 틀립니다');");
				out.print("history.back();");
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
