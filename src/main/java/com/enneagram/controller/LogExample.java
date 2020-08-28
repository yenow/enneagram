package com.enneagram.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LogExample {
	private static final Log LOG = LogFactory.getLog( LogExample.class );
		
			@RequestMapping("/log")
			@ResponseBody
			public String logExam() {
				LOG.debug( "#ex1 - debug log" );
				LOG.info( "#ex1 - info log" );
				LOG.warn( "#ex1 - warn log" );
				LOG.error( "#ex1 - error log" );
				
				return "콘솔 또는 파일경로 확인";
			}
}
