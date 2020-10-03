<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HiBaby</title>
<!-- mdbBootStrap --> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
<!-- bootStrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css">
<!-- taliwindCss -->  
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet"><!-- Materialize Css -->
<!-- 현재 부트스트랩이랑   매터리알리즈 두 링크 중첩되면 충돌남  -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">-->
</head>
<style>
	
</style>
<body>	
	<div>-	-	-menuTemp Header-	-	-</div>
	<div>-	-	-menuTemp Header-	-	-</div>
	
	<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
	
	<div>-	-	-menuTemp Footer-	-	-</div>
	<div>-	-	-menuTemp Footer-	-	-</div>
</body>
</html>