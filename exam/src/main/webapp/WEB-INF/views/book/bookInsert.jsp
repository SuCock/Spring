<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<h3>도서 등록</h3>
	<form action="bookInsert" method="post" name="insertForm" onsubmit="return false">
		<label>도서번호
			<input type='number' name='bookNo' value="${bookInfo.bookNo}" readonly/>
		</label>
		<br>
		<label>도서명
			<input type='text' name='bookName'/>
		</label>
		<br>
		<label>도서표지
			<input type='text' name='bookCoverimg'/>
		</label>
		<br>
		<label>출판일자
			<input type='date' name='bookDate'/>
		</label>
		<br>
		<label>금액
			<input type='number' name='bookPrice'/>
		</label>
		<br>
		<label>출판사
			<input type='text' name='bookPublisher'/>
		</label>
		<label>도서소개
			<textarea name='bookInfo'></textarea>
		</label>
		<br>
			<button type='submit'>등록</button>
			<button onclick='location.href="bookList"' type='button'>목록</button>
	</form>
		<script>
			function formOptionChk(){
				let title = document.getElementsByName('bookName')[0];
				
				if (title.value == ""){
					alert("제목이 입력되지 않았습니다.");
					title.focus();
					return;
				}
				alert("도서등록이 완료 되었습니다.");
				insertForm.submit();
			}
			
			document.querySelector('button[type="submit"]')
					.addEventListener('click', formOptionChk);
		</script>
</body>
</body>
</html>