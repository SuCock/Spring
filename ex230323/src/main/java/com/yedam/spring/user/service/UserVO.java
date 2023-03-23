package com.yedam.spring.user.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class UserVO {
	private String name;
	private Integer age;
	// util.Date는 기본포멧이  / 다.
	// 스프링에서 지원하는 날짜포멧
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date today;
}
