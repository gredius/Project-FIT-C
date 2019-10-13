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
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js" integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk="
  crossorigin="anonymous"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Dancing+Script">
<script>
	var usergpubench;
	var gamegpubench;
	var usercpubench;
	var gamecpubench;
	var gameram = "${game.gameram}";
	var gamecpu = "${game.gamecpu}";
	var gamegpu = "${game.gamegpu}";
	var ramvalue;
	var userram;
	var usercpu;
	var usergpu;
	var usermainboard;
	var usercase;
	var userpower;
	var maincpu;
	var maincase;
	var addflag;
	var pageflag = ${pageflag};
	var ajaxflag = false;
	var myflag = false;
	var compareflag = false;
	////////////////
	var tempva;
	$(function(){
		$('.mytabs').hide();
		$('.lastbtn').hide();
		$('#compareConfirm').on('click', compareInfo);
		/////////////////////////////////////////////////add 1008
		$('#userramConfirm').on('click', changeram);
		$('#usercpuConfirm').on('click', changecpu);
		$('#usergpuConfirm').on('click', changegpu);
		$('#usermainboardConfirm').on('click', changemainboard);
		$('#userpowerConfirm').on('click', changepower);
		$('#usercaseConfirm').on('click', changecase);
		
		$('#getcomparebtn').on('click', comparebtn);	
		$('#recomparebtn').on('click', recompare);
		$('#saveestibtn').on('click', saveesti);
		///////////////////////////////////////////////// add 1008
		var result = JSON.parse(sessionStorage.getItem('result'));
		if(result!=null)
		{
			$('#usercpu').val(result[0]);
			usercpu = result[0];
			$('#usermainboard').val(result[1]);
			usermainboard = result[1];
			$('#usergpu').val(result[2]);
			usergpu = result[2];
			$('#userram').val(result[3]);
			userram = result[3];
		}
		if(pageflag==true || pageflag=="true")
		{
			compare();
		}
		$('#userram').on('focusout',function()
				{
					var chk = document.getElementById('userramConfirm').value;
					if(chk=="확인")
					{
						var chkram = document.getElementById('userram').value;
						if(!(chkram==""||chkram==null)){
							if(confirm("입력하신 부품으로 수정하시겠습니까?"))
							{
								document.getElementById('userram').readOnly="readonly";
								document.getElementById('userramConfirm').value="수정";
							} else document.getElementById('userram').focus();	
						} else {
							document.getElementById('userram').placeholder="정보를 입력하셔야합니다.";
							document.getElementById('userram').focus();
						}
						
					}
		})
		$('#usercpu').on('focusout',function()
				{
					var chk = document.getElementById('usercpuConfirm').value;
					if(chk=="확인")
					{
						var chkram = document.getElementById('usercpu').value;
						if(!(chkram==""||chkram==null)){
							if(confirm("입력하신 부품으로 수정하시겠습니까?"))
							{
								document.getElementById('usercpu').readOnly="readonly";
								document.getElementById('usercpuConfirm').value="수정";
							} else document.getElementById('usercpu').focus();	
						} else {
							document.getElementById('usercpu').placeholder="정보를 입력하셔야합니다.";
							document.getElementById('usercpu').focus();
						}
						
					}
		})
		$('#usergpu').on('focusout',function()
				{
					var chk = document.getElementById('usergpuConfirm').value;
					if(chk=="확인")
					{
						var chkram = document.getElementById('usergpu').value;
						if(!(chkram==""||chkram==null)){
							if(confirm("입력하신 부품으로 수정하시겠습니까?"))
							{
								document.getElementById('usergpu').readOnly="readonly";
								document.getElementById('usergpuConfirm').value="수정";
							} else document.getElementById('usergpu').focus();	
						} else {
							document.getElementById('usergpu').placeholder="정보를 입력하셔야합니다.";
							document.getElementById('usergpu').focus();
						}
						
					}
		})
		///////////////////////add ma 1007
		$('#usercpu').autocomplete({
			source: function(request,response)
			{
				$.ajax({
					url:"/one/getauto",
					type:"get",
					dataType: "json",
					data:{keyvalue : request.term,"key":"fit_cpu"},
					success: function(data)
					{
						response($.map(data, function(item) 
		                {
		                 	return {label: item,value: item}
		                }));
					}
				})
			},
			focus: function(event, ui){ return false;},
			minLength: 2
		});
		////////////////////////////////////////
		$('#usergpu').autocomplete({
			source: function(request,response)
			{
				$.ajax({
					url:"/one/getauto",
					type:"get",
					dataType: "json",
					data:{keyvalue : request.term,"key":"fit_gpu"},
					success: function(data)
					{
						response($.map(data, function(item) 
		                {
		                 	return {label: item,value: item}
		                }));
					}
				})
			},
			focus: function(event, ui){ return false;},
			minLength: 2
		});
////////////////////////////////////////
		$('#userram').autocomplete({
			source: function(request,response)
			{
				$.ajax({
					url:"/one/getauto",
					type:"get",
					dataType: "json",
					data:{keyvalue : request.term,"key":"fit_ram"},
					success: function(data)
					{
						response($.map(data, function(item) 
		                {
		                 	return {label: item,value: item}
		                }));
					}
				})
			},
			focus: function(event, ui){ return false;},
			minLength: 2
		});
////////////////////////////////////////
		$('#usermainboard').autocomplete({
			source: function(request,response)
			{
				$.ajax({
					url:"/one/getauto",
					type:"get",
					dataType: "json",
					data:{keyvalue : request.term,"key":"fit_mainboard"},
					success: function(data)
					{
						response($.map(data, function(item) 
		                {
		                 	return {label: item,value: item}
		                }));
					}
				})
			},
			focus: function(event, ui){ return false;},
			minLength: 2
		});
////////////////////////////////////////
		$('#usercase').autocomplete({
			source: function(request,response)
			{
				$.ajax({
					url:"/one/getauto",
					type:"get",
					dataType: "json",
					data:{keyvalue : request.term,"key":"fit_case"},
					success: function(data)
					{
						response($.map(data, function(item) 
		                {
		                 	return {label: item,value: item}
		                }));
					}
				})
			},
			focus: function(event, ui){ return false;},
			minLength: 2
		});
////////////////////////////////////////
		$('#userpower').autocomplete({
			source: function(request,response)
			{
				$.ajax({
					url:"/one/getauto",
					type:"get",
					dataType: "json",
					data:{keyvalue : request.term,"key":"fit_power"},
					success: function(data)
					{
						response($.map(data, function(item) 
		                {
		                 	return {label: item,value: item}
		                }));
					}
				})
			},
			focus: function(event, ui){ return false;},
			minLength: 2
		});
		
	})
	
