<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<table>
		<!--번호, 제목 , 작성자 , 날짜 , 조회수 -->
		<thead>
			<tr>
				<th>방번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>전화번호</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${cList}" var="chatroom">
				<tr class="space">
					<td class="ta" id="roomid">${chatroom.roomid }</td>
					<td class="ta" id="name">${chatroom.name}</td>
					<td class="ta" id="reg_date">${chatroom.reg_date}</td>
					<td class="ta" id="content">${chatroom.content }</td>
					<td class="ta" id="adcontent">${chatroom.adcontent}</td>
					<td class="ta" id="phone">${chatroom.phone}</td>


				</tr>

			</c:forEach>
		</tbody>


	</table>

</body>
</html>