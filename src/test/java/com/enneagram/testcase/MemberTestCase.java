package com.enneagram.testcase;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.enneagram.dao.MemberDAO;
import com.enneagram.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@AllArgsConstructor
@NoArgsConstructor
public class MemberTestCase implements TestCase{

	private MemberDAO memberDAO;

	public void TestCaseInput() {
	
		for(int i=1; i<=100; i++) {
			if(memberDAO.getMemberById("adminTest"+i)!=null) {
				memberDAO.deleteById("adminTest"+i);
			}
			MemberVO member =  new MemberVO(0, "adminTest"+i, "password"+i, "name"+i, "nickname"+i, 
					i+"email@naver.com", "010-0000-0000", "M", "사용자", "12-25", null,0);
			memberDAO.memberInsert(member);
		}
	
	}

	public void TestCaseOutput() {
		for(int i=1; i<=100; i++) {
			memberDAO.deleteById("adminTest"+i);
		}
	}

}
