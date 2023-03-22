package com.yedam.app;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import com.yedam.app.java.TV;
import com.yedam.app.java.SamsungTV;

public class JavaClass {

	@Test
	public void method() {
		System.out.println("단순 테스트");
	}
	public void javaTest() {
		TV tv = new SamsungTV();
		tv.on();
		assertNotNull(tv);
	}
}
