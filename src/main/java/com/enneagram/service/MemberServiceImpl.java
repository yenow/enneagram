package com.enneagram.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.enneagram.dao.MemberDAO;
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

	/* 마이페이지 내 성향 가져오기*/
	@Override
	public PersonalityVO mytype(int mno) {
		return memberDAO.getMytype(mno);
	}

	@Override
	public List<PersonalityVO> myPersonaltiyList(int mno) {
		return memberDAO.myPersonaltiyList(mno);
	}

	@Override
	public PersonalityVO myPersonaltiy(int pno) {
		return memberDAO.myPersonaltiy(pno);
	}

	@Override
	public void naverlogin(String state, String code, HttpServletRequest request, HttpServletResponse response,
			Model m) throws UnsupportedEncodingException {
		
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
				
				System.out.println();
				System.out.println(res.toString());   // 문자열로 Json  이네,,  여기에 접근토큰  , refresh_token , token_type, expires_in 이런 속성값들이 있ㄷ음,, 이걸 파싱해야함
				// 이거 json 형태 데이터인데 변환하는거 필요함
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}}
