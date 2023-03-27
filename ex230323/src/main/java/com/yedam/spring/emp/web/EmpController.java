package com.yedam.spring.emp.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.spring.emp.service.EmpService;
import com.yedam.spring.emp.service.EmpVO;

@Controller
public class EmpController {
	
	@Autowired
	EmpService empService;
	
	// 조회(데이터, 일반 페이지) -> GET
	// 등록, 수정, 삭제 -> POST
	
	
	//전체조회
	@GetMapping("/empList")
	// 요정할 때 딸려오는 데이터가 없음으로 model사용 -> model에 데이터를 담아서 페이지에 전달.
	public String getEmpAllLIst(Model model) {
		model.addAttribute("empList",empService.getEmpAll());
		// views밑에 해당하는 페이지 경로
		return "emp/empList";
	}
	
	//단건조회
	@GetMapping("/empInfo")
	// 모델도 필요하디만 데이터를 받을 클래스도 필요
	public String getEmpInfo(EmpVO empVO, Model model) {
		model.addAttribute("empInfo", empService.getEmp(empVO));
		return "emp/empInfo";
	}
	//등록 - Form
	@GetMapping("/empInsert")
	public String empInsertForm() {
		//무언가를 전달할게 아니면 페이지만 호출.
		return"emp/empInsert";
	}
	//등록 - Process
	@PostMapping("/empInsert")
	public String empInsertProcess(EmpVO empVO, RedirectAttributes rrtt) {
		int empId = empService.insertEmp(empVO);
		String result = null;
		if(empId == -1) {
			result = "정상적으로 등록되지 않았습니다.";
		}else {
			result = "정상적으로 등록되었습니다."
					+"\n등록된 사원의 사번은" + empId + "입니다.";
		}
		//모델은 데이터가 손상이 날 수 있음.->redirect를 쓴다.
		rrtt.addFlashAttribute("result",result);
		//empList에 모델은 담아갈 데이터가 없다
		//return"emp/empList";
		
		return "redirect:empList";
	}
	// 수정 - Process(json 비동기식) 
	//1) Client - JSON -> Server
	//2) Server- JSON -> Client (Map은 텍스트로 못 넘긴다. 처리 못함.)
	@PostMapping("/empUpadate")
	@ResponseBody
	public Map<String, String> empUpdateProcess(@RequestBody EmpVO empVO) {
		return empService.updateEmp(empVO);
		
	}
}