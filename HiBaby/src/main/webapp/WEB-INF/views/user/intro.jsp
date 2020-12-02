<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.modal {
    display: none;
    position: fixed;
    z-index: 1; 
    left: 0;
    top: 0;
    width: 100%; 
    height: 100%; 
    overflow: auto; 
    background-color: rgb(0,0,0); 
    background-color: rgba(0,0,0,0.4); 
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; 
    padding: 20px;
    border: 1px solid #888;
    width: 30%;                           
}
.pop_bt {
	margin-top: 30px;
	width: 200px;
	text-align: center;
	cursor: pointer;
}
</style>
<body>
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
		    <h4>HiBaby Introduce..</h4>
		    
            <!-- Modal body -->
		    <div class="modal-body">
		    	<div>ㄹㅇㄴ</div>
		    	
		    </div>
		    
		    <!-- Modal bottom -->
		    <button type="button" class="pop_bt" onclick="hideModal()">종료</button>
		</div>
    </div>
    
    
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$('#myModal').ready(function() {
	$('#myModal').show();
})

// 모달창 종료
	function hideModal() {
		myModal.style.display = 'none'
	}
</script>
</body>
</html>