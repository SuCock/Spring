package com.yedam.spring;

import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class EncriptTest {
	
	@Test
	public void test() {
	BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
	String password = scpwd.encode("1111");
	System.out.println(password);
	}
}
