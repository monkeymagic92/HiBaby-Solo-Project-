
/**
 * 
 */
window.onload = function() {
		frm.user_id.focus()
	}

function moveToJoin() {
	location.href="/user/join";
}

function moveToFindPw() {
	location.href="/user/findPw";
}

function chk() {
	if(frm.user_id.value.length < 2) {
		frm.user_id.focus();
		alert('아디짧음');
		return false;
	}
}

onmousemove = function(e){
    if(document.getElementById("rightEye").dataset.xValue === undefined) {
      document.getElementById("rightEye").dataset.xValue = Math.round(document.getElementById("rightEye").getBoundingClientRect().left) + 9;
      document.getElementById("rightEye").dataset.yValue = Math.round(document.getElementById("rightEye").getBoundingClientRect().top) + 9;
      document.getElementById("leftEye").dataset.xValue = Math.round(document.getElementById("leftEye").getBoundingClientRect().left) + 9;
      document.getElementById("leftEye").dataset.yValue = Math.round(document.getElementById("leftEye").getBoundingClientRect().top) + 9;   
    }
    var rightEyeElement = document.getElementById("rightEye");
    var rightEye = {
      x:document.getElementById("rightEye").dataset.xValue,
      y:document.getElementById("rightEye").dataset.yValue,
    }
    var leftEye = {
      x:document.getElementById("leftEye").dataset.xValue,
      y:document.getElementById("leftEye").dataset.yValue,
    }
    
    /* Variables for right eye */
    var finalRightEyeXOffset = 0;
    var finalRightEyeYOffset = 0;
    var rightEyeXOffset = rightEye.x - e.clientX;
    var rightEyeYOffset = rightEye.y - e.clientY;
    
    /* Set X value for right eye */
    if(rightEyeXOffset > 0  && rightEyeXOffset <= 10) {
      finalRightEyeXOffset = rightEyeXOffset * -1;
      //console.log(e.clientX + " " + rightEye.x + " " + rightEyeXOffset + " small change towards left");
    }
    else if(rightEyeXOffset < 0  && rightEyeXOffset >= -10) {
      finalRightEyeXOffset = rightEyeXOffset * -1;
      //console.log(e.clientX + " " + rightEye.x + " " + rightEyeXOffset + " small change towards right");      
    }
    else if(rightEyeXOffset > 10) {
      finalRightEyeXOffset = -10;
      //console.log(e.clientX + " " + rightEye.x + " " + rightEyeXOffset + " big change towards left");
    }
    else if(rightEyeXOffset < -10) {
      finalRightEyeXOffset = 10;
      //console.log(e.clientX + " " + rightEye.x + " " + rightEyeXOffset + " big change towards right");     
    }
    
    /* Set y value for right eye */
    if(rightEyeYOffset > 0  && rightEyeYOffset <= 10) {
      finalRightEyeYOffset = rightEyeYOffset * -1;
      //console.log(e.clientY + " " + rightEye.y + " " + rightEyeYOffset + " small change towards left");
    }
    else if(rightEyeYOffset < 0  && rightEyeYOffset >= -10) {
      finalRightEyeYOffset = rightEyeYOffset * -1;
      //console.log(e.clientY + " " + rightEye.y + " " + rightEyeYOffset + " small change towards right");      
    }
    else if(rightEyeYOffset > 10) {
      finalRightEyeYOffset = -10;
      //console.log(e.clientY + " " + rightEye.y + " " + rightEyeYOffset + " big change towards left");
    }
    else if(rightEyeYOffset < -10) {
      finalRightEyeYOffset = 10;
      //console.log(e.clientY + " " + rightEye.y + " " + rightEyeYOffset + " big change towards right");     
    }
    
    /* Variables for left eye */
    var finalLeftEyeXOffset = 0;
    var finalLeftEyeYOffset = 0;
    var leftEyeXOffset = leftEye.x - e.clientX;
    var leftEyeYOffset = leftEye.y - e.clientY;
    
    /* Set X value for left eye */
    if(leftEyeXOffset > 0  && leftEyeXOffset <= 10) {
      finalLeftEyeXOffset = leftEyeXOffset * -1;
      //console.log(e.clientX + " " + leftEye.x + " " + leftEyeXOffset + " small change towards left");
    }
    else if(leftEyeXOffset < 0  && leftEyeXOffset >= -10) {
      finalLeftEyeXOffset = leftEyeXOffset * -1;
      //console.log(e.clientX + " " + leftEye.x + " " + leftEyeXOffset + " small change towards right");      
    }
    else if(leftEyeXOffset > 10) {
      finalLeftEyeXOffset = -10;
      //console.log(e.clientX + " " + leftEye.x + " " + leftEyeXOffset + " big change towards left");
    }
    else if(leftEyeXOffset < -10) {
      finalLeftEyeXOffset = 10;
      //console.log(e.clientX + " " + leftEye.x + " " + leftEyeXOffset + " big change towards right");     
    }
    
    /* Set y value for left eye */
    if(leftEyeYOffset > 0  && leftEyeYOffset <= 10) {
      finalLeftEyeYOffset = leftEyeYOffset * -1;
      //console.log(e.clientY + " " + leftEye.y + " " + leftEyeYOffset + " small change towards left");
    }
    else if(leftEyeYOffset < 0  && leftEyeYOffset >= -10) {
      finalLeftEyeYOffset = leftEyeYOffset * -1;
      //console.log(e.clientY + " " + leftEye.y + " " + leftEyeYOffset + " small change towards right");      
    }
    else if(leftEyeYOffset > 10) {
      finalLeftEyeYOffset = -10;
      //console.log(e.clientY + " " + leftEye.y + " " + leftEyeYOffset + " big change towards left");
    }
    else if(leftEyeYOffset < -10) {
      finalLeftEyeYOffset = 10;
      //console.log(e.clientY + " " + leftEye.y + " " + leftEyeYOffset + " big change towards right");     
    }

    //console.log(rightEyeXOffset + " " + finalRightEyeXOffset);
    document.getElementById("rightEye").style.transform = "translate(" + finalRightEyeXOffset + "px, " + finalRightEyeYOffset + "px)"; 
    document.getElementById("leftEye").style.transform = "translate(" + finalLeftEyeXOffset + "px, " + finalLeftEyeYOffset + "px)";
    
    
    /*if(e.clientX > rightEye.x) {
      e.clientX - 5 > rightEye.X ? document.getElementById("rightEye").style.transform = "translate(" + e.clientX - rightEye.x + "px, 0px)" : document.getElementById("rightEye").style.transform = "translate(" + 5 + "px, 0px)";
      //document.getElementById("rightEye").style.transform = "translate(" + number + "px, 0px)";
    }
    console.log("mouse location:", e.clientX + " and " + rightEye.x);
    console.log(document.getElementById("rightEye").getBoundingClientRect()); */
  };

  function unSmile() {
    document.getElementById("smile").setAttribute('d','M 124.934 237.689 Q 153.613 249.626 174.083 228.508')
    document.getElementById("smile").style.transform = "translate(0px, 0px) scale(1, 1) rotate(0deg)";
    document.getElementById("smile").style.fill = "transparent";
  }

  function smile() {
    document.getElementById("smile").style.transform = "translate(24px, 0px) scale(1.5, 1) rotate(10deg)";
  }

  function oMouth() {
    console.log("TYPING!");
    //document.getElementById("smile").style.transform = "translate(8px, 82px) scale(0.5, 0.1) rotate(10deg)";
    console.log(document.getElementById("smile").getAttribute('d'));
    document.getElementById("smile").setAttribute("d","M 134.5 238 C 134.5 232.481 141.445 228 150 228 C 158.555 228 165.5 232.481 165.5 238 C 165.5 243.519 158.555 248 150 248 C 141.445 248 134.5 243.519 134.5 238 Z");
    document.getElementById("smile").style.fill = "white";
  }