package com.yedam.app.junit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// Bean으로 등록
@Component
public class Restaurant { 
	// Bean으로 만들어진 애를 주입
	@Autowired
	Chef chef;
	
	public void open() {
		chef.cooking();
	}
}
