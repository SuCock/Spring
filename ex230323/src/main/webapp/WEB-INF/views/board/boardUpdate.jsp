<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 수정</h1>
	<form action="boardUpdate" method="post" name="updateForm" onsubmit="return false">
		<label>글 번호
			<input type='number' name='bno' value="${boardInfo.bno}" readonly/>
		</label>
		<br>
		<label>제목
			<input type='text' name='title' value="${boardInfo.title}"/>
		</label>
		<br>
		<label>작성자
			<input type='text' name='writer' value="${boardInfo.writer}"readonly/>
		</label>
		<br>
		<label>내용
			<textarea name='contnets'>${boardInfo.contnets}</textarea>
		</label>
		<br>
		<label>첨부이미지
			<input type='text' name='image' value="${boardInfo.image}"/>
		</label>
		<br>
		<label>수정날짜
			<input type='date' name='updatedate'/>
		</label>
			<button type='submit'>수정 등록</button>
			<button onclick='location.href="getBoardInfo?bno=${boardInfo.bno}"' type='button'>취소</button>
	</form>
		<script>
			function formOptionChk(){
				let title = document.getElementsByName('title')[0];
				let contnets = document.getElementsByName('contnets')[0];
				
				if (title.value == ""){
					alert("제목이 입력되지 않았습니다.");
					title.focus();
					return;
				}
				if (contnets.value == ""){
					alert("내용이 입력되지 않았습니다.");
					contnets.focus();
					return;
				}
				updateForm.submit();
			}
			
			document.querySelector('button[type="submit"]')
					.addEventListener('click', formOptionChk);
		</script>
</body>
</html>