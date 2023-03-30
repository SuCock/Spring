package com.yedam.java.emp.service;

import java.util.List;


public interface BookService {
	// 등록하고자 하는 책번호
	public BookVO getBookNo();
	// 도서등록
	public int insertBookInfo(BookVO bookVO);
	// 도서목록
	public List<BookVO> getBookList();
	// 대여목록
	public List<RentVO> getRentList();
	
}
