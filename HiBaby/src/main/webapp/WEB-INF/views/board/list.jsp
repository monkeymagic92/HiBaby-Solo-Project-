<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<style>

#boardTable {
	margin-top:15px;
}

#writeBtn {
	margin-left: 1000px;
}
</style>
</head>
<body>
	<button id="writeBtn" type="button" class="btn btn-outline-primary" onclick="moveToWrite(${loginUser.i_user})">글쓰기</button>
	<table id="boardTable" class="table table-striped">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">등록시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="item">
				<tr>
					<th scope="row">${item.i_board }</th>
					<td>${item.title }</td>
					<td>${item.nick }</td>
					<td>${item.r_dt }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
<script>
	function moveToWrite(i_user) {
		location.href="/board/insBoard?i_user="+i_user
	}
</script>
</body>
</html>