package com.yedam.java.emp.mapper;

import java.util.List;

import com.yedam.java.emp.service.BookVO;
import com.yedam.java.emp.service.RentVO;

public interface BookMapper {
	// 등록하고자 하는 책번호
	public BookVO getBookNo();
	// 도서등록
	public int insertBook(BookVO bookVO);
	// 도서목록
	public List<BookVO> selectBookList();
	// 대여목록
	public List<RentVO> selectRentList();
}
