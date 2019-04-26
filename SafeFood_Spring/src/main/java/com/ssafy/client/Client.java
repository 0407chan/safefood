package com.ssafy.client;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Client {
	public static void main(String[] args) {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("spring/application-config.xml");
		//BookService svc=ctx.getBean(BookService.class);
		System.out.println("Service Ok");
		
		// 필요한  Test 를 작성하세요 
		
	}
}



