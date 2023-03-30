package com.yedam.java.emp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yedam.java.emp.service.BookService;
import com.yedam.java.emp.service.BookVO;

@Controller
public class BookController {
	
	@Autowired
	BookService bookService;
	
	// 도서등록 - 페이지
	@GetMapping("/bookInsert")
	public String bookInsertForm(Model model) {
		model.addAttribute("bookInfo", bookService.getBookNo());	
		return "book/bookInsert";
	}
	// 도서등록 - 처리
	@PostMapping("/bookInsert")
	public String bookInsertProcess(BookVO bookVO) {
		bookService.insertBookInfo(bookVO);	
		return "redirect:bookList";
	}
	// 책목록
	@GetMapping("/bookList")
	public String bookAllList(Model model) {
		model.addAttribute("bookList", bookService.getBookList());
		return "book/bookList";
	}
	// 대여목록
	@GetMapping("/rentList")
	public String rentAllList(Model model) {
		model.addAttribute("rentList", bookService.getRentList());
		return "book/rentList";
	}
	
}
