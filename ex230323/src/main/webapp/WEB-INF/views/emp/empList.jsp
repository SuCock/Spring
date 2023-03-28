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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
	<button type="button" onclick="location.href='empInsert'">등록</button>
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
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
		<!-- item에는 모델의 이름 -->
			<c:forEach items="${empList }" var="emp">
				<tr onclick="location.href='empInfo?employeeId=${emp.employeeId }'">
					<td> ${emp.employeeId }</td>
					<td>${emp.firstName }</td>
					<td>${emp.lastName }</td>
					<td>${emp.email }</td>
					<td><fmt:formatDate value="${emp.hireDate}" pattern='yyyy-MM-dd'/></td>
					<td>${emp.jobId }</td>
					<td>${emp.salary }</td>	
					<!-- 버튼의 oncilck=function의 이벤트 객체는 자동으로 넘어가지 않는다.핸들러 안의 객체가 실행되는 것 이벤트가 필요하면 명시해줘야한다. -->
					<!-- event는 객체임으로 따옴표로 감싸면 안된다. -->
					<td><button type="button" 
						 onclick="deleteInfo(${emp.employeeId}, event)">삭제</button></td>		
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script>
		function printAlert(message){
			if(message == null || message == '')return;
			alert(message);
		}
		// 자바에 관한 해석 -> html해석
		printAlert(`${result}`);
		
		function deleteInfo(id, event){
			$.ajax({
				url : 'empDelete',
				method : 'post',
				data : { employeeId : id},
				//dataType : 'json', json으로 받겠다(제이쿼리는 생략가능->html, text, json, xml은 알아서 파싱해준다.)
				success : function(data){
					console.log(data);
				},
				error : function(reject){
					console.log(reject)
				}
			});
			// 버블을 막아준다.
			event.stopPropagation();
			location.reload();
		}
	</script>
</body>
</html>