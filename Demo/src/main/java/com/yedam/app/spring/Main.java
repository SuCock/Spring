package com.yedam.app.spring;

import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {
	public static void main(String[] args) {
		//내가 필요한 Bean의 정보를 가져온다.
		GenericXmlApplicationContext ctx 
			= new GenericXmlApplicationContext("classpath:applicationContext.xml");
								//xml의 아이디
		TV tv = (TV) ctx.getBean("ltv");
		tv.on();
	}

}
