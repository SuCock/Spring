package com.yedam.java.emp.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.java.emp.mapper.BookMapper;
import com.yedam.java.emp.service.BookService;
import com.yedam.java.emp.service.BookVO;
import com.yedam.java.emp.service.RentVO;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	BookMapper bookMapper;
	
	@Override
	public BookVO getBookNo() {
		return bookMapper.getBookNo();
	}

	@Override
	public int insertBookInfo(BookVO bookVO) {
		return bookMapper.insertBook(bookVO);
	}

	@Override
	public List<BookVO> getBookList() {
		return bookMapper.selectBookList();
	}

	@Override
	public List<RentVO> getRentList() {
		return bookMapper.selectRentList();
	}

}
