package com.yedam.java.emp.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class RentVO {
	public int rentNo;
	public int bookNo;
	public int rentPrice;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public Date rentDate;
	public String rentStatus;
	public String bookName;
}
