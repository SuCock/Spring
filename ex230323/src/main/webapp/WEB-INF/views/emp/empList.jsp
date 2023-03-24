<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empList</title>
<style>
	table, tr, th, td{
	border : 1px solid black;
	}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>employee_id</th>
				<th>first_name</th>
				<th>last_name</th>
				<th>email</th>
				<th>hire_date</th>
				<th>job_id</th>
				<th>salary</th>
			</tr>
		</thead>
		<tbody>
		<!-- item에는 모델의 이름 -->
			<c:forEach items="${empList }" var="emp">
				<tr>
					<td>${emp.employeeId }</td>
					<td>${emp.firstName }</td>
					<td>${emp.lastName }</td>
					<td>${emp.email }</td>
					<td><fmt:formatDate value="${emp.hireDate}" pattern='yyyy-MM-dd'/></td>
					<td>${emp.jobId }</td>
					<td>${emp.salary }</td>			
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script>
		function printAlert(message){
			alert(message);
		}
		// 자바에 관한 해석 -> html해석
		printAlert(`${result}`);
	</script>
</body>
</html>