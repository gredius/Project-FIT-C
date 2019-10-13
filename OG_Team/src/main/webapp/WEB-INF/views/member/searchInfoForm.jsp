<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	header {
		text-align: center;
	}
	.registration #findMember{
		width: 400px;
		height: 170px;
		background-color: #55608f;
		padding: 10px 0px 0px 4px;
		border-radius: 15px;
		color: white;
		text-transform: uppercase;
		font-size: 14px;
		font-weight: bold;
		font-family: "Century Gothic";
		margin: 0 auto;
		text-align: center;
	}
	
	.registration #findpw{
		width: 400px;
		height: 200px;
		background-color: #55608f;
		padding: 10px 0px 0px 4px;
		border-radius: 15px;
		color: white;
		text-transform: uppercase;
		font-size: 14px;
		font-weight: bold;
		font-family: "Century Gothic";
		margin: 0 auto;
		text-align: center;
	}
		
	.registration input, .registration select {
		width: 250px;
		height: 25px;
		margin: 3px 0px 0px 10px;
		border: 0px;
		font-weight: bold;
	}
	
	.registration input:focus {
	}
	
	.registration form label {
		margin: 5px 0px 0px 15px;
	}
	
	a {
		outline: none;
	}
	.register_button {
		width: 149px;
		height: 42px;
		background-color: #64D1C9;
		border-radius: 10px;
		margin: 15px auto 0px auto;
		text-align: center;
		cursor: pointer;
		clear: both;
	}
	
	.register_button span {
		font-weight: normal;
		font-size: 28px;
		font-family: "Impact";
		line-height: 40px;
	}
	
	.register_button span a {
		text-decoration: none;
		color: white;
	}
	
	.register_button span a:hover {
		color: black;
		-webkit-transition-duration: 0.4s;
	}
	
	span.error {
		margin-right: 20px;
		font-size: 9px;
		color: orange;
		height: 10px;
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
	background-color: rgba(255,255,255,0.3);
	color: black;
	border: 2px solid black;
	padding: 4px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s;
	transition-duration: 0.4s;
	cursor: pointer;
} 
.button:hover {
	background-color: #55608f;
	color: white;
}
.head:hover {
	-webkit-transition-duration: 0.4s;
	color: white;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>

	$(function(){
		$('#findId').on('click', searchId);
		$('#findPW').on('click', searchPW);
	})

	function searchId(){
		$.ajax({
			url:"/three/searchInfo",
			type:"post",
			data:{"fitc_name":$("#fitc_name_id").val(),"fitc_email":$("#fitc_email_id").val()},
			success:function(result){
				if(result != null){
					alert("찾으신 아이디는 " + result + " 입니다.");
				}else{
					alert("찾는 아이디가 없습니다.");
				}
			},
			error:function(){
				alert("error");
			}
		})
	}

	function searchPW(){
		$.ajax({
			url:"/three/searchPW",
			type:"post",
			data:{"fitc_id":$("#fitc_id_pw").val(), "fitc_name":$("#fitc_name_pw").val(), "fitc_email":$("#fitc_email_pw").val()},
			success:function(result){
				if(result != null){
					alert("찾으신 비밀번호는 " + result + " 입니다.");
				}else{
					alert("다시 입력해주세요.");
				}
			},
			error:function(){
				alert("error");
			}
		})
	}


	function goId(){
		var test1 = document.getElementById("test1");
		var test2 = document.getElementById("test2");
	
		test1.style.display = 'none';
		test2.style.display = 'block';
	}
	
	function goPassword(){
		var test1 = document.getElementById("test1");
		var test2 = document.getElementById("test2");
	
		test1.style.display = 'block';
		test2.style.display = 'none';
	}
	
</script>
</head>
<body>
	<header>
		<h2 class="head">아이디 / 비밀번호 찾기</h2>
	</header>
	<div class="registration">
		<div id="test1" style="display:;">
			<form id="findMember" action="searchInfo" method="post">
			
				<a href="#" class="button" onclick="goPassword()">아이디 찾기</a>&nbsp;&nbsp;&nbsp;
				<a href="#" class="button" onclick="goId()">패스워드 찾기</a>
				<br/><br/>
				<input type="text" placeholder=" 이름" id="fitc_name_id" name="fitc_name" />
				<br/>
				<input type="email" placeholder=" 이메일주소" id="fitc_email_id" name="fitc_email"  />
				<br/>
				<div class="register_button">
					<span><a href="#" id="findId">CHECK</a></span>
				</div>
			</form>
		</div>
		
		<div id="test2" style="display: none;">
			<form id="findpw" action="searchPW" method="post">
			
				<a href="#" class="button" onclick="goPassword()">아이디 찾기</a>&nbsp;&nbsp;&nbsp;
				<a href="#" class="button" onclick="goId()">패스워드 찾기</a>
				<br/><br/>
				<input type="text" placeholder=" 아이디" id="fitc_id_pw" name="fitc_id"  />
				<br/>
				<input type="text" placeholder=" 이름" id="fitc_name_pw" name="fitc_name"  />
				<br/>
				<input type="email" placeholder=" 이메일주소" id="fitc_email_pw" name="fitc_email" />
				<br/>
				<div class="register_button">
					<span><a href="#" id="findPW">CHECK</a></span>
				</div>
			</form>
		</div>
	</div>
</body>
</html>