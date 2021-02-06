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
       		
		<button type="button" class="startLottoBtn" onclick="startLotto()">
		    <span id="startLotto" class="material-icons">
		        play_circle
		    </span>
		</button>
		
		<!-- 모달 넣기 (모래시계 / 로또 결과 / 내로또기록 조회) -->
		<div id="lottoModal" class="lottoModal">
				
			<!-- content 안에 적기 -->
			<div class="lotto-content">                
				<h1 id="lottoTitle">로또 추첨 번호</h1>
				
				<div id="lottoNumberBox">
	
					<!-- lottoBox 안에 append 하기 -->
					<!-- 
					<div id="lottoBox">
						<div id="lottoBg1">
							<span id="num">1</span>
						</div>
						<div id="lottoBg2">
							<span id="num">13</span>
						</div>
						<div id="lottoBg3">
							<span id="num">1</span>
						</div>
						<div id="lottoBg4">
							<span id="num">32</span>
						</div>
						<div id="lottoBg5">
							<span id="num">43</span>
						</div>
						<div id="lottoBg6">
							<span id="num">45</span>
						</div>
					</div>
					 -->					
					
				</div>
				
				<div class="lottoBtn">
					<button type="button" id="reBtn" class="lb" onclick="re()">다시 하기</button>
					<button type="button" id="lottoClo" class="lb" onclick="clLotto()">창닫기</button>
				</div>
			</div>
		</div>
    </div>
    
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>  
<script>

	function re() {
		lottoModal.style.display = 'none'
		lottoNumberBox.innerHTML = ''
		startLotto()
	}
	
	// 로또창 닫기
	function clLotto() {
		
		location.reload(true);
		lottoModal.style.display = 'none'
	}
	
	function startLotto() {
		
		lottoModal.style.display = 'flex'
		
		axios.get('/pro/startLotto', {
	         params: {
	           i_user: `${loginUser.i_user}`
	         }
	    
	      }).then(function(res) {
	    	  lottoList(res.data)
	      })
	}
	
	function lottoList(arr) {
		for (let i=0; i<arr.length; i++) {
	         makeLotto(arr[i])
	     }
	}
	
	function makeLotto(arr) {
		/*
		for(let i=0; i<6; i++) {
			console.log(arr.arr1[i])
			console.log(arr.arr2[i])
			console.log(arr.arr3[i])
			console.log(arr.arr4[i])
			console.log(arr.arr5[i])
		}
		*/
		
		var lottoBox = document.createElement('div')
		lottoBox.setAttribute('id', 'lottoBox')
		
		var lottoBg1 = document.createElement('div')
		lottoBg1.setAttribute('id', 'lottoBg1')
		
		var num1 = document.createElement('span')
		num1.setAttribute('id', 'num')
		num1.append(arr.arr1[0])
		
		
		var lottoBg2 = document.createElement('div')
		lottoBg2.setAttribute('id', 'lottoBg2')
		
		var num2 = document.createElement('span')
		num2.setAttribute('id', 'num')
		num2.append(arr.arr1[1])
		
		
		var lottoBg3 = document.createElement('div')
		lottoBg3.setAttribute('id', 'lottoBg3')
		
		var num3 = document.createElement('span')
		num3.setAttribute('id', 'num')
		num3.append(arr.arr1[2])
		
		
		var lottoBg4 = document.createElement('div')
		lottoBg4.setAttribute('id', 'lottoBg4')
		
		var num4 = document.createElement('span')
		num4.setAttribute('id', 'num')
		num4.append(arr.arr1[3])
		
		
		var lottoBg5 = document.createElement('div')
		lottoBg5.setAttribute('id', 'lottoBg5')
		
		var num5 = document.createElement('span')
		num5.setAttribute('id', 'num')
		num5.append(arr.arr1[4])
		
		
		var lottoBg6 = document.createElement('div')
		lottoBg6.setAttribute('id', 'lottoBg6')
		
		var num6 = document.createElement('span')
		num6.setAttribute('id', 'num')
		num6.append(arr.arr1[5])
		
		
		
		// 2
		var lottoBox2 = document.createElement('div')
		lottoBox2.setAttribute('id', 'lottoBox')
		
		
		var lottoBg1_1 = document.createElement('div')
		lottoBg1_1.setAttribute('id', 'lottoBg1')
		
		var num1_1 = document.createElement('span')
		num1_1.setAttribute('id', 'num')
		num1_1.append(arr.arr2[0])	
		
		var lottoBg1_2 = document.createElement('div')
		lottoBg1_2.setAttribute('id', 'lottoBg2')
		
		var num1_2 = document.createElement('span')
		num1_2.setAttribute('id', 'num')
		num1_2.append(arr.arr2[1])	
		
		
		var lottoBg1_3 = document.createElement('div')
		lottoBg1_3.setAttribute('id', 'lottoBg3')
		
		var num1_3 = document.createElement('span')
		num1_3.setAttribute('id', 'num')
		num1_3.append(arr.arr2[2])	
		
		
		var lottoBg1_4 = document.createElement('div')
		lottoBg1_4.setAttribute('id', 'lottoBg4')
		
		var num1_4 = document.createElement('span')
		num1_4.setAttribute('id', 'num')
		num1_4.append(arr.arr2[3])	
		
		
		var lottoBg1_5 = document.createElement('div')
		lottoBg1_5.setAttribute('id', 'lottoBg5')
		
		var num1_5 = document.createElement('span')
		num1_5.setAttribute('id', 'num')
		num1_5.append(arr.arr2[4])	
		
		
		var lottoBg1_6 = document.createElement('div')
		lottoBg1_6.setAttribute('id', 'lottoBg6')
		
		var num1_6 = document.createElement('span')
		num1_6.setAttribute('id', 'num')
		num1_6.append(arr.arr2[5])	
		
		
		// 3
		var lottoBox3 = document.createElement('div')
		lottoBox3.setAttribute('id', 'lottoBox')
		
		
		var lottoBg1_11 = document.createElement('div')
		lottoBg1_11.setAttribute('id', 'lottoBg1')
		
		var num1_11 = document.createElement('span')
		num1_11.setAttribute('id', 'num')
		num1_11.append(arr.arr3[0])	
		
		
		var lottoBg1_12 = document.createElement('div')
		lottoBg1_12.setAttribute('id', 'lottoBg2')
		
		var num1_12 = document.createElement('span')
		num1_12.setAttribute('id', 'num')
		num1_12.append(arr.arr3[1])	
		
		
		var lottoBg1_13 = document.createElement('div')
		lottoBg1_13.setAttribute('id', 'lottoBg3')
		
		var num1_13 = document.createElement('span')
		num1_13.setAttribute('id', 'num')
		num1_13.append(arr.arr3[2])	
		
		
		var lottoBg1_14 = document.createElement('div')
		lottoBg1_14.setAttribute('id', 'lottoBg4')
		
		var num1_14 = document.createElement('span')
		num1_14.setAttribute('id', 'num')
		num1_14.append(arr.arr3[3])	
		
		
		var lottoBg1_15 = document.createElement('div')
		lottoBg1_15.setAttribute('id', 'lottoBg5')
		
		var num1_15 = document.createElement('span')
		num1_15.setAttribute('id', 'num')
		num1_15.append(arr.arr3[4])	
		
		
		var lottoBg1_16 = document.createElement('div')
		lottoBg1_16.setAttribute('id', 'lottoBg6')
		
		var num1_16 = document.createElement('span')
		num1_16.setAttribute('id', 'num')
		num1_16.append(arr.arr3[5])	
		
		
		// 4
		var lottoBox4 = document.createElement('div')
		lottoBox4.setAttribute('id', 'lottoBox')
		
		
		var lottoBg1_111 = document.createElement('div')
		lottoBg1_111.setAttribute('id', 'lottoBg1')
		
		var num1_111 = document.createElement('span')
		num1_111.setAttribute('id', 'num')
		num1_111.append(arr.arr4[0])	
		
		
		var lottoBg1_112 = document.createElement('div')
		lottoBg1_112.setAttribute('id', 'lottoBg2')
		
		var num1_112 = document.createElement('span')
		num1_112.setAttribute('id', 'num')
		num1_112.append(arr.arr4[1])
		
		
		var lottoBg1_113 = document.createElement('div')
		lottoBg1_113.setAttribute('id', 'lottoBg3')
		
		var num1_113 = document.createElement('span')
		num1_113.setAttribute('id', 'num')
		num1_113.append(arr.arr4[2])
		
		
		var lottoBg1_114 = document.createElement('div')
		lottoBg1_114.setAttribute('id', 'lottoBg4')
		
		var num1_114 = document.createElement('span')
		num1_114.setAttribute('id', 'num')
		num1_114.append(arr.arr4[3])
		
		
		var lottoBg1_115 = document.createElement('div')
		lottoBg1_115.setAttribute('id', 'lottoBg5')
		
		var num1_115 = document.createElement('span')
		num1_115.setAttribute('id', 'num')
		num1_115.append(arr.arr4[4])
		
		
		var lottoBg1_116 = document.createElement('div')
		lottoBg1_116.setAttribute('id', 'lottoBg6')
		
		var num1_116 = document.createElement('span')
		num1_116.setAttribute('id', 'num')
		num1_116.append(arr.arr4[5])
		
		
		// 5
		var lottoBox5 = document.createElement('div')
		lottoBox5.setAttribute('id', 'lottoBox')
		
		
		var lottoBg1_1111 = document.createElement('div')
		lottoBg1_1111.setAttribute('id', 'lottoBg1')
		
		var num1_1111 = document.createElement('span')
		num1_1111.setAttribute('id', 'num')
		num1_1111.append(arr.arr5[0])	
		
		
		var lottoBg1_1112 = document.createElement('div')
		lottoBg1_1112.setAttribute('id', 'lottoBg2')
		
		var num1_1112 = document.createElement('span')
		num1_1112.setAttribute('id', 'num')
		num1_1112.append(arr.arr5[1])	
		
		
		var lottoBg1_1113 = document.createElement('div')
		lottoBg1_1113.setAttribute('id', 'lottoBg3')
		
		var num1_1113 = document.createElement('span')
		num1_1113.setAttribute('id', 'num')
		num1_1113.append(arr.arr5[2])	
		
		var lottoBg1_1114 = document.createElement('div')
		lottoBg1_1114.setAttribute('id', 'lottoBg4')
		
		var num1_1114 = document.createElement('span')
		num1_1114.setAttribute('id', 'num')
		num1_1114.append(arr.arr5[3])
		
		
		var lottoBg1_1115 = document.createElement('div')
		lottoBg1_1115.setAttribute('id', 'lottoBg5')
		
		var num1_1115 = document.createElement('span')
		num1_1115.setAttribute('id', 'num')
		num1_1115.append(arr.arr5[4])
		
		
		var lottoBg1_1116 = document.createElement('div')
		lottoBg1_1116.setAttribute('id', 'lottoBg6')
		
		var num1_1116 = document.createElement('span')
		num1_1116.setAttribute('id', 'num')
		num1_1116.append(arr.arr5[5])
		
		
		
		// 1번째..
								
		lottoBg1.append(num1)
		lottoBox.append(lottoBg1)
		
		lottoBg2.append(num2)
		lottoBox.append(lottoBg2)
		
		lottoBg3.append(num3)
		lottoBox.append(lottoBg3)
		
		lottoBg4.append(num4)
		lottoBox.append(lottoBg4)
		
		lottoBg5.append(num5)
		lottoBox.append(lottoBg5)
		
		lottoBg6.append(num6)
		lottoBox.append(lottoBg6)
		
		// 2번째..
		
		lottoBg1_1.append(num1_1)
		lottoBox2.append(lottoBg1_1)
		
		lottoBg1_2.append(num1_2)
		lottoBox2.append(lottoBg1_2)
		
		lottoBg1_3.append(num1_3)
		lottoBox2.append(lottoBg1_3)
		
		lottoBg1_4.append(num1_4)
		lottoBox2.append(lottoBg1_4)
		
		lottoBg1_5.append(num1_5)
		lottoBox2.append(lottoBg1_5)
		
		lottoBg1_6.append(num1_6)
		lottoBox2.append(lottoBg1_6)
		
		// 3번째..
		
		lottoBg1_11.append(num1_11)
		lottoBox3.append(lottoBg1_11)
		
		lottoBg1_12.append(num1_12)
		lottoBox3.append(lottoBg1_12)
		
		lottoBg1_13.append(num1_13)
		lottoBox3.append(lottoBg1_13)
		
		lottoBg1_14.append(num1_14)
		lottoBox3.append(lottoBg1_14)
		
		lottoBg1_15.append(num1_15)
		lottoBox3.append(lottoBg1_15)
		
		lottoBg1_16.append(num1_16)
		lottoBox3.append(lottoBg1_16)
		
		// 4번째..
		
		lottoBg1_111.append(num1_111)
		lottoBox4.append(lottoBg1_111)
		
		lottoBg1_112.append(num1_112)
		lottoBox4.append(lottoBg1_112)
		
		lottoBg1_113.append(num1_113)
		lottoBox4.append(lottoBg1_113)
		
		lottoBg1_114.append(num1_114)
		lottoBox4.append(lottoBg1_114)
		
		lottoBg1_115.append(num1_115)
		lottoBox4.append(lottoBg1_115)
		
		lottoBg1_116.append(num1_116)
		lottoBox4.append(lottoBg1_116)
		
		// 5번째..
		
		lottoBg1_1111.append(num1_1111)
		lottoBox5.append(lottoBg1_1111)
		
		lottoBg1_1112.append(num1_1112)
		lottoBox5.append(lottoBg1_1112)
		
		lottoBg1_1113.append(num1_1113)
		lottoBox5.append(lottoBg1_1113)
		
		lottoBg1_1114.append(num1_1114)
		lottoBox5.append(lottoBg1_1114)
		
		lottoBg1_1115.append(num1_1115)
		lottoBox5.append(lottoBg1_1115)
		
		lottoBg1_1116.append(num1_1116)
		lottoBox5.append(lottoBg1_1116)
		
		
		lottoNumberBox.append(lottoBox)
		lottoNumberBox.append(lottoBox2)
		lottoNumberBox.append(lottoBox3)
		lottoNumberBox.append(lottoBox4)
		lottoNumberBox.append(lottoBox5)
	}
	
	
	
	
	
</script>
</body>
</html>