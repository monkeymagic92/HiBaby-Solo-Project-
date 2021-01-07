<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pro</title>
<link rel="stylesheet" href="/res/css/proMain.css">
</head>
<body>
	<div class="proContainer">
        <div class="boxList">
            <div class="boxListDiv" onclick="showNumberModal()">
                <div>
                    <img class="listImg" src="/res/img/스무고개메인.png">
                </div>
                <div class="proName">
                    숫자 스무고개
                </div>
            </div>

            <div class="boxListDiv">
                <div>
                    <img class="listImg" src="/res/img/스무고개메인.png">
                </div>

            </div>

            <div class="boxListDiv">
                <div>
                    <img class="listImg" src="/res/img/스무고개메인.png">
                </div>

            </div>

        </div>
    </div>


    <!-- 난이도 선택 모달창 -->
    <div id="numModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <h4>스무고개 난이도 선택</h4>
            
            <!-- Modal body -->
            <div class="modal-body">
                <form id="numFrm" action="/pro/main" method="post" onsubmit="return numChk()">
                    <label>
                        1~1000<input id="hard" type="radio" name="level" value="3">&nbsp;                        
                    </label>
                    <label>
                        1~500<input id="normal" type="radio" name="level" value="2">&nbsp;
                    </label>
                    <label>
                        1~100<input id="eazy" type="radio" name="level" value="1" checked>&nbsp;
                    </label>
                    <br>
                    <!-- 필요없으면 지우기 -->
	                <!--  <input type="hidden" name="studyCode" value="1">-->
                    <button id="submitBtn" type="submit">게임 시작</button>
                </form>
            </div>
            
            <!-- Modal bottom -->
            <button id="exitBtn" type="button" class="pop_bt" onclick="numHide()">종료</button>
        </div>
    </div>


<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>    
<script>

	//스무고개 모달창 show
	function showNumberModal() {
	    $('#numModal').show();
	}
	
	//모달창 종료
	function numHide() {
	    $('#numModal').hide();
	}
	
</script>
</body>
</html>