////////////////////////////////////////////////////////////////////////////////////
	function changeram()
	{
		if(ajaxflag == true)
		{
			alert("부품비교중에는 수정하실 수 없습니다.")
			return false;
		}
		var chkflag = document.getElementById('userramConfirm').value
		if(chkflag=="수정")
		{
			document.getElementById('userram').value="";
			document.getElementById('userram').readOnly="";
			document.getElementById('userramConfirm').value="확인";
			document.getElementById('userram').focus();
		} else {
			document.getElementById('userram').readOnly="readonly";
			document.getElementById('userramConfirm').value="수정";
		}
	}
	
	function changemainboard()
	{
		var chkflag = document.getElementById('usermainboardConfirm').value
		if(chkflag=="수정")
		{
			document.getElementById('usermainboard').value="";
			document.getElementById('usermainboard').readOnly="";
			document.getElementById('usermainboardConfirm').value="확인";
			document.getElementById('usermainboard').focus();
		} else {
			document.getElementById('usermainboard').readOnly="readonly";
			document.getElementById('usermainboardConfirm').value="수정";
		}
	}
	
	function changecase()
	{
		var chkflag = document.getElementById('usercaseConfirm').value
		if(chkflag=="수정")
		{
			document.getElementById('usercase').value="";
			document.getElementById('usercase').readOnly="";
			document.getElementById('usercaseConfirm').value="확인";
			document.getElementById('usercase').focus();
		} else {
			document.getElementById('usercase').readOnly="readonly";
			document.getElementById('usercaseConfirm').value="수정";
		}
	}
	
	function changepower()
	{
		var chkflag = document.getElementById('userpowerConfirm').value
		if(chkflag=="수정")
		{
			document.getElementById('userpower').value="";
			document.getElementById('userpower').readOnly="";
			document.getElementById('userpowerConfirm').value="확인";
			document.getElementById('userpower').focus();
		} else {
			document.getElementById('userpower').readOnly="readonly";
			document.getElementById('userpowerConfirm').value="수정";
		}
	}
	
	function changecpu()
	{
		if(ajaxflag == true)
		{
			alert("부품비교중에는 수정하실 수 없습니다.")
			return false;
		}
		var chkflag = document.getElementById('usercpuConfirm').value
		if(chkflag=="수정")
		{
			document.getElementById('usercpu').value="";
			document.getElementById('usercpu').readOnly="";
			document.getElementById('usercpuConfirm').value="확인";
			document.getElementById('usercpu').focus();
		} else {
			document.getElementById('usercpu').readOnly="readonly";
			document.getElementById('usercpuConfirm').value="수정";
		}
	}
	function changegpu()
	{
		if(ajaxflag == true)
		{
			alert("부품비교중에는 수정하실 수 없습니다.")
			return false;
		}
		var chkflag = document.getElementById('usercpuConfirm').value
		if(chkflag=="수정")
		{
			document.getElementById('usergpu').value="";
			document.getElementById('usergpu').readOnly="";
			document.getElementById('usergpuConfirm').value="확인";
			document.getElementById('usergpu').focus();
		} else {
			document.getElementById('usergpu').readOnly="readonly";
			document.getElementById('usergpuConfirm').value="수정";
		}
	}
	//////////
	function compare()
	{
		usercpu = $('#usercpu').val();
		usergpu = $('#usergpu').val();
		userram = $('#userram').val();
		usermainboard = $('#usermainboard').val();
		
		$.ajax
		({
			url:"/one/compare/comparetwo",
			type:"POST",
			data:{"usercpu":usercpu,"usergpu":usergpu,"userram":userram,"usermainboard":usermainboard,
				"gamecpu":gamecpu,"gamegpu":gamegpu,"gameram":gameram},
			dataType: "JSON",
			beforeSend: function(){
				if(ajaxflag==true) return false;
				if(myflag==true){
					alert("비교를 시작합니다.")
				}
				ajaxflag = true;
				comfareflag= false;
				$('.updatebtn').hide();	
				$('.lastbtn').hide();
			},
			success:function(result)
			{
				////////////////////////////////////CPU Compare
				usercpubench = Number(result.usercpubench);
				gamecpubench = Number(result.gamecpubench);
				////////////////////////////////gpu Compare
				usergpubench = Number(result.usergpubench);
				gamegpubench = Number(result.gamegpubench);
				userram = Number(result.userram);
				gameram = Number(result.gameram);
				ajaxflag = false;
				comfareflag= true;
	
				if(myflag==true){
					if(confirm("Compare정보를 확인하시겠습니까?")){
						compareInfo();
					}
				}				
				myflag=false;
				$('.updatebtn').show();
				$('.lastbtn').show();	
			},
			error:function()
			{
				alert("error");
			}
		})
	}
	function recompare()
	{
		usercpu = $('#usercpu').val();
		usergpu = $('#usergpu').val();
		userram = $('#userram').val();
		usermainboard = $('#usermainboard').val();
		usercase = $('#usercase').val();
		userpower = $('#userpower').val();
		$.ajax
		({
			url:"/one/compare/allcompare",
			type:"POST",
			data:{"usercpu":usercpu,"usergpu":usergpu,"userram":userram,"usermainboard":usermainboard,
				"gamecpu":gamecpu,"gamegpu":gamegpu,"gameram":gameram,"usercase":usercase,"userpower":userpower},
			dataType: "JSON",
			beforeSend: function(){
				if(ajaxflag==true) return false;
				if(myflag==true){
					alert("비교를 시작합니다.")
				}
				ajaxflag = true;
				comfareflag= false;
				$('.updatebtn').hide();	
				$('.lastbtn').hide();
				removeresult();
				makeloading();
			},
			success:function(result)
			{
////////////////////////////////////CPU Compare
				usercpubench = Number(result.usercpubench);
				gamecpubench = Number(result.gamecpubench);
				////////////////////////////////gpu Compare
				usergpubench = Number(result.usergpubench);
				gamegpubench = Number(result.gamegpubench);
				userram = Number(result.userram);
				gameram = Number(result.gameram);
				maincpu = result.maincpu;
				maincase = result.maincase;
				ajaxflag = false;
				comfareflag= true;
				$('.lastbtn').show();
				addcompare();
			},
			error:function()
			{
				alert("error");
			}
		})
	}
	function comparebtn()
	{
		addtd();
		makeloading();
		compare();
	}
	function recomparebtn()
	{
		alert("미구현");
	}
	function deleteloading()
	{
		$('.compare').css("opacity","1");
		$('.compare').css("background-color","rgba(255,255,255,0.2)");
		$('.comparetext').remove();
	}
	
	function addtd()
	{
		if(addflag!=true){
			document.getElementById("getcomparebtn").type="hidden"
			document.getElementById('cputd').rowSpan="1";
			$('#gputr').append("<td id='gputd' class='compare'><div class='comparetext'></div>"+
			"<div id='gpucompare'></div></td>");
			$('#ramtr').append("<td id='ramtd' class='compare'><div class='comparetext'></div>"+
			"<div id='ramcompare'></div></td>");
			addflag=true;
		};
	}
	/////////////////
	function addcompare()
	{
		//////////////////////////////////////RAM COMPARE
		deleteloading();
		ramvalue = gameram - userram;
		if(ramvalue>0)
		{
			if((gameram*0.01*0.05)>ramvalue)
			{
				$('#ramcompare').append("<span id='ramresult'><span id='grresult'>"+gameram+"GB</span>"+
						"<span style='font-size: 1.3em;font-weight: bolder;'> VS </span>"+
						"<span id='urresult'>"+userram+"GB</span>"+
						"<br><span id='ramresulttext'></span></span>");
						$('#grresult').css("color","red");
						$('#grresult').css("font-weight","bold");
						$('#urresult').css("color","blue");
						$('#ramresulttext').append("You need upgrade RAM");
				
			} else {
				$('#ramcompare').append("<span id='ramresult'><span id='grresult'>"+gameram+"GB</span>"+
				"<span style='font-size: 1.3em;font-weight: bolder;'> VS </span>"+
				"<span id='urresult'>"+userram+"GB</span>"+
				"<br><span id='ramresulttext'></span></span>");
				$('#grresult').css("color","red");
				$('#grresult').css("font-weight","bold");
				$('#urresult').css("color","red");
				$('#urresult').css("font-weight","bold");
				$('#ramresulttext').append("Ram is Enough!");
			}
		} else{
			$('#ramcompare').append("<span id='ramresult'><span id='grresult'>"+gameram+"GB</span>"+
					"<span style='font-size: 1.3em;font-weight: bolder;'> VS </span>"+
					"<span id='urresult'>"+userram+"GB</span>"+
					"<br><span id='ramresulttext'></span></span>");
			$('#grresult').css("color","blue");
			$('#urresult').css("color","red");
			$('#urresult').css("font-weight","bold");
			$('#ramresulttext').append("Ram is Enough!");
		}
		////////////////////////////////////CPU Compare
		if(usercpubench==gamecpubench)
		{
			$('#cpucompare').append("<span id='cpuresult'><span id='gcresult'>Score : "+gamecpubench+"</span>"+
					"<span style='font-size: 1.3em;font-weight: bolder;'> VS </span>"+
					"<span id='ucresult'>Score : "+usercpubench+"</span>"+
					"<br><span id='cpuresulttext'></span></span>");
					$('#gcresult').css("color","red");
					$('#gcresult').css("font-weight","bold");
					$('#ucresult').css("color","red");
					$('#ucresult').css("font-weight","bold");
					$('#cpuresulttext').append("Cpu is Enough!");
		} else if(usercpubench>gamecpubench)
		{
			$('#cpucompare').append("<span id='cpuresult'><span id='gcresult'>Score : "+gamecpubench+"</span>"+
					"<span style='font-size: 1.3em;font-weight: bolder;'> VS </span>"+
					"<span id='ucresult'>Score : "+usercpubench+"</span>"+
					"<br><span id='cpuresulttext'></span></span>");
					$('#gcresult').css("color","blue");
					$('#ucresult').css("color","red");
					$('#ucresult').css("font-weight","bold");
					$('#cpuresulttext').append("Cpu is Enough!");
		} else 
		{
			$('#cpucompare').append("<span id='cpuresult'><span id='gcresult'>Score : "+gamecpubench+"</span>"+
					"<span style='font-size: 1.3em;font-weight: bolder;'> VS </span>"+
					"<span id='ucresult'>Score : "+usercpubench+"</span>"+
					"<br><span id='cpuresulttext'></span></span>");
					$('#gcresult').css("color","red");
					$('#gcresult').css("font-weight","bold");
					$('#ucresult').css("color","blue");
					$('#cpuresulttext').append("You need upgrade CPU");
		}
		
		////////////////////////////////gpu Compare
		if(usergpubench==gamegpubench)
		{
			$('#gpucompare').append("<span id='gpuresult'><span id='ggresult'>Score : "+gamegpubench+"</span>"+
					"<span style='font-size: 1.3em;font-weight: bolder;'> VS </span>"+
					"<span id='ugresult'>Score : "+usergpubench+"</span>"+
					"<br><span id='gpuresulttext'></span></span>");
					$('#ggresult').css("color","red");
					$('#ggresult').css("font-weight","bold");
					$('#ugresult').css("color","red");
					$('#ugresult').css("font-weight","bold");
					$('#gpuresulttext').append("Gpu is Enough!");
		} else if(usergpubench>gamegpubench)
		{
			$('#gpucompare').append("<span id='gpuresult'><span id='ggresult'>Score : "+gamegpubench+"</span>"+
					"<span style='font-size: 1.3em;font-weight: bolder;'> VS </span>"+
					"<span id='ugresult'>Score : "+usergpubench+"</span>"+
					"<br><span id='gpuresulttext'></span></span>");
					$('#ggresult').css("color","blue");
					$('#ugresult').css("color","red");
					$('#ugresult').css("font-weight","bold");
					$('#gpuresulttext').append("Gpu is Enough!");
		} else 
		{
			$('#gpucompare').append("<span id='gpuresult'><span id='ggresult'>Score : "+gamegpubench+"</span>"+
					"<span style='font-size: 1.3em;font-weight: bolder;'> VS </span>"+
					"<span id='ugresult'>Score : "+usergpubench+"</span>"+
					"<br><span id='gpuresulttext'></span></span>");
					
			$('#ggresult').css("color","red");
			$('#ggresult').css("font-weight","bold");
			$('#ugresult').css("color","blue");
			$('#gpuresulttext').append("You need Upgrade GPU");
		}
		/////////////////////////////////////////////////
		if(!(maincpu==null||maincpu=="")){
			$('#mainboardcompare').append('<h4>'+maincpu+'</h4')
		}
		if(!(maincase==null||maincase=="")){
			$('#casecompare').append('<h4>'+maincase+'</h4')
		}
		
		
	}
	
	function removeresult()
	{
		document.getElementById("recomparebtn").type="hidden";
		$('#gpuresult').remove();
		$('#cpuresult').remove();
		$('#ramresult').remove();
		
	}
	function makeloading()
	{
		$('.compare').css("opacity","0.7");
		$('.compare').css("background-color","black");
		$('.compare').append("<h5 style='color:white' class='comparetext'>Please Wait</h5>");
	}
	///////////////////////////////////////////////////////////////////
	function compareInfo(){
		document.getElementById('titletd').colSpan="4";
		document.getElementById('titletd').innerText="";
		document.getElementById('compareConfirm').type="hidden";
		$('#titletd').append('<h2>나만의 사양</h2>')
		document.getElementById('memotd').colSpan="4";
		$('.mytabs').show();		
		myflag=true;
		if(ajaxflag==false){
			if(usercpubench==null||usercpubench==""){
				myflag=true;
				makeloading();
				compare();
			} else addcompare();
			
		} else{
			makeloading();
			alert("정보를 비교중입니다.");
		} 
	}
	function saveesti(){
		var cpu = $('#usercpu').val();
		var gpu = $('#usergpu').val();
		var ram = $('#userram').val();
		var main = $('#usermainboard').val();
		var power = $('#userpower').val();
		var usecase = $('#usercase').val();
		$.ajax({
			url:"/one/compare/saveesti",
			type:"POST",
			data:{"fit_cpuname":cpu,"fit_gpuname":gpu,"fit_ramname":ram,"fit_mainboardname":main,
				"fit_casename":usecase,"fit_powername":power},
			success:function(){
				alert("저장하였습니다.")
			},
			error:function(){
				alert("저장에 실패하였습니다.")
			}
			
		})
		
		
	}
