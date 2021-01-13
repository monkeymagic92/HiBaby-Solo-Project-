<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<link rel="stylesheet" href="/res/css/boardList.css"> 
<style>


</style>
</head>
<body>

	<div class="includeContainer">
        <div class="listTop">
            <button class="append">#</button>
            <button type="button" class="selBtn" onclick="moveToBoardList()">전체글</button>
            <form id="searchFrm" action="/board/list" method="get" class="search" >
                <input type="text" name="search" class="searchTerm" placeholder="게시글 검색">
                <input type="hidden" name="searchResult" value="1">
                <button type="submit" class="searchButton"><i class="fa fa-search"></i></button>
            </form>                
            <button type="button" class="writeBtn" onclick="moveToWrite()">글쓰기</button>
        </div>
                 게시글 : ${totalCount}          
        <table class="container">
				              
            <thead>
                <tr>
                    <th>
                        <h1>#</h1>
                    </th>
                    <th>
                        <h1>제목</h1>
                    </th>
                    <th>
                        <h1>작성자</h1>
                    </th>
                    <th>
                        <h1>등록시간</h1>
                    </th>
                </tr>
            </thead>
            <tbody>     
            	<c:forEach items="${list}" var="item">                    
                <tr onclick="moveToDetail(${item.i_board})">
                    <td>${item.i_board }</td>
					<td>${item.title }</td>
					<td>${item.nick }</td>
					<td>${item.r_dt }</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <div class="page">	       
	        <c:if test="${pagination.curRange ne 1 }">
	            <a href="#" onClick="fn_paging(1)">[처음]</a> 
	        </c:if>
	        <div class="pageNumber">
	        <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
	            <c:choose>
	                <c:when test="${pageNum eq  pagination.curPage}">
	                	
	                    <span style="font-weight: bold; color: black;"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span>
	                    
	                </c:when>
	                <c:otherwise>
	                	
	                    <a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a>
	                     
	                </c:otherwise>
	            </c:choose>
	        </c:forEach>
	        </div>
	        <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
	            <a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
	        </c:if>
   		</div>

    </div>
	
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	

	// 글쓰기
	function moveToWrite() {
		location.href="/board/boardReg"
	}
	
	// 전체글 이동
	function moveToBoardList() {
		location.href="/board/list";
	}
	
	// 상세페이지 이동
	function moveToDetail(i_board) {
		location.href="/board/detail?i_board="+i_board
	}
	
	// onsubmit 유효검사
	function chk() {
		if(searchFrm.search.value.length > 20) {
			alert('검색 내용이 너무 깁니다')
			searchFrm.search.focus()
			return false
		}
	}
	
	// 페이징 값 보내기
	function fn_paging(curPage) {
		location.href = "/board/list?curPage="+curPage
	}
	
</script>
</body>
</html>