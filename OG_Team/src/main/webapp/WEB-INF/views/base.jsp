<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>차트 연동하기</title>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.bundle.min.js"></script>
	<script>
		
		var addwin ;
		window.onload = function(){
			
		}
////////////////////////base////////////////////////////////////////////
		function dbchk()
		{
			$.ajax({
				url:"/one/dbchk",
				type:"get",
				success:function(result)
				{
					var a = result;
					if(a=="false")
					{
						$.ajax
						({
							url:"/one/db/makedb",
							type:"get",
							error:function()
							{
								alert("error");
							}
						})
					}
				},
				error:function()
				{
					dbchk;
				}
			})
			
		}
	///////////////////////// Add //////////////////////////////////
		function logIN(){
			$.ajax({
				url:"/one/logIN",
				type:"post",
				data:$('#login').serialize(),
				dataType:"json",
				success:function(result)
				{
					if(result ==1){
						location.reload();
					} else if (result ==2)
					{
						alert("메일인증을 완료해주세요");
					} else 
					{
						alert("ID혹은 PASSWORD가 정확하지않습니다");
					}
				},
				error:function()
				{
					alert("Error!");
				}
				
			})
		}	
		
	function checkad()
	{
		alert("다시한번 생각해보십쇼");
	}
	///////////////////////////
	function fitEstimate(obj) {
		var estimate = confirm("본인의 컴퓨터 부품에 대해 알고 계신가요?"+"(취소를 누르시면 사양을 알 수 있습니다.)");
		if(estimate == true){
			location.href = "/one/compare/comInfo?fit_name="+obj.name;
		} else {
			location.href = "/one/compare/infoCheck?fit_name="+obj.name;			
		} 
	}
	
	function fitRecommend() {
  		var estimate = confirm("해당 게임의 사양의 견적을 확인하시겠습니까?");
  		var cpuname = $('#cpuname').html();
  		var memory = $('#memory').html();
  		var gpuname = $('#gpuname').html();
  		if(estimate == true){
  			$.ajax({
  	  			url : '/one/compare/gameSpec',
  	  			type : 'post',
  	  			data : {'cpuname':cpuname,'memory':memory,'gpuname':gpuname},
  	  			dataType : "JSON",
  	  			success : function(result){
  	  				sessionStorage.setItem("vo", JSON.stringify(result));
  	  				location.href = "/one/compare/comRecommend"
  	  			},
  	  			error : function(){
  	  				alert("ERROR");
  	  			}
  	  	
  	  		})
  		
  		} else {
  			location.href = "/one/";			
  		}
  	}
	
	
	
	</script>
	<link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Dancing+Script">
	<style>
	///////////////////////////////////////////////
		.body
		{
			background-color:black;
		}
		a
		{
			text-decoration:none;
		}
		
	
	    h1, h5{
	        text-align: center;
	        font-family: 'NanumGothic';
	    }
	    
	    /*타이틀 높이 설정*/
	    .title{
	    	height:10%;	    	
	    }
	    /*로그인 메뉴바 공간 설정*/
	    .loginMenuBar{
	    	width:80%;
	    	height: 4%;
	    	margin-left: 10%;
	    	margin-top: 5px;	    	
	    }
	    /*로그인 메뉴 테이블 설정*/
	    .loginMenu{
	    	margin-left: auto;
	    	margin-right: auto;
	    	align:center;
	    	border-spacing:10px;
	    }
	    /* box1~3  각 구역 크기 재설정  */
	    .box1{
	        margin-left: 10%;
	        width: 75%;
	        height: 58%;
	        align-content: center
	    }
	
	    .box2{
	        float: right;
	        width: 8%;
	        margin-top: 30px;
	        margin-left: 1%;
	        margin-right: 1%;        
	        
	    }
	    .box3{
	        float: left;
	        width: 8%;
	        margin-top: 30px;
	        margin-left: 1%;
	        margin-right: 1%;
	       
	    }
	    .footer{
	    	margin-top:0.5%;
	        text-align: center;
	        clear: both;
	    }	    
	    
	    
	    #topMenu{
	    	height : 30px;
	    	width : 120px;	    
	    }
	    
	    #topMenu ul{     /*메인메뉴 ul 설정*/
	    	list-style-type: none;
	    	margin: 0px;
	    	padding: 0px;
	    }
	    
	    #topMenu ul li{
	    	float: left;
	    	line-height: 30px;
	    	vertical-align: middle;
	    	text-align: center;
	    	position: relative;
	    }
	    
	    .menuLink, .submenuLink{
	    	text-decoration: none;
	    	display: block;
	    	width: 150px;
	    	font-weight: bold;	    
	    }
	    
	    .topMenuLi:hover .menuLink{
	    	color: red;
	    	background-color: #4d4d4d;
	    }
	    
	    .longLink{
	    	width: 150px;
	    }
	    
	    .submenu{
	    	position: absolute;
	    	height: 0px;
	    	overflow: hidden;
	    	transaction: height .2s;
	    	-webkit-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */
	        -moz-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */
	        -o-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */
	    }
	    
	    .submenuLink{
	    	border: solid 1px black;
	    	margin-top: -1px;
	    }
	    
	    .submenuLink:hover{
	    	color: red;
	    }
	    
	    .topMenuLi:hover .submenu{
	    	height: 125px;
	    }
	    
	    .infoBanner{
	    	position: fixed;
	    	top: 20%;
	    	right: 20%;
	    }
	    #nondiv
	    {
	    	position:absolute;
	    	left:55%;
	    	width:25%;
	    	top:20%;
	    	text-align:center;
	    	background:rgba;
	    	border:10px solid lightblue;
	    	border-radius:25px;
	    }
///////////////////////////////////////////////////////////////////
	.drawsvg,svg {
		width: 100%; height: 300px
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
/////////////////////////////////////////////////////////////////////////////		
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
		         <img style="width:100%;height:100%;" src="resources/icon/ad.jpg" onclick="checkad()">
	        </div>
	    </aside>
	    <aside>
		    <div class="box3">
		    <nav id="topMenu">
			   <c:if test="${sessionScope.fit_member != null }">
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
		    </c:if>
		     </nav>
	        </div>
	    </aside>
	    <nav>
    	<div class="loginMenuBar">
    		<c:if test="${sessionScope.fit_member== null }">
    		<form id="login" action="logIN" method="post">
	    		<table class="loginMenu">
	    			<tr>
	    				<td>로그인 : </td>
	    				<td><input type="text" name="fit_userid" id="fitc_id" placeholder="ID" placeholder="ID"></td>
	    				<td>비밀번호 : </td>
	    				<td><input type="password" name="fit_userpwd" id="fitc_pw" placeholder="PASSWORD"></td>
	    				<td><input type="button" value="로그인" onclick="logIN()" style="width:100%" /></td>
	    				<td><a href="signupForm" style="font-size:10px" >아직 회원이 아니신가요?</a></td>
	    				<td><a href="javascript:;" onclick="window.open('searchInfoForm','pop','resizeable=no scrollbars=yes width=600 height=400');return false" style="font-size:10px" > 아이디 / 비밀번호 찾기 </a></td>
	    			</tr>
	    		</table>
    		</form>
    		</c:if>
    	</div>
    </nav>
		<footer>
	        <div class="footer">
		    	Copyrightⓒ2019 Team 일당백 (SCITMASTER) All right reserved.
	        </div>
	    </footer>
</body>
</html>