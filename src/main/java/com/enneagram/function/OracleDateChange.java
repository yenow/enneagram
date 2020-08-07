package com.enneagram.function;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class OracleDateChange {

	public static Date changeSysdate(String sysdate) {
		
		if(sysdate==null) {
			
		}
		
		String[] str = sysdate.split(" ");
		int year=  Integer.parseInt(str[5]);
		int month=0; 
		
		switch (str[1]) {

		case "JANUARY":
			month = 0;
			break;
		case "FEBRUARY":
			month = 1;
			break;
		case "MARCH":
			month = 2;
			break;
		case "APRIL":
			month = 3;
			break;
		case "MAY":
			month = 4;
			break;
		case "JUNE":
			month = 5;
			break;
		case "JULY":
			month = 6;
			break;
		case "AUGUST":
			month = 7;
			break;
		case "SEPTEMBER":
			month = 8;
			break;
		case "OCTOBER":
			month = 9;
			break;
		case "NOVEMBER":
			month = 10;
			break;
		case "DECEMBER":
			month = 11;
			break;

		}
		System.out.println(Calendar.JANUARY);
		
		int day =  Integer.parseInt(str[3]);
		int hour =  Integer.parseInt(str[4].split(":")[0]);
		int minute =  Integer.parseInt(str[4].split(":")[1]);
		int second =  Integer.parseInt(str[4].split(":")[2]);
		Date date = new Date(year,month,day,hour,minute,second);
		return date;
	}
	
	public static String changeDate(Date date) {
		SimpleDateFormat format1;
		format1 = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		return format1.format(date);
	}

}
