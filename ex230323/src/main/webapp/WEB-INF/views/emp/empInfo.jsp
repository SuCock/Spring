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
	<form onsubmit="return false"> 
		<div>
			<label>id : <input type="number" name="employeeId" value="${empInfo.employeeId }" readonly></label>
		</div>
		<div>
			<label>first_name : <input type="text" name="firstName" value="${empInfo.firstName }" ></label>
		</div>
		<div>
			<label>last_name : <input type="text" name="lastName" value="${empInfo.lastName }" readonly></label>
		</div>
		<div>
			<label>email : <input type="text" name="email" value="${empInfo.email }" ></label>
		</div>
		<div>
			<label>hire_date : <input type="date" name="hireDate" value='<fmt:formatDate value="${empInfo.hireDate }" pattern="yyyy-MM-dd"/>' readonly></label>
		</div>
		<div>
			<label>job_id : <input type="text" name="jobId" value="${empInfo.jobId }" readonly></label>
		</div>
		<div>
			<label>salary : <input type="number" name="salary" value="${empInfo.salary }" ></label>
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
	// function으로 감싸준다. 
	function updateEmpInfo(){
		fetch('empUpdate',{
			method : 'post',
			headers : {
				'Content-Type' : 'application/json'
			},
			// json으로 인코딩(json을 다루는 객체)
			body : JSON.stringify(serializenObject())
		})
		.then(response => response.json())
		//.then(data => console.log(data))
		.then(data=>{
			if(data != null && data['결과'] == 'Success'){
				// 키값이 한국어 임으로 한국어로 값을 가져온다
				alert('사원번호 : ' + data['사원번호']+ '의 정보가 수정되었습니다.');
			}else{
				alert('해당 사원의 정보가 정상적으로 수정되지 않았습니다.')
			}
		})
		.catch(reject => console.log(reject));
	}
		
	function serializenObject(){
		// 객체배열로 만들어준다.
		// vo에는 name이라는 키가 없음으로 firstName을 키로 주기 위해서 필요한 과정.
		// [{name : 'firstName', value : 'Steven'},{name : '', value : ''},...]
		let formData = $('form').serializeArray();
		
		// 실제로 가져야하는 객체선언
		// key,value가 하나인 객체로
		let objectData = {}
		formData.forEach(function(obj, idx){
			objectData[obj.name] = obj.value
		});
		return objectData;
	}
	
		document.querySelector('button[type="submit"]').addEventListener('click', updateEmpInfo);
	
	</script>
</body>
</html>