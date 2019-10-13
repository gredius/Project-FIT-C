<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	window.onload=function()
	{
		$('#btn').on('click',poppop);
		
	}
	function poppop()
	{
		location.href="/one/";
	}
	
</script>
<style>
	
		body {
   			margin: 0;
  			background: linear-gradient(45deg, #49a09d, #5f2c82);
   			font-family: sans-serif;
   			font-weight: 100;
		}
		
		a
		{
			text-decoration:none;
		}
	
</style>
</head>
<body>
	<table style="position:relative;left:30%;">
		<tr>
			<th>
				<h1>${fit_userid}님 가입을 환영합니다!</h1>
			</th>
		</tr>
		<tr>
			<th>
				<h4>이제 Fit_C의 모든 기능을 이용하실 수 있습니다.</h4>
			</th>
			<th>
				<input type="button" value="Home" id="btn">
			</th>
		</tr>
	</table>
</body>
</html>