</script>
<style>
	.ui-autocomplete
    {
        max-height: 30%;
        overflow-y: auto; /* prevent horizontal scrollbar */
        overflow-x: hidden;
    }
    /* IE 6 doesn't support max-height
     * we use height instead, but this forces the menu to always be this tall
     */
    html .ui-autocomplete
    {
        height: 30%;
    }
	a {
	
		text-decoration: none;
	}
	/*div{
	        border: 1px solid #ccc;
	    }*/
	h1, h5 {
		text-align: center;
		font-family: 'NanumGothic';
	}
	
	.box1 {
		margin-top: 30px;
		margin-left: 20%;
		width: 60%;
		height: 60%;
		margin-bottom: 5%;
		align-content: center
	}
	
	.box2 {
		float: right;
		width: 10%;
		margin-top: 30px;
		margin-left: 5%;
		margin-right: 5%;
		height: 50px;
	}
	
	.box3 {
		float: left;
		width: 10%;
		margin-top: 30px;
		margin-left: 5%;
		margin-right: 5%;
		height: 50px;
		align-text: center;
	}
	
	.footer {
		text-align: center;
		clear: both;
	}
	
	#topMenu {
		height: 30px;
		width: 120px;
	}
	
	#topMenu ul { /*메인메뉴 ul 설정*/
		list-style-type: none;
		margin: 0px;
		padding: 0px;
	}
	
	#topMenu ul li {
		float: left;
		line-height: 30px;
		vertical-align: middle;
		text-align: center;
		position: relative;
	}
	
	.menuLink, .submenuLink {
		text-decoration: none;
		display: block;
		width: 150px;
		font-weight: bold;
	}
	
	.topMenuLi:hover .menuLink {
		color: red;
		background-color: #4d4d4d;
	}
	
	.longLink {
		width: 150px;
	}
	
	.submenu {
		position: absolute;
		height: 0px;
		overflow: hidden;
		transaction: height .2s;
		-webkit-transition: height .2s;
		/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */
		-moz-transition: height .2s;
		/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */
		-o-transition: height .2s;
		/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */
	}
	
	.submenuLink {
		border: solid 1px black;
		margin-top: -1px;
	}
	
	.submenuLink:hover {
		color: red;
	}
	
	.topMenuLi:hover .submenu {
		height: 125px;
	}
	
	.infoBanner {
		position: fixed;
		top: 20%;
		right: 20%;
	}
	
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
		width: 100%;
		height: 50%;
	}
	
	#chartjs-tooltip {
		opacity: 1;
		position: absolute;
		background: white;
		color: black;
		border: 1px solid black;
		-webkit-transition: all .1s ease;
		transition: all .1s ease;
		pointer-events: none;
		-webkit-transform: translate(-50%, 0);
		transform: translate(-50%, 0);
		min-width: 10%;
	}
	
	.chartjs-tooltip-key {
		display: inline-block;
		width: 10px;
		height: 10px;
		margin-right: 10px;
	}
	
	#nondiv {
		position: absolute;
		left: 55%;
		width: 25%;
		top: 20%;
		text-align: center;
		background: rgba;
		border: 10px solid lightblue;
		border-radius: 25px;
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
	border-spacing: 3px; 
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

