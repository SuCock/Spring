package com.yedam.app.emp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.emp.service.EmpService;
import com.yedam.app.emp.service.EmpVO;

@Controller
public class EmpController {
	
	@Autowired
	EmpService empService;
	
	@RequestMapping("/getEmpInfo")
//	page를 리턴하는게 아닌 리턴대상(일반 데이터)을 body에 출력
	@ResponseBody
//	스프링에서 객체를 텍스트화 시키는게 직렬화 => jackson-databind
	public EmpVO getEmpInfo(EmpVO empVO) {
		return empService.getEmpInfo(empVO);
	}
}
