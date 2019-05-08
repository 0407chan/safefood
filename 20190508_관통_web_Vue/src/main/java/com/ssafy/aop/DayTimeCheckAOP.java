package com.ssafy.aop;

import java.util.Calendar;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import com.ssafy.exception.TimeoutException;

@Component
@Aspect
public class DayTimeCheckAOP {

	//@Before("execution(* *DayTime(..))")
	public void checkDayTime() {
		Calendar cal = Calendar.getInstance();
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		if (hour < 9 || hour > 18) {
			throw new TimeoutException();
		}
	}
}