.updatebtn {
	border-radius: 8px;
	background-color: #55608f;
	color: white;
	border: 2px solid #55608f;
	padding: 8px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s;
	transition-duration: 0.4s;
	cursor: pointer;
}

.updatebtn:hover {
	background-color: rgba(255, 255, 255, 0.2);
	color: black;
}
.head:hover {
	-webkit-transition-duration: 0.4s;
	color: white;
}
#compareConfirm {
	border-radius: 8px;
	background-color: #55608f;
	color: white;
	border: 2px solid #55608f;
	padding: 16px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 18px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s;
	transition-duration: 0.4s;
	cursor: pointer;
}

#compareConfirm:hover {
	background-color: rgba(255, 255, 255, 0.2);
	color: black;
}
.drawsvg,svg {
		width: 100%; height: 100px
	} 
	.stroke {
		stroke: red; 
		stroke-width: 1px; 
		stroke-dasharray: 0 250; 
		stroke-opacity: 1; 
		fill: none; 
		-webkit-animation: stroke_offset 8s forwards; 
		animation: stroke_offset 8s forwards; 
		-webkit-animation-timing-function: 
		cubic-bezier(.25, .46, .45, .94); 
		animation-timing-function: cubic-bezier(.25, .46, .45, .94); 
		animation-fill-mode:both; 
	} 
	@-webkit-keyframes stroke_offset { 
		100%, 25% {
			stroke-dasharray: 0 250; stroke-opacity: 0 
			} 50%, 75% {
				stroke-dasharray: 250 0; stroke-opacity: .75 
					} 55%, 70% {
					stroke-dasharray: 250 0; stroke-opacity: 1 
					}
			} @keyframes stroke_offset { 
				 25% {
					stroke-dasharray: 0 250; stroke-opacity: 0 
					} 50% {
						stroke-dasharray: 250 0; stroke-opacity: .75 
						} 100% {
							stroke-dasharray: 250 0; stroke-opacity: 1 
							} 
						} 
		.fill { 
			fill: red; 
			fill-opacity: 0; 
			-webkit-animation: fill_offset 8s forwards; 
			animation: fill_offset 8s forwards; 
			-webkit-animation-timing-function: cubic-bezier(.25, .46, .45, .94); 
			animation-timing-function: cubic-bezier(.25, .46, .45, .94);
			animation-fill-mode:both; 
		} 
		@-webkit-keyframes fill_offset {
				100%, 25%, 35%, 90% { 
					fill-opacity: 0 
				} 50%, 70% { 
					fill-opacity: 1 
				} 
			} 
		@keyframes fill_offset { 
			25% { 
				fill-opacity: 0 
			} 50% { 
				fill-opacity: 0.5 
			} 75% { 
				fill-opacity: 0.75 
			} 100% { 
				fill-opacity: 1 
			} 
		} 
		#fade-text { 
			font-family: 'Dancing Script', cursive; 
			font-size: 4em
		} 
		@import url(https://fonts.googleapis.com/css?family=Alex+Brush);
		.loadingview
		{
			position : relative;
			top:200px;
		}
</style>
</head>
<body>
	<header>
		<div class = "title">
			<div class="drawsvg"> 
				<svg version="1.1" viewBox="0 0 2000 100"> 
				<symbol class="fade-text" id="fade-text"> 
				<text x="50%" y="50%" text-anchor="middle"><a href="/one/" >F i t - c</a></text> 
				<text style="font-size:0.5em;" x="50%" y="90%" text-anchor="middle">f i t  y o u r  g a m e</text> 
				</symbol> 
				<g> <use class="stroke" xlink:href="#fade-text"/> 
				<use class="fill" xlink:href="#fade-text"/> </g> </svg> </div>
	        </div>
	</header>

	<aside>
		<div class="box2">
			사이드1<br> 광고가 들어갈 자리
		</div>
	</aside>
	<aside>
		<div class="box3">
			<nav id="topMenu">
				<ul>
		        	<li class="topMenuLi" value="banner">
		        		<a class="menuLink">${sessionScope.fit_member.fit_usernick}님 Welcome</a>
		        		<ul class="submenu">
		        			<li><a href="/one/logOUT" class="submenuLink longLink">LOGOUT</a></li>
		        			<li><a href="/one/updateInfoForm" class="submenuLink longLink">회원정보 수정</a></li>
		        			<li><a href="/one/board/boardList" class="submenuLink longLink">견적게시판</a></li>
		        			<li><a href="#" class="submenuLink longLink">게임검색</a></li>
		        			<li><a href="#" class="submenuLink longLink">About</a></li>
		        		</ul>
		        	</li>
		        </ul>
			</nav>
		</div>
	</aside>
	
	<section>
		<div>
			<input type="hidden" id="gamename" value="${game.fit_name}">
			<div id="mydiv"></div>
			<div id="fitdiv">
			<table id="fittable">
				<tr>
					<th id="titletd" colspan="2">
						<h1>내 컴퓨터 사양</h1>
					</th>
				</tr>
				<tr class="mytabs" id="tabcate">
					<th><br></th>
					<th>${game.fit_name}의 권장사양</th>
					<th>나의 사양</th>
					<th>Status</th>
				</tr>
				<tr id="cputr">
					<th>
						C <br>
						P <br>
						U 
					</th>
					<td class="mytabs" id="gamecpu">
						${game.gamecpu}
					</td>
					<td>
						<input type="text" id="usercpu" readonly="readonly" >
						<input type="button" class="updatebtn" value="수정" id="usercpuConfirm">
					</td>
					<td class="compare mytabs"><span id="cpucompare"></span>
				</tr>
				<tr id = "gputr">
					<th>
						G <br>
						P <br>
						U 
					</th>
					<td class="mytabs" id="gamegpu">
						${game.gamegpu}
					</td>
					<td>
						<input type="text" id="usergpu" readonly="readonly" >
						<input type="button" class="updatebtn" value="수정" id="usergpuConfirm">
					</td>
					<td class="compare mytabs"><span id="gpucompare"></span>
				</tr>
				<tr id="ramtr">
					<th>
						R <br>
						A <br>
						M 
					</th>
					<td class="mytabs" id="gameram">
						${game.gameram}
					</td>
					<td>
						<input type="text" id="userram"  readonly="readonly"  >
						<input type="button" class="updatebtn" value="수정" id="userramConfirm">
					</td>
					<td class="compare mytabs" id="ramcompare">
				</tr>
				<tr class="mytabs" id="mainboardtr">
					<th>
						M<br>
						a<br>
						i<br>
						n<br>
						b<br>
						o<br>
						a<br>
						r<br>
						d
					</th>
					<td><h6>해당없음</h6></td>
					<td>
						<input type="text" id="usermainboard"  readonly="readonly">
						<input type="button" class="updatebtn" value="수정" id="usermainboardConfirm">
					</td>
					<td class="compare mytabs"><span id="mainboardcompare"></span>
				</tr>
				<tr class="mytabs" id="casetr">
					<th>
						C<br>
						A<br>
						S<br>
						E
					</th>
					<td><h6>해당없음</h6></td>
					<td>
						<input type="text" id="usercase"  readonly="readonly">
						<input type="button" class="updatebtn" value="수정" id="usercaseConfirm">
					</td>
					<td class="compare mytabs"><span id="casecompare"></span>
				</tr>
				<tr class="mytabs" id="powertr">
					<th>
						P<br>
						O<br>
						W<br>
						E<br>
						R
					</th>
					<td><h6>해당없음</h6></td>
					<td>
						<input type="text" id="userpower"  readonly="readonly">
						<input type="button" class="updatebtn" value="수정" id="userpowerConfirm">
					</td>
					<td class="compare mytabs"><span id="powercompare"></span>
				</tr>
				<tr id="memotr">
					<td id="memotd" colspan="2">
						<input type="button" value="비교하기" id="compareConfirm">
						<input type="button" class="lastbtn" value="비교하기" id="recomparebtn">
						<input type="button" class="lastbtn" value="견적저장하기" id="saveestibtn">
						<h5>@ FitC</h5>
					</td>
				</tr>
			</table>
			</div>
		</div>
		<input type="hidden" id="pageflag" value=""${pageflag}>
	</section>
	
	<footer>
		<div class="footer">
			푸터<br> 출처가 들어갈 자리
		</div>
	</footer>

</body>
</html>