package com.anneagram.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.anneagram.service.ReplyService;
import com.anneagram.vo.ReplyVO;

// advanced rest client
/* 1. Rest는 'Representation State Transfer'의 약자로 하나의 URI은 하나의 고유한 리소스를 대표하도록 설게 된다는 개념이다
 * 최근에는 서버에 접근하는 기기의 종류가 다양해 지면서 다양한 기기에서 공통으로 데이터를 처리할 수 있는 규칙을 만들려고 하는데 이러한 시도가 REST방식이다
 * 
 * 2. Rest API는 외부에서 위와 같은 방식으로 특정 URI를 통해서 사용자가 원하는 정보를 제공하는 방식이다. REST 방식의 서비스 제공이 가능한 것을 'Restful'하다고 표현한다.
 * 
 * 3. 스프링 3.0부터 @ResponseBody 지원으로 Rest방식의 처리를 지원
 * 
 * 4. @RestController는 기존의 특정한 JSP와 같은 뷰를 만들어 내는 것이 목적이 아닌 REST 방식의 데이터 처리를 위해서 사용하는 어노테이션 (xml,json, 단순 문자열을 웹브라우저에 반환)
 * 
 * */
@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	//댓글 삽입
	@RequestMapping("/replyinsert")
	public ResponseEntity<String> replyInsert(@RequestBody ReplyVO re, HttpSession session) {  // @RequestBody 는 전송된 JSON데이터를 객체환 변환한다. 데이터 전송방식을 json을 이용한다. 
		// ResponseEntity<void> 는 개발자가 문제가 되는 나쁜 상태, 404,500 같은 http 나쁜 상태 코드를 데이터와 함께 브라우저로 전송할 수 있기 때문에 좀 더 세밀한 제어가 필요한 경우 사용해 볼수 있다
		// 400 나쁜 상태코드 BAD_REQUEST가 브라우저로 전송된다
		ResponseEntity<String> entity= null;
		try {
			if(session.getAttribute("login")!=null) {
				replyService.replyInsert(re);
			}else {
				replyService.replyInsert_no(re);
			}
			entity= new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		 
		return entity;
	}
	
	//게시판 번호에 따라 댓글리스트 가져오기
	@RequestMapping("/listReply")
	public ResponseEntity<List<ReplyVO>> listReply(int bno) {  //@PathVariable은 매핑주소의 게시물 번호값을 추출하는 용도로 사용
		ResponseEntity<List<ReplyVO>> entity= null;
		try {
			entity= new ResponseEntity<List<ReplyVO>>(replyService.listReply(bno), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	// 댓글 수정
	@RequestMapping("/updateReply")
	public ResponseEntity<List<ReplyVO>> updateReply(@RequestBody ReplyVO re) {  //@PathVariable은 매핑주소의 게시물 번호값을 추출하는 용도로 사용
		//1번 로그인 된경우 : rno 에서 user_id 를 알아오고 비교
		
		//2번 안된경우 : rno에서 패스워드값 가져오고 비교
		
		ResponseEntity<List<ReplyVO>> entity= null;
		try {
			entity= new ResponseEntity<List<ReplyVO>>(replyService.listReply(re.getBno()), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 댓글 삭제
	
}

/*REST와 AJAX
 * 1. REST가 가장 많이 쓰이는 방식은 아작스와 결합된 형태 , 아작스는 비동기식 프로그램으로 주로 브라우저에서 화면 전환 없이 서버와 필요한 일정 영역부분만 대화형으로 데이터를 주고 받는 형태의 메세지 전송 방식
 * 
 * */
