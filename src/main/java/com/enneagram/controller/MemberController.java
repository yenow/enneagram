package com.enneagram.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.enneagram.domain.AttachFileDTO;
import com.enneagram.service.AttachFileService;
import com.enneagram.service.EnneagramService;
import com.enneagram.service.MemberService;
import com.enneagram.service.PersonalitySerivce;
import com.enneagram.vo.EnneagramVO;
import com.enneagram.vo.MemberVO;
import com.enneagram.vo.PersonalityVO;

@Controller
@RequestMapping("member")
public class MemberController{

	@Autowired
	private MemberService memberSerivce;
	@Autowired
	private EnneagramService enneagramService;
    @Autowired
    private AttachFileService attachFileService;
    @Autowired
    private PersonalitySerivce personalitySerivce;
    
    @Autowired
    JavaMailSender mailSender; 

    // 메일 전송
    @RequestMapping(value = "auth.do",method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> mailSending(HttpServletRequest request, String email, HttpServletResponse response_email) throws IOException {
    	ResponseEntity<String> re = null;
        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "nalraysy3@gamil.com";
        String tomail = request.getParameter("email"); // 받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다."; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 인증번호는 " +dice+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
            re = new ResponseEntity<String>(Integer.toString(dice),HttpStatus.OK);
        } catch (Exception e) {
            System.out.println(e);
            re = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
        /*
        ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
        mv.setViewName("/member/email_injeung");     //뷰의이름
        mv.addObject("dice", dice);
        
        System.out.println("mv : "+mv);

        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
        
        */
        return re;
        
    }
    
    @RequestMapping(value = "join_injeung.do{dice}", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView join_injeung(String email_injeung, @PathVariable String dice, HttpServletResponse response_equals) throws IOException {
        
        System.out.println("마지막 : email_injeung : "+email_injeung);
        
        System.out.println("마지막 : dice : "+dice);
        
        //페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
         
        ModelAndView mv = new ModelAndView();
        
        mv.setViewName("/member/join.do");
        
        mv.addObject("e_mail",email_injeung);
        
        if (email_injeung.equals(dice)) {
            
            //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
        	
            mv.setViewName("member/join");
            
            mv.addObject("e_mail",email_injeung);
            
            //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
            //한번더 입력할 필요가 없게 한다.
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
            out_equals.flush();
    
            return mv;
            
            
        }else if (email_injeung != dice) {
            ModelAndView mv2 = new ModelAndView(); 
            
            mv2.setViewName("member/email_injeung");
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
            out_equals.flush();
            
    
            return mv2;
            
        }    
    
        return mv;
        
    }
    
    // 아이디, 비밀번호 찾기
    @RequestMapping("emailInput")
    public void emailInput() {
    	
    }
    
	// 프로필 사진 정보 가져오는 AJAX
	@RequestMapping("getProfile")
	@ResponseBody
	public ResponseEntity<AttachFileDTO> getProfile(String id,int mno) {
		ResponseEntity<AttachFileDTO> re;
		try {
			AttachFileDTO attachFileDTO = attachFileService.getAttachFile(mno);
			if(attachFileDTO==null) {
				re = new ResponseEntity<AttachFileDTO>(HttpStatus.OK);
			}else {
				re = new ResponseEntity<AttachFileDTO>(attachFileDTO,HttpStatus.OK);
			}

		} catch (Exception e) {
			re = new ResponseEntity<AttachFileDTO>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return re;
	}
	
	// 나의 프로필 페이지
	@RequestMapping("myProfile")
	public String myProfile(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "redirect:/member/login";
		}else {
			return "/member/myProfile";
		}

	}

	// 비밀번호확인 페이지
	@RequestMapping("is_member")
	public void is_member() {
		
	}
	
	// 아작스로 회원가입 아이디 유효성 검증 - 중복되는 아이디가 있는지 검사
	@RequestMapping(value = "idValidate", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Boolean> idValidate(String id){
		ResponseEntity<Boolean> re;
		
		try {
			Boolean flag = memberSerivce.idValidate(id);
			re =  new ResponseEntity<Boolean>(flag,HttpStatus.OK);
		} catch (Exception e) {
			re =  new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
		
		return re;
	}
	
	/* 윤신영 - 네이버 콜백함수 */
	@RequestMapping("callback")
	public String callback(String state, String code, HttpServletRequest request, HttpServletResponse response, Model m) throws IOException {
		
		memberSerivce.naverlogin(state,code,request,response,m);
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
			
			PersonalityVO p = personalitySerivce.myPersonaltiy(pno);
			
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
		String str = personalitySerivce.getMyType(session,model,response);
		return str;
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
		out.close();
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
			out.close();
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
		out.close();
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
			out.print("alert('회원가입에 실패하였습니다');");
			out.print("history.back();");
			out.print("</script>"); 
			out.close();
			
		}
		out.print("<script>"); 
		out.print("alert('회원가입에 성공하셨습니다');");
		out.print("location.href='/enneagram';");
		out.print("</script>"); 
		out.close();
		
	}

	public String generateState() {
		SecureRandom random = new SecureRandom();
		return new BigInteger(130, random).toString(32);
	}
	
	// 로그인 페이지
	@RequestMapping("/login")
	public void login(HttpServletRequest request,Model m) throws UnsupportedEncodingException {
		String state = generateState();
		request.getSession().setAttribute("state", state);

		String clientId = "5Kd_7rp0z6uT6U5CnjhW";// 애플리케이션 클라이언트 아이디값";
		String redirectURI = URLEncoder.encode("http://localhost:8383/enneagram/member/callback", "UTF-8");
		SecureRandom random = new SecureRandom();
		// String state = new BigInteger(130, random).toString();
		String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&state=" + state;
		m.addAttribute("apiURL", apiURL);
	}

	// 로그인 처리
	@RequestMapping("/login_ok")
	public void login_ok(MemberVO m, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		MemberVO member = memberSerivce.getMemberById(m.getId()); // user_id로 member객체 정보 가져오기
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
				out.print("location.href='"+request.getContextPath()+"';");
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

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		return "redirect:/";
	}

}
