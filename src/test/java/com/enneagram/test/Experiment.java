package com.enneagram.test;

import static org.hamcrest.CoreMatchers.is;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertThat;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.enneagram.controller.LogExample;

import lombok.AllArgsConstructor;

@AllArgsConstructor
class A {
	int num;
	String str;
	public A() {
	}
	
}

public class Experiment {
	private static final Log LOG = LogFactory.getLog( LogExample.class );
	
	@Test
	public void assertThatTest() {
		A a = new A(10, "str");
		A a2 = new A(10, "str");
		assertThat(a.num, is(a2.num));   
		//assertThat(a, isA(A.class));  // isA 는 클래스 타입을 비교하나보군
		assertSame(a, a);
		
	}
}
