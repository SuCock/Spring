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
	<h3>도서 조회/수정</h3>
	<table>
		<thead>
			<tr>
				<th>도서번호</th>
				<th>도서명</th>
				<th>표지</th>
				<th>출판일자</th>
				<th>금액</th>
				<th>출판사</th>
				<th>도서소개</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bookList }" var="book">
				<tr>
					<td>${book.bookNo }</td>
					<td>${book.bookName }</td>
					<td>${book.bookCoverimg }
								<c:choose>
									<c:when test="${not empty book.bookCoverimg }">
										<img
											src="<c:url value="/resources/images/${book.bookCoverimg }"/>"
											style="width : 50%;"
											alt="이미지" />
									</c:when>
									<c:otherwise>
										<p>이미지 없음</p>
									</c:otherwise>
									</c:choose>
					</td>
					<td><fmt:formatDate value="${book.bookDate }" pattern='yyyy/MM/dd'/></td>
					<td>${book.bookPrice }</td>
					<td>${book.bookPublisher }</td>
					<td>${book.bookInfo }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>