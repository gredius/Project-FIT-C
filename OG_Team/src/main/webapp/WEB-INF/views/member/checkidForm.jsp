<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	function idchk(){
		var id = $('#fit_userid').val();
		if(id == null || id == ""){
			alert("아이디를 입력해주세요");
			return;
		}

		if(id.length<4 || id.length>10){
			alert('아이디는 4~10글자로 입력해주세요');
			return;
		}
		$.ajax({
			url:"/one/checkID",
			type:"get",
			data:{"fit_userid":id},
			dataType:"json",
			success:function(result){
				if(result==false)
				{
					alert("이미 사용중인 ID입니다");
				} else if (result==true)
				{
					if(confirm("사용가능한 ID입니다. 사용하시겠습니까?"))
					{
						opener.document.getElementById("fitc_id").value = id;
						close();
					}
				}
			},
			error:function(){
				alert("error");
			}
		})
	}
</script>
<style>

	header {
		text-align: center;
	}
	
	.registration {
		width: 275px;
		height: 75px;
		background-color: black;
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
	
</style>
</head>
<body>
	<header>
		<h2>아이디 중복확인</h2>
	</header>
	<div class="registration">
		<input type="text" id="fit_userid" placeholder=" 아이디">
		<input type="button" value="확인" onclick="idchk()">
	</div>
</body>
</html>