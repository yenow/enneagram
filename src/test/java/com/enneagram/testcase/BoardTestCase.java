package com.enneagram.testcase;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.enneagram.dao.BoardDAO;
import com.enneagram.dao.MemberDAO;
import com.enneagram.vo.BoardVO;
import com.enneagram.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class BoardTestCase implements TestCase{

	private MemberDAO memberDAO;
	private BoardDAO boardDAO;
	

	public void TestCaseInput() {
		MemberTestCase mtc= new MemberTestCase(memberDAO);
		mtc.TestCaseInput();
		MemberVO m = memberDAO.getMemberById("adminTest1");
		boardDAO.boardDeleteById("adminTest"+1);
		for(int i=1; i<=100; i++) {
			//( bno, mno, title, content, category, cnt, rcnt, regdate, moddate, likey, id, nickname, search, search_type )
			BoardVO b = new BoardVO(0,m.getMno(),"titile","content","속닥속닥",0,0,null,null,0,m.getId(),m.getNickname(),null,null);
			boardDAO.insertBoard(b);
		}
	}

	public void TestCaseOutput() {
		MemberTestCase mtc= new MemberTestCase(memberDAO);
		for(int i=1; i<=100; i++) {
			boardDAO.boardDeleteById("adminTest"+1);
		}
		mtc.TestCaseOutput();
	}
	
	
}
