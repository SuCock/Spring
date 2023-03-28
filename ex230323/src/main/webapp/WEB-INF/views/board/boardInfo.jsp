<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<label>글 번호
			${boardInfo.bno }
		</label>
		<br>
		<label>제목
			${boardInfo.title }
		</label>
		<br>
		<label>작성자
			${boardInfo.writer }
		</label>
		<br>
		<label>내용
			<textarea readonly>${boardInfo.contnets }</textarea>
		</label>
		<br>
		<label>첨부이미지
			<c:choose>
			<c:when test="${not empty boardInfo.image }">
				<img
					src="<c:url value="/resources/images/${boardInfo.image }"/>"
					style="width : 50%;"
					alt="이미지" />
			</c:when>
			<c:otherwise>
				<p>이미지 없음</p>
			</c:otherwise>
			</c:choose>
		</label>
		<br>
		<label>작성일자
			<fmt:formatDate value="${boardInfo.regdate}" pattern="yyyy/MM/dd"/>
		</label>
			<button onclick='location.href="boardUpdate?bno=${boardInfo.bno}"' type='button'>수정</button>
			<button onclick='location.href="boardDelete?bno=${boardInfo.bno}"' type='button'>삭제</button>
	</form>
</body>
</html>