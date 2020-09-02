package com.enneagram.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.enneagram.dao.EnneagramDAO;
import com.enneagram.dao.PersonalityDAO;
import com.enneagram.dao.QueryDAO;
import com.enneagram.vo.EnneagramVO;
import com.enneagram.vo.MemberVO;
import com.enneagram.vo.PersonalityVO;
import com.enneagram.vo.QueryVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PersonalityServiceImpl implements PersonalitySerivce {

	@Autowired
	private PersonalityDAO PersonalityDAO;
	@Autowired
	private EnneagramDAO enneagramDAO;
	@Autowired
	private QueryDAO queryDAO;

	@Override
	public void insertPersonality(PersonalityVO p) {
		PersonalityDAO.insertPersonality(p);
	}

	@Override
	public String getEclass(int eclass) {
		return PersonalityDAO.getEclass(eclass);
	}

	@Override
	public String getType(Integer type) {
		return PersonalityDAO.getType(type);
	}
	
	@Override
	public PersonalityVO mytype(int mno) {
		return PersonalityDAO.getMytype(mno);
	}

	@Override
	public List<PersonalityVO> myPersonaltiyList(int mno) {
		return PersonalityDAO.myPersonaltiyList(mno);
	}

	@Override
	public PersonalityVO myPersonaltiy(int pno) {
		return PersonalityDAO.myPersonaltiy(pno);
	}
	/*
	// 테스트 완료시 처리 메서드
	@Override
	public String test_complete(HttpServletRequest request, HttpSession Session, HttpServletResponse response) {
		
		//로그인이 되었다면,, 이 정보를 넣어야함
		List<String> temp = new ArrayList<String>();
		if(Session.getAttribute("test")!=null) {
			temp = (List<String>) Session.getAttribute("test");
		}else {
			return "/test/test_complete";  //temp가 null 이면 ... 
		}
		
		
		System.out.println(temp);
		// 각 성향별 값
		int[] testNum = new int[9];
		//1번 성향
		testNum[0] = Integer.parseInt(temp.get(2)) + 
				Integer.parseInt(temp.get(20)) +
				Integer.parseInt(temp.get(24)) +
				Integer.parseInt(temp.get(32)) +
				Integer.parseInt(temp.get(34)) +
				Integer.parseInt(temp.get(53)) +
				Integer.parseInt(temp.get(59)) +
				Integer.parseInt(temp.get(64)) +
				Integer.parseInt(temp.get(72));
		//2번성향
		testNum[1] = Integer.parseInt(temp.get(6)) + 
				Integer.parseInt(temp.get(13)) +
				Integer.parseInt(temp.get(18)) +
				Integer.parseInt(temp.get(22)) +
				Integer.parseInt(temp.get(47)) +
				Integer.parseInt(temp.get(51)) +
				Integer.parseInt(temp.get(61)) +
				Integer.parseInt(temp.get(71)) +
				Integer.parseInt(temp.get(76));
		//3번성향
		testNum[2] = Integer.parseInt(temp.get(15)) + 
				Integer.parseInt(temp.get(29)) +
				Integer.parseInt(temp.get(31)) +
				Integer.parseInt(temp.get(38)) +
				Integer.parseInt(temp.get(44)) +
				Integer.parseInt(temp.get(49)) +
				Integer.parseInt(temp.get(65)) +
				Integer.parseInt(temp.get(70)) +
				Integer.parseInt(temp.get(77));
		//4번성향
		testNum[3] = Integer.parseInt(temp.get(4)) + 
				Integer.parseInt(temp.get(12)) +
				Integer.parseInt(temp.get(16)) +
				Integer.parseInt(temp.get(36)) +
				Integer.parseInt(temp.get(40)) +
				Integer.parseInt(temp.get(42)) +
				Integer.parseInt(temp.get(63)) +
				Integer.parseInt(temp.get(73)) +
				Integer.parseInt(temp.get(79));
		//5번성향
		testNum[4] = Integer.parseInt(temp.get(0)) + 
				Integer.parseInt(temp.get(7)) +
				Integer.parseInt(temp.get(10)) +
				Integer.parseInt(temp.get(28)) +
				Integer.parseInt(temp.get(37)) +
				Integer.parseInt(temp.get(45)) +
				Integer.parseInt(temp.get(55)) +
				Integer.parseInt(temp.get(67)) +
				Integer.parseInt(temp.get(74));
		//6번성향
		testNum[5] = Integer.parseInt(temp.get(21)) + 
				Integer.parseInt(temp.get(25)) +
				Integer.parseInt(temp.get(33)) +
				Integer.parseInt(temp.get(39)) +
				Integer.parseInt(temp.get(48)) +
				Integer.parseInt(temp.get(58)) +
				Integer.parseInt(temp.get(68)) +
				Integer.parseInt(temp.get(75)) +
				Integer.parseInt(temp.get(80));
		//7번성향  뭐 잘못적었다..
		testNum[6] = Integer.parseInt(temp.get(5)) + 
				Integer.parseInt(temp.get(14)) +
				Integer.parseInt(temp.get(17)) +
				Integer.parseInt(temp.get(27)) +
				Integer.parseInt(temp.get(30)) +
				Integer.parseInt(temp.get(56)) +
				Integer.parseInt(temp.get(62)) +
				Integer.parseInt(temp.get(66)) +
			    Integer.parseInt(temp.get(78));
		//8번성향
		testNum[7] = Integer.parseInt(temp.get(3)) + 
				Integer.parseInt(temp.get(8)) +
				Integer.parseInt(temp.get(23)) +
				Integer.parseInt(temp.get(35)) +
				Integer.parseInt(temp.get(41)) +
				Integer.parseInt(temp.get(43)) +
				Integer.parseInt(temp.get(46)) +
				Integer.parseInt(temp.get(52)) +
				Integer.parseInt(temp.get(57));
				
		//9번성향
		testNum[8] = Integer.parseInt(temp.get(1)) + 
				Integer.parseInt(temp.get(9)) +
				Integer.parseInt(temp.get(11)) +
				Integer.parseInt(temp.get(19)) +
				Integer.parseInt(temp.get(26)) +
				Integer.parseInt(temp.get(50)) +
				Integer.parseInt(temp.get(53)) +
				Integer.parseInt(temp.get(60)) +
				Integer.parseInt(temp.get(69));
		
		
		// map에는 1등과 그 점수가 매핑되어있음 
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		for(int i=1; i<=testNum.length; i++) {
			map.put(i,testNum[i-1]);
		}
		
		Integer[] rank = new Integer[9];
		for(int i=0; i<rank.length ;i++) {
			rank[i] = i+1;
		}
		
		//  rank에는 순서대로 높은 성향이 들어가있음  
		Arrays.sort(rank, new Comparator<Integer>() {
			@Override
			public int compare(Integer o1, Integer o2) {
				if(map.get(o1)>map.get(o2)) {
					return -1;
				}else if(map.get(o1)<map.get(o2)) {
					return 1;
				}
				return 0;
			}
			
		} );
		
		//rank확인! 순위대로 나온다  
		for(int a : rank) {
			System.out.print(a+" ");
		}
		System.out.println();
		
		for(int i=1; i<=9; i++ ) {
			System.out.print(map.get(i)+" ");
		}
		
		int a = testNum[4]+testNum[5]+testNum[6];  // 머리형
		int b = testNum[1]+testNum[2]+testNum[3];  // 가슴형
		int c = testNum[0]+testNum[7]+testNum[8];  // 장형
		int eclass = (a>b) ? ((a>c) ? 1:3) : ((b>c) ? 2: 3);
		
		// 로그인 되어있을 때, 테이블에 저장
		if(((MemberVO)Session.getAttribute("login"))!=null) {
			PersonalityVO p = new PersonalityVO(testNum[0],testNum[1],testNum[2],testNum[3],testNum[4],testNum[5],testNum[6],testNum[7],testNum[8]);
			p.setType(rank[0]);
			p.setMno(((MemberVO)Session.getAttribute("login")).getMno());
			p.setEclass(eclass);
			
			PersonalityDAO.insertPersonality(p);
		}
		
		// rank[0], eclass
		String eclassContent =  PersonalityDAO.getEclass(eclass);
		String typeContent =  PersonalityDAO.getType(rank[0]);
		
		
		Session.setAttribute("type", rank[0]);
		Session.setAttribute("eclassContent", eclassContent);
		Session.setAttribute("typeContent", typeContent);
		Session.setAttribute("eclass", eclass);
		Session.setAttribute("rank", rank);
		
		
		return "/test/test_complete";
	}
	*/
	@Override
	public String getMyType(HttpSession session, Model model, HttpServletResponse response) {
		
		int mno;
		if(session.getAttribute("login")==null) {
			return "redirect:/member/login";
		}else {
			mno = ((MemberVO)session.getAttribute("login")).getMno();
			System.out.println(mno);
		}
		
		// 내 검사 리스트를 가져옴
		List<PersonalityVO> pList = PersonalityDAO.myPersonaltiyList(mno);
		PersonalityVO recently = new PersonalityVO();  //
		EnneagramVO eclass =  new EnneagramVO();
		EnneagramVO type = new EnneagramVO();
		
		/* 검사결과가 없을경우 */
		if(pList.isEmpty()==true) {
			System.out.println("리스트 없음");
		}else {
			/* 가장 최근의 성향 가져오기*/
			recently = pList.get(0);
			LocalDateTime recent = pList.get(0).getRegdate();
	
			for(PersonalityVO p : pList) { 

				if(recent.isBefore(p.getRegdate())) {
					recent = p.getRegdate();
					recently = p;
				}
			}
		
			/*  pList sort 작업,,  가장 최신의 테스트가 맨 앞쪽으로감 */
			pList.sort(new Comparator<PersonalityVO>() {

				@Override
				public int compare(PersonalityVO o1, PersonalityVO o2) {
					if(o1.getRegdate().isBefore(o2.getRegdate())) {
						return 1;
					}
					return -1;
				}
			});
			
			EnneagramVO e = new EnneagramVO();
			e.setCategory("eclass");
			e.setEclass(recently.getEclass());
			eclass= enneagramDAO.select(e);
			e.setCategory("type");
			e.setType(recently.getType());
			type= enneagramDAO.select(e);
			
			System.out.println(eclass);
			System.out.println(eclass.getEclass());
			System.out.println(type);
			System.out.println(type.getType());
			
			model.addAttribute("pList", pList);           //  정렬된 성향리스트
			model.addAttribute("recently", recently);     //  가장 최근 성향
			model.addAttribute("eclass", eclass);  	      //  성향에 해당하는 성격설명      
			model.addAttribute("type", type);             //  성향에 해당하는 성격설명    
			
		}
		return "/member/mytype";
	}

	@Override
	public String test_complete(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		int[] typeArray = new int[9];
		// type 배열 0으로 초기화
		for(int i=0; i<9;i++) {
			typeArray[i]=0;
		}
		
		// 테스트 숫자결과 가져오기
		List<String> tList = new ArrayList<String>();
		if(session.getAttribute("test")!=null) {
			 tList =  (List<String>) session.getAttribute("test");
		}else {
			return "/test/test_complete";  //temp가 null 이면 ... 
			
		}
		// 질문지 정보 가져오기
		List<QueryVO> qList = queryDAO.selectQueryListAll();
		log.info("tList :"+ tList);
		log.info("qList :" + qList);
		for(int i=0;i<81;i++) {
			typeArray[qList.get(i).getType()-1] += Integer.parseInt(tList.get(i));
		}
		
		/* map에는 1등과 그 점수가 매핑되어있음 */
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		for(int i=1; i<=typeArray.length; i++) {
			map.put(i,typeArray[i-1]);
		}
		
		Integer[] rank = new Integer[9];
		for(int i=0; i<rank.length ;i++) {
			rank[i] = i+1;
		}
		
		/*  rank에는 순서대로 높은 성향이 들어가있음  */
		Arrays.sort(rank, new Comparator<Integer>() {
			@Override
			public int compare(Integer o1, Integer o2) {
				if(map.get(o1)>map.get(o2)) {
					return -1;
				}else if(map.get(o1)<map.get(o2)) {
					return 1;
				}
				return 0;
			}
			
		} );
		
		/* rank확인! 순위대로 나온다  */
		for(int a : rank) {
			System.out.print(a+" ");
		}
		System.out.println();
		
		for(int i=1; i<=9; i++ ) {
			System.out.print(map.get(i)+" ");
		}
		
		int a = typeArray[4]+typeArray[5]+typeArray[6];  // 머리형
		int b = typeArray[1]+typeArray[2]+typeArray[3];  // 가슴형
		int c = typeArray[0]+typeArray[7]+typeArray[8];  // 장형
		int eclass = (a>b) ? ((a>c) ? 1:3) : ((b>c) ? 2: 3);
		
		/* 로그인 되어있을 때, 테이블에 저장*/
		if(((MemberVO)session.getAttribute("login"))!=null) {
			PersonalityVO p = new PersonalityVO(typeArray[0],typeArray[1],typeArray[2],typeArray[3],typeArray[4],typeArray[5],typeArray[6],typeArray[7],typeArray[8]);
			p.setType(rank[0]);
			p.setMno(((MemberVO)session.getAttribute("login")).getMno());
			p.setEclass(eclass);
			
			PersonalityDAO.insertPersonality(p);
		}
		
		// rank[0], eclass
		String eclassContent =  PersonalityDAO.getEclass(eclass);
		String typeContent =  PersonalityDAO.getType(rank[0]);
		
		
		session.setAttribute("type", rank[0]);
		session.setAttribute("eclassContent", eclassContent);
		session.setAttribute("typeContent", typeContent);
		session.setAttribute("eclass", eclass);
		session.setAttribute("rank", rank);
		session.setAttribute("typeArray", typeArray);
		
		return "/test/test_complete";
	}
}