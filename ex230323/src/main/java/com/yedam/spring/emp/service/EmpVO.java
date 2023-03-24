package com.yedam.spring.emp.service;

import java.util.Date;

import lombok.Data;

@Data
public class EmpVO {
	private int employeeId;
	private String firstName;
	private String lastName;
	private String email;
	private Date hireDate;
	private String jobId;
	private double salary;
	private String phoneNumber;
	private double commissionPct;
	private int managerId;
	private int departmentId;
}
