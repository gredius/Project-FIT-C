<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function changeEmail() {
		if (selectEmail.value == '1') {
			fitc_email_02.readonly = false;
			fitc_email_02.value = '';
			fitc_email_02.focus();
		} else {
			fitc_email_02.readonly = true;
			fitc_email_02.value = selectEmail.value;
		}

	}

	function signUP() {
		/* var fitc_id = document.getElementById("fitc_id");
		var fitc_pw = document.getElementById("fitc_pw");
		var check_pw = document.getElementById("check_pw");
		var fitc_name = document.getElementById("fitc_name");
		var fitc_nickname = document.getElementById("fitc_nickname");
		var fitc_email_01 = document.getElementById("fitc_email_01");
		var fitc_email_02 = document.getElementById("fitc_email_02");
		
		if(fitc_id.value.length<4 || fitc_id.value.length>10){
			alert('아이디는 4~10글자로 입력해주세요');
			fitc_id.focus();
			return;
		}

		if(fitc_pw.value.length<4 || fitc_pw.value.length>10){
			alert('비밀번호는 4~10글자로 입력해주세요');
			fitc_pw.focus();
			return;
		}

		if(fitc_nickname.value.length>10 || fitc_nickname.value.length == 0){
			alert('닉네임은 10글자 이하로 입력해주세요');
			fitc_nickname.focus();
			return;
		}
		
		if(fitc_pw.value != check_pw.value){
			alert('비밀번호가 일치하지 않습니다.');
			fitc_pw.focus();
			return;
		}

		if(fitc_name.value.length == 0){
			alert('이름을 입력해주세요')
			fitc_name.focus();
			return;
		}

		if(fitc_email_01.value.length == 0){
			alert('이메일을 입력해주세요')
			fitc_email_01.focus();
			return;
		}

		if(fitc_email_02.value.length == 0){
			alert('이메일을 입력해주세요')
			fitc_email_02.focus();
			return;
		} */

		var form = document.getElementById("signupForm");
		form.submit();
	}

	function cancel() {
		location.href = "/one/"
	}
	
	function check(){
		window.open('checkidForm', 'pop', 'resizable=no, scrollbars=no, status=no, toolbar=no, top=50, left=250, width=500, height=250');
	}
	
</script>
<style>
	header {
		text-align: center;
	}
	
	.registration form {
		width: 280px;
		height: 520px;
		background-color: #55608f;
		padding: 10px 0px 0px 4px;
		border-radius: 15px;
		color: white;
		text-transform: uppercase;
		font-size: 14px;
		font-weight: bold;
		font-family: "Century Gothic";
		margin: 0 auto;
	}
	
	.registration input, .registration select {
		width: 250px;
		height: 25px;
		margin: 3px 0px 0px 10px;
		border: 0px;
		font-weight: bold;
	}
	
	.registration input:focus {
		background-color: crimson;
	}
	
	.registration form label {
		margin: 5px 0px 0px 15px;
	}
	
	a {
		outline: none;
	}
html, body {
	height: 100%;
}

body {
	margin: 0;
	background: linear-gradient(45deg, #49a09d, #D0A3FF);
	font-family: sans-serif;
	font-weight: 100;
}

table {
	width: 800px;
	border-collapse: separate;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0,0,0,0.1);
	border-spacing: 1px; 
	text-align: center;
	line-height: 1.5;
	margin: 20px 10px;
	margin-left: auto;
	margin-right: auto; 
}

th,
td {
	padding: 15px;
	background-color: rgba(255,255,255,0.2);
	color: #fff;
}

th {
	text-align: center;
	background-color: #55608f;
}


tr:hover {
		background-color: rgba(255,255,255,0.2);
			
}
td:hover {
		background-color: rgba(255,255,255,0.4);
		color: black;
		-webkit-transition-duration: 0.4s;
}

.button {
	border-radius: 8px;
	background-color: rgba(255, 255, 255, 0.2);
	color: white;
	text-align: center;
	text-decoration: none;
	font-size: 12px;
	-webkit-transition-duration: 0.4s;
	transition-duration: 0.4s;
	cursor: pointer;
}

.button:hover {
	background-color: white;
	color: black;
} 
.head:hover {
	-webkit-transition-duration: 0.4s;
	color: white;
}
</style>
</head>
<body>
	<header>
		<div>
			<h1>
				<a href="/one/" class="head">Fit-c</a>
			</h1>
			<h5>Fit your game</h5>
		</div>
	</header>	
	<section>
		<div class="registration">
			<form name="signupForm" id="signupForm" action="signUP" method="post">
				<label>회원가입</label>
				<br/><br/>
				<label>아이디</label>
					<input type="text" placeholder=" 아이디" name="fit_userid" id="fitc_id" readonly="readonly" style="background-color: lightgray;" />
					<input type="button" id="checkID" value="중복확인" onclick="check();" class="button">
				<br/><br/>
				<label>비밀번호</label>
					<input type="password" placeholder=" 비밀번호" name="fit_userpwd" id="fit_userpwd" />
				<br/><br/>
				<label>비밀번호 확인</label>
					<input	type="password" placeholder=" 비밀번호 확인" id="check_pw">
				<br/><br/>
				<label>닉네임</label>
					<input type="text" placeholder=" 닉네임" name="fit_usernick" id="fitc_nickname" />
				<br/><br/>
				<label>이메일</label>
					<input type="text" name="fitc_email_01" class="selectEmail" id="fitc_email_01" /><br/>
					&nbsp;&nbsp;&nbsp;@ <input type="text" name="fitc_email_02" class="selectEmail" id="fitc_email_02" style="width: 100px" />
					<select style="width: 110px" class="selectEmail" name="selectEmail" id="selectEmail" onChange="changeEmail()">
						<option value="1" selected>직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
					</select>
				<br/><br/>
				<input type="button" value="회원가입" onclick="signUP()" class="button"/>
				<input type="button" value="취소" onclick="cancel()" class="button"/>
			</form>
		</div>
	</section>
</body>
</html>