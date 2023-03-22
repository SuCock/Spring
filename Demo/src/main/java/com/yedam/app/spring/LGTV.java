package com.yedam.app.spring;

import org.springframework.stereotype.Component;

@Component("ltv")
public class LGTV implements TV {

	@Override
	public void on() {
		System.out.println("스프링 방식으로 LG TV 켬.");

	}

}
