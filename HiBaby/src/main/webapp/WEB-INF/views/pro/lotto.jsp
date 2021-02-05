<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/res/css/lotto.css">
</head>
<body>
	<div class="lottoContainer">
        
		<button type="button" class="myRecord" onclick="#">
		    	나의 로또 내역보기
		</button>
		
		<button type="button" class="startLottoBtn" onclick="startLotto()">
		    <span id="startLotto" class="material-icons">
		        play_circle
		    </span>
		</button>
		
		<form id="lottoFrm" action="/pro/lotto" method="post">
			<!-- name 값을 lotto1 로 해서 lotto(post)에서는 그냥 param값으로 대조 -->
			<input type="text" name="lotto1" value="11">
			<input type="text" name="lotto1" value="22">
			<input type="text" name="lotto1" value="33">
			<input type="text" name="lotto1" value="44">
			<input type="text" name="lotto1" value="55">
			<br><br>
			<br><br>
			<br><br>
			<br><br>
			<br><br><br><br>
			<input type="submit" value="전송">
		</form>
		<!-- 모달 넣기 (모래시계 / 로또 결과 / 내로또기록 조회) -->
            
    </div>
    
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>  
<script>
	
	function startLotto() {
		console.log('??')
		axios.get('/pro/startLotto', {
	         params: {
	           i_user: `${loginUser.i_user}`
	         }
	    
	      }).then(function(res) {
	    	  lottoList(res.data)
	      })
	}
	
	function lottoList(arr) {
		for (let i = 0; i<arr.length; i++) {
	         makeLotto(arr[i])
	      }
	}
	
	function makeLotto(arr) {
		for(var i=0; i<1; i++) {
    		console.log('-------' + i + '번째 ★★★------')
    		console.log('값1 : ' + arr.arr1)
    		console.log('값2 : ' + arr.arr2)
    		console.log('값3 : ' + arr.arr3)
    		console.log('값4 : ' + arr.arr4)
    		console.log('값5 : ' + arr.arr5)
    		
    	}
	}
	
	
	
</script>
</body>
</html>