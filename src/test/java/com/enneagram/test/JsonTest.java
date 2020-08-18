package com.enneagram.test;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/*.xml")
public class JsonTest {

	@Test
	public void Test() {
		
		String jsonData = "{\"Persons\":[{\"name\":\"고경태\",\"age\":\"30\",\"블로그\":\"ktko.tistory.com\",\"gender\":\"남자\"}, {\"name\":\"이홍준\",\"age\":\"31\",\"블로그\":\"없음\",\"gender\":\"남자\"}, {\"name\":\"서정윤\",\"age\":\"30\",\"블로그\":\"없음\",\"gender\":\"여자\"}], \"Books\":[{\"name\":\"javascript의모든것\",\"price\":\"10000\"},{\"name\":\"java의모든것\",\"price\":\"15000\"}]}";
		
		try {
			JSONParser jsonParse = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParse.parse(jsonData);
			JSONArray personArray = (JSONArray) jsonObj.get("Persons"); 
			
			for(int i=0; i < personArray.size(); i++) { 
				System.out.println("======== person : " + i + " ========"); 
				JSONObject personObject = (JSONObject) personArray.get(i); 
				System.out.println(personObject.get("name")); 
				System.out.println(personObject.get("age")); 
			} 
			
			JSONArray booksArray = (JSONArray) jsonObj.get("Books"); 
			for(int i=0; i < booksArray.size(); i++) { 
				System.out.println("======== person : " + i + " ========"); 
				JSONObject bookObject = (JSONObject) booksArray.get(i); 
				System.out.println(bookObject.get("name")); 
				System.out.println(bookObject.get("price")); 
			}

			
		} catch (ParseException e) {
			e.printStackTrace();
		}

		
		
	}
}
