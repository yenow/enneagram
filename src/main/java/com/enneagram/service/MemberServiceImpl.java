package com.enneagram.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.enneagram.dao.MemberDAO;
import com.enneagram.domain.ApiExamMemberProfile;
import com.enneagram.vo.MemberVO;
import com.enneagram.vo.PersonalityVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public void memberInsert(MemberVO m) {
		memberDAO.memberInsert(m);
	}

	/* 로그인 아이디, 비밀번호 확인*/
	@Override
	public MemberVO login_confirm(String user_id) {
		return memberDAO.login_confirm(user_id);
	}

	/* member 수정*/
	@Override
	public void memberUpdate(MemberVO memberVO) {
		memberDAO.memberUpdate(memberVO);
	}

	// 네이버 로그인
	@Override
	public void naverlogin(String state, String code, HttpServletRequest request, HttpServletResponse response,
			Model m) throws UnsupportedEncodingException {
		
		String clientId = "5Kd_7rp0z6uT6U5CnjhW";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "5I50DzZFfz";// 애플리케이션 클라이언트 시크릿값";
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
		String token_type = "";
		String expires_in = "";
		System.out.println("apiURL=" + apiURL);
		
		JSONParser jsonParse = new JSONParser();
		JSONObject jsonObj;
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
			// 정상실행 됬을 경우
			if (responseCode == 200) {
				
				System.out.println();
				System.out.println(res.toString());   // 문자열로 Json  이네,,  여기에 접근토큰  , refresh_token , token_type, expires_in 이런 속성값들이 있ㄷ음,, 이걸 파싱해야함
				// 이거 json 형태 데이터인데 변환하는거 필요함
				jsonObj = (JSONObject) jsonParse.parse(res.toString());
				access_token = (String) jsonObj.get("access_token");
				refresh_token = (String) jsonObj.get("refresh_token");
				token_type = (String) jsonObj.get("token_type");
				expires_in = (String) jsonObj.get("expires_in");
				System.out.println(access_token);
				System.out.println(refresh_token);
				System.out.println(token_type);
				System.out.println(expires_in);
				
				// 로그인 데이터 가져오기
				String apiURL2 = "https://openapi.naver.com/v1/nid/me";
				Map<String, String> requestHeaders = new HashMap<>();
				requestHeaders.put("Authorization", token_type +" "+access_token); 
				String responseBody = ApiExamMemberProfile.get(apiURL2,requestHeaders);
				System.out.println(responseBody);
				jsonObj = (JSONObject) jsonParse.parse(responseBody);
				jsonObj = (JSONObject) jsonObj.get("response");
				String id = (String) jsonObj.get("id");
				String nickname = (String) jsonObj.get("nickname");
				String profile_image = (String) jsonObj.get("profile_image");
				String age = (String) jsonObj.get("age");
				String gender = (String) jsonObj.get("gender");
				String email = (String) jsonObj.get("email");
				String name = (String) jsonObj.get("name");
				String birthday = (String) jsonObj.get("birthday");
				
				// id 값으로 멤버객체 가져오기
				MemberVO membervo = memberDAO.isPresent(id);   // 네이버 아이디는 우리 데이터베이스랑 겹치지 않도록 다른 문자로 변형되어서옴
				// 없으면 데이터베이스에 넣기
				if(membervo==null) {
					MemberVO memberVO = new MemberVO();
					
					memberVO.setId(id);
					memberVO.setName(name);
					memberVO.setNickname(nickname);
					memberVO.setEmail(email);
					memberVO.setGender(gender);
					memberVO.setBirth(birthday);;
					memberVO.setCategory("네이버");;
					memberDAO.memberInsert(memberVO);
					memberVO =  memberDAO.isPresent(id);
					request.getSession().setAttribute("login", memberVO);
				}else {
					request.getSession().setAttribute("login", membervo);
				}
				
		
				
				System.out.println(id);
				System.out.println(nickname);
				System.out.println(profile_image);
				System.out.println(age);
				System.out.println(gender);
				System.out.println(email);
				System.out.println(name);
				System.out.println(birthday);
				
		
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	// 회원가입 유효성 검증, 아이디가 있는지 확인
	@Override
	public Boolean idValidate(String id) {
		MemberVO m = memberDAO.isPresent(id);
		if(m==null) {
			return false;
		}else {
			return true;
		}
		
	}

	// 회원번호로 회원정보 가져오기
	@Override
	public MemberVO getMemberVO(int mno) {
		return memberDAO.getMemberVO(mno);
	}
}
