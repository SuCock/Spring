package com.yedam.boot.emp.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.yedam.boot.emp.mapper.EmpMapper;
import com.yedam.boot.emp.service.EmpService;
import com.yedam.boot.emp.service.EmpVO;

import org.springframework.stereotype.Service;

@Service
public class EmpServiceImpl implements EmpService{

	@Autowired
	EmpMapper empMapper;
	
	@Override
	public List<EmpVO> getEmpList() {
		return empMapper.selectAllEmp();
	}

	@Override
	public EmpVO getEmpInfo(EmpVO empVO) {
		return empMapper.selectEmpInfo(empVO);
	}

	@Override
	public int insertEmpInfo(EmpVO empVO) {
		return empMapper.insertEmpInfo(empVO);
	}

}
