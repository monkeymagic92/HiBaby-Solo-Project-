<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HiBaby</title>
</head>
<style>
	.pointContainer {
		width: 850px;
		margin: 0 auto;
		margin-top: 20px;
	}
</style>
<body>
	<div class="pointContainer">
		<table>
			<tr>
				<td>No</td>
				<td>누적포인트</td>
				<td>기존포인트</td>
				<td>환급금액</td>
				<td>잔여포인트</td>
				<td>환전시간</td>				
			</tr>
			<c:forEach items="${selPoint}" var="item">
			<tr>
				<td>${item.i_point}</td>
				<td><fmt:formatNumber value="${item.totalPoint}" pattern="#,###" />p</td>
				<td><fmt:formatNumber value="${item.myPoint}" pattern="#,###" />p</td>
				<td><fmt:formatNumber value="${item.myCash}" pattern="#,###" />p</td>
				<td><fmt:formatNumber value="${item.myPointNow}" pattern="#,###" />p</td>
				<td>${item.r_dt}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>