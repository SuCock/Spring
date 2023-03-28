<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 등록</h1>
	<form action="boardInsert" method="post" name="insertForm" onsubmit="return false">
		<label>글 번호
			<input type='number' name='bno' value="${boardInfo.bno}" readonly/>
		</label>
		<br>
		<label>제목
			<input type='text' name='title'/>
		</label>
		<br>
		<label>작성자
			<input type='text' name='writer'/>
		</label>
		<br>
		<label>내용
			<textarea name='contnets'></textarea>
		</label>
		<br>
		<label>첨부이미지
			<input type='text' name='image'/>
		</label>
		<br>
			<button type='submit'>등록</button>
			<button onclick='location.href="getBoardList"' type='button'>목록</button>
	</form>
		<script>
			function formOptionChk(){
				let title = document.getElementsByName('title')[0];
				let writer = document.getElementsByName('writer')[0];
				let contnets = document.getElementsByName('contnets')[0];
				
				if (title.value == ""){
					alert("제목이 입력되지 않았습니다.");
					title.focus();
					return;
				}
				if (writer.value == ""){
					alert("작성자가 입력되지 않았습니다.");
					writer.focus();
					return;
				}
				if (contnets.value == ""){
					alert("내용이 입력되지 않았습니다.");
					contnets.focus();
					return;
				}
				insertForm.submit();
			}
			
			document.querySelector('button[type="submit"]')
					.addEventListener('click', formOptionChk);
		</script>
</body>
</html>