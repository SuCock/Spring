package com.yedam.java.emp.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BookVO {
	public int bookNo;
	public String bookName;
	public String bookCoverimg;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public Date bookDate;
	public int bookPrice;
	public String bookPublisher;
	public String bookInfo;
}
