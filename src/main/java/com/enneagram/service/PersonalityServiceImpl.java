package com.enneagram.service;

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

import com.enneagram.dao.PersonalityDAO;
import com.enneagram.vo.MemberVO;
import com.enneagram.vo.PersonalityVO;

@Service
public class PersonalityServiceImpl implements PersonalitySerivce {

	@Autowired
	private PersonalityDAO PersonalityDAO;

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
	public String test_complete(HttpServletRequest request, HttpSession Session, HttpServletResponse response) {
		
		/* 로그인이 되었다면,, 이 정보를 넣어야함*/
		List<String> temp = new ArrayList<String>();
		if(Session.getAttribute("test")!=null) {
			temp = (List<String>) Session.getAttribute("test");
		}else {
			return "/test/test_complete";  //temp가 null 이면 ... 
		}
		
		
		System.out.println(temp);
		/* 각 성향별 값*/
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
		
		
		/* map에는 1등과 그 점수가 매핑되어있음 */
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		for(int i=1; i<=testNum.length; i++) {
			map.put(i,testNum[i-1]);
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
		
		int a = testNum[4]+testNum[5]+testNum[6];  // 머리형
		int b = testNum[1]+testNum[2]+testNum[3];  // 가슴형
		int c = testNum[0]+testNum[7]+testNum[8];  // 장형
		int eclass = (a>b) ? ((a>c) ? 1:3) : ((b>c) ? 2: 3);
		
		/* 로그인 되어있을 때, 테이블에 저장*/
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
}
