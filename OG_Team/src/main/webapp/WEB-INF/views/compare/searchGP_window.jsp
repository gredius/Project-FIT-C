<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맞춤 견적</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.bundle.min.js"></script>
<script>
	$(function(){
		var r = JSON.parse(sessionStorage.getItem("resultGP"));
		$('#tableList').append("<tr><th colspan='2'>검색하신 Graphic 정보</th></tr><tr><td>제품명</td><td>선택</td><tr>")
		for(var i in r){
			$('#tableList').append("<tr><td>"
					+ r[i].fit_name + "</td><td><input type='radio' class='selectRadio' value='"
					+ r[i].fit_name + "' name='gp'></td></tr>");
		}
		$('#tableList').append("<tr><td colspan='2'><input type=button value='선택' onclick='sendValue()'></td></tr>")
	})
	
	function sendValue(){
		var inputValue = $("input[name='gp']:checked").val();
		if(confirm(inputValue + "를 선택하시겠습니까?")){
			opener.document.getElementById("graphic").value = inputValue;
			close();
		} else {
			alert("다시 선택해주세요.")
			return false;
		}
	}
</script>
<style>

</style>
</head>
<body>

	<table border="1" id="tableList">
	</table>

</body>
</html>