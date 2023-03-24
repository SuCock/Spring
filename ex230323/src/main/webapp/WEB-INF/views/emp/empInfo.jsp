<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empInfo</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
	<form action="empUpdate" method="post" onSubmit="return false"> 
		<div>
			<label>id : <input type="number" name="employeeId" value="${empInfo.employeeId }" readonly></label>
		</div>
		<div>
			<label>first_name : <input type="text" name="firstName" value="${empInfo.firstName }" readonly></label>
		</div>
		<div>
			<label>last_name : <input type="text" name="lastName" value="${empInfo.lastName }" readonly></label>
		</div>
		<div>
			<label>email : <input type="text" name="email" value="${empInfo.email }" readonly></label>
		</div>
		<div>
			<label>hire_date : <input type="date" name="hireDate" value='<fmt:formatDate value="${empInfo.hireDate }" pattern="yyyy-MM-dd"/>' readonly></label>
		</div>
		<div>
			<label>job_id : <input type="text" name="jobId" value="${empInfo.jobId }" readonly></label>
		</div>
		<div>
			<label>salary : <input type="number" name="salary" value="${empInfo.salary }" readonly></label>
		</div>
		<div>
			<label>phone_number : <input type="text" name="phoneNumber" value="${empInfo.phoneNumber }" readonly></label>
		</div>
		<div>
			<label>commission_pct : <input type="number" name="commissionPct" value="${empInfo.commissionPct }" readonly></label>
		</div>
		<div>
			<label>manager_id : <input type="number" name="managerId" value="${empInfo.managerId }" readonly></label>
		</div>
		<div>
			<label>department_id : <input type="number" name="departmentId" value="${empInfo.departmentId }" readonly></label>
		</div>
		<button type="submit">수정</button>
		<button type="button">취소</button>
	</form>
	<script>
		fetch('empUpdate',{
			method : 'post',
			header : {
				'Content-Type' : 'application/json'
			},
			body : convertData();
		})
		.then(response => response.json())
		.then(data => console.log(data))
		.catch(reject => console.log(reject));
		
	</script>
</body>
</html>