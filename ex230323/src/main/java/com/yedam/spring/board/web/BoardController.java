package com.yedam.spring.board.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.spring.board.service.BoardService;
import com.yedam.spring.board.service.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	// 전체조회 : uri = getBoardList, return = board/boardList 
									//타일즈를 안쓸려면 그냥 boardList를 return
		@GetMapping("/getBoardList")
		public String getBoardAllList(Model model) {
			model.addAttribute("boardList", boardService.getBoardList());
			return "board/boardList";
		}
	// 단건조회 : uri = getBoardInfo, return = board/boardInfo
		@GetMapping("/getBoardInfo")
		public String getBoardInfo(BoardVO boardVO, Model model) {
			model.addAttribute("boardInfo", boardService.getBoardInfo(boardVO));
			return "board/boardInfo";
		}
		
	// 등록 - 입력을 위한 페이지 요청 : uri = boardInsert, return = board/boardInsert
		@GetMapping("/boardInsert")
		public String boardInsertFrom(Model model) {
			model.addAttribute("boardInfo", boardService.getBoardNo());
			// 글 번호만 넘기는 법.
			// model.addAttribute("bno", boardService.getBoardNo().getBno());
			return "board/boardInsert";
		}
		
	// 등록 - 등록 자체를 처리한다 : uri = boardInsrt, return = board/boardList (전체조회 다시 호출)
		@PostMapping("/boardInsert")
		public String BoardInsertProcess(BoardVO boardVO) {
			boardService.insertBoardInfo(boardVO);
														//값을 꺼내오기 더 힘들다.
														//post에서는 RedirectAttributes를 잘 안쓴다.
//		public String BoardInsertProcess(BoardVO boardVO, RedirectAttributes rrtt) {
//			int bno = boardService.insertBoardInfo(boardVO);
//			String result = null;
//			if(bno == -1) {
//				result = "정상적으로 등록되지 않았습니다.";
//			}else {
//				result = "정상적으로 등록되었습니다.";
//			}
//			rrtt.addFlashAttribute("result", result);
			// redirect는 get방식이다.
			return "redirect:getBoardList";
		}
	// 수정 - 페이지 : uri = boardUpdate, return = board/boardUpdate
		@GetMapping("/boardUpdate")
		public String BoardUpdateForm(BoardVO boardVO, Model model) {
			model.addAttribute("boardInfo", boardService.getBoardInfo(boardVO));
			return "board/boardUpdate";
		}
		
	// 수정 - 처리 : uri = boardUpdate, return = board/boardInfo (단건조회 다시 호출)
		@PostMapping("/boardUpdate")
		public String BoardUpdateProcess(BoardVO boardVO) {
			boardService.updateBoardInfo(boardVO);
			// 바뀌는 경로를 만들어줌
			return "redirect:getBoardInfo?bno="+boardVO.getBno();
		}
		
	// 삭제 : uri = boardDelete, return = board/boardList (전체조회 다시 호출)
		// 삭제될 정보이고 글번호만 넘어감으로 get방식을 써도 된다.
		@GetMapping("/boardDelete")
		public String boardDelete(@RequestParam int bno) {
			boardService.deleteBoardInfo(bno);
			return "redirect:getBoardList";
		}	
}
