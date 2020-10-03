<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HiBaby</title>
	<jsp:include page="/WEB-INF/views/${cssLink}.jsp"></jsp:include>
</head>
<style>
	
</style>
<body>	
	<div>로그인창 Header</div>
	<div>로그인창 Header</div>
	
	<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
	
	<div>로그인Footer</div>
	<div>로그인Footer</div>
</body>
</html>