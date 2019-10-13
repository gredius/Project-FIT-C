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
		
		var gameary = new Array();
		var gameicon = new Array();
		var addwin ;
		var testva;
		window.onload = function(){
			var ctx = document.getElementById("mainchart").getContext('2d');
			var myChart
			$.ajax
			({
				url:"/one/gamelist",
				type:"get",
				async:false,
				dataType : "JSON",
				success:function(result)
				{
					for(var i=0;i<result.length;i++)
						{
							gameary[i] = result[i];
							$('#gameary[i].gamename').html(result[i]);
							gameicon[i] = new Image();
							gameicon[i].id = result[i].fit_id;
							gameicon[i].src = result[i].imagelink;
							gameicon[i].width = 50;
							gameicon[i].height = 50;
							gameicon[i].style = 'border-radius:100%';
							gameicon[i].glevel=result[i].gamelevel;							
						}
				},
				error:function(){alert("error");}
			})			
			
			var data ={
		        datasets: [{
			        name: [gameary[0], gameary[1], gameary[2], gameary[3], gameary[4], gameary[5],gameary[6], gameary[7], gameary[8], gameary[9]/* , gameary[10], gameary[11] */],
			        pointRadius: 10,
			        pointHoverRadius: 10,
			        pointClickRadius: 15,
			        pointStyle:[gameicon[0], gameicon[1], gameicon[2], gameicon[3], gameicon[4], gameicon[5],gameicon[6], gameicon[7], gameicon[8], gameicon[9]/* , gameicon[10], gameicon[11] */],			
		            data: [{x:gameary[0].gamelevel, y:gameary[0].pclevel}, {x:gameary[1].gamelevel, y:gameary[1].pclevel}, {x:gameary[2].gamelevel, y:gameary[2].pclevel}, 
		            	{x:gameary[3].gamelevel, y:gameary[3].pclevel}, {x:gameary[4].gamelevel, y:gameary[4].pclevel},{x:gameary[5].gamelevel, y:gameary[5].pclevel}, {x:gameary[6].gamelevel, y:gameary[6].pclevel}, {x:gameary[7].gamelevel, y:gameary[7].pclevel}, 
		            	{x:gameary[8].gamelevel, y:gameary[8].pclevel}, {x:gameary[9].gamelevel, y:gameary[9].pclevel}] //컨트롤러에서 모델로 받아온다.
		            
		        }]
		    }
				
			//chart 옵션 파트
			var option = {
				events: ['click'],
				tooltips: {
					enabled:false,
					mode: 'index',
					position: 'nearest',
					custom:  function (tooltip){
						document.getElementById('nondiv').style.display="";
		    	        if (tooltip.dataPoints.length) {
		    	        	var i = tooltip.dataPoints[0].index;
		    	        	var isrc = gameicon[1].src;
		    	        	document.getElementById('fitbtn').name=data.datasets[0].name[i].fit_name;
		    	        	document.getElementById('gameimg').src = data.datasets[0].pointStyle[i].src;
		    	            document.getElementById('spectype').innerText="권장사양";
		    	            document.getElementById('windowtype').innerText="64bit";
		    	            document.getElementById('cpuname').innerText=data.datasets[0].name[i].gamecpu;
		    	            document.getElementById('memory').innerText=data.datasets[0].name[i].gameram;
		    	            document.getElementById('gpuname').innerText=data.datasets[0].name[i].gamegpu;
		    	            document.getElementById('addop').innerText=data.datasets[0].name[i].gameaddop;
		    	        }

		    	        var positionY = this._chart.canvas.offsetTop;
		    	        var positionX = this._chart.canvas.offsetLeft;	

		    	     	// Display, position, and set styles for font
		    		}
				},
				animation:{
					animationScale:true
				},
				responsive: false,
				scales:{
					xAxes: [{
					    gridLines: {
						display:false,    //x축 그래프 내부 눈금선 지우기
						color:"black",      //x축의 선 색상
						lineWidth:3       //x축의 선 굵기
					    },
					    ticks: {    //x축 최소값 최대값 기준치 설정
						min: 0,
						max: 20,
						stepSize:1,	//x축 눈금 간격 1로 설정
			            		fontSize:15,	//x축 눈금자 숫자 크기 설정
			            		fontColor:"black"	//x축 눈금자 숫자 색상 설정
					    },
					    scaleLabel: {	//x축 데이터 라벨 추가
						display: true,
						labelString: "GAME LEVEL",
						fontColor: "black",
						fontSize: "15",
						fontFamily:"'Lobster', cursive",	//x축 라벨 폰트 설정
					    }   
					}],
					yAxes: [{
					    gridLines: { 
						display:false,	//y축 그래프 내부 눈금선 지우기
						color:"black",	//y축의 선 색상
						lineWidth:3	//y축의 선 굵기
					    },
					    ticks: {
						min: 0,
						max: 10,
						fontSize:15,	//y축 눈금자 숫자 크기 설정
						fontColor:"black"	//y축 눈금자 숫자 색상 설정
					    },
					    scaleLabel: {	//y축 데이터 라벨 추가
						display: true,
						labelString: "PC LEVEL",
						fontColor: "black",
						fontSize: "15",
						fontFamily:"'Lobster', cursive",	//y축 라벨 폰트 설정
					    }   
					}]
				},    
				legend:{
					display: false
				}
			}

			//차트 구성 파트
			myChart = new Chart(ctx, {
				    type: 'scatter',
				    data: data,
				    options: option	
				});
			
			////DB구성
			dbchk();
			
			///auto
			
		}
///////////////////////////////////////////////////////////////////////////
		
		
		function closediv()
		{
			document.getElementById('nondiv').style.display="none";
		}
		
		function pagemove(obj)
		{
			var gamename = obj.name;
			location.href="/one/makelist?gamename="+gamename;
		}
		
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
		
		function makedb()
		{
			alert("makedb접속");
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
		var estimate = confirm("본인의 컴퓨터 부품에 대해 알고 계신가요?\n"+"(취소를 누르시면 사양을 알 수 있습니다.)");
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
	    
	    canvas{
	    	-moz-user-select: none;
	    	-webkit-user-select: none;
	    	-ms-user-select: none; 
	    	width: 100%;
	    	height:50%;
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
	    #nondiv
	    {
	    	position:absolute;
	    	left:55%;
	    	width:25%;
	    	top:20%;
	    	text-align:center;
	    	border:5px solid black;
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
		html, body {
	height: 100%;
}
		
		body {
		margin: 0;
		background: linear-gradient(45deg, #49a09d, #D0A3FF);
		font-family: sans-serif;
		font-weight: 100;
}
		
.log {
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
.log:hover {
	background-color: white;
	color: black;
}

.confirm:hover {
	-webkit-transition-duration: 0.4s;
	color: white;
}
.logincheck,.check {
	border-radius: 8px;
	background-color: black;
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
.check:hover {
	background-color: white;
	color: black;
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
	    				<td class = "logincheck">로그인 : </td>
	    				<td><input type="text" name="fit_userid" id="fitc_id" placeholder="ID" placeholder="ID"></td>
	    				<td class = "logincheck">비밀번호 : </td>
	    				<td><input type="password" name="fit_userpwd" id="fitc_pw" placeholder="PASSWORD"></td>
	    				<td><input type="button" value="로그인" onclick="logIN()" style="width:100%" class = "log"/></td>
	    				<td><a href="signupForm" style="font-size:10px" class = "confirm">아직 회원이 아니신가요?</a></td>
	    				<td><a href="javascript:;" onclick="window.open('searchInfoForm','pop','resizeable=no scrollbars=yes width=600 height=400');return false" style="font-size:10px" class = "confirm"> 아이디 / 비밀번호 찾기 </a></td>
	    			</tr>
	    		</table>
    		</form>
    		</c:if>
    	</div>
    </nav>
		<section>
	        <div class="box1" id="chart_div" >
		     <canvas id="mainchart" ></canvas>
		     <div id="nondiv" style="display:none;">
		     	<table style="width:100%;">
				<tr>
					<th colspan="2">
						<input type="hidden" id="gamename">
						<img style="width:80%;border-radius: 30%;" id="gameimg" />
					</th>
				</tr>
				<tr>
					<th id="spectype" colspan="2">
					
					</th>
				</tr>
				<tr>
					<th>
						운영체제
					</th>
					<td id="windowtype">
					
					</td>
				</tr>
				<tr>
					<th>
						CPU
					</th>
					<td id="cpuname">
					
					</td>
				</tr>
				<tr>
					<th>
						MEMORY
					</th>
					<td id="memory">
					
					</td>
				</tr>
				<tr>
					<th>
						GPU
					</th>
					<td id="gpuname">
					
					</td>
				</tr>
				<tr>
					<th>
						Additional Option
					</th>
					<td id="addop">
					
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input id="rebtn" type="button" value="추천견적" onclick="fitRecommend();"class="check">
						<input id="fitbtn" type="button" value="맞춤견적" onclick="fitEstimate(this);" class="check">
						<input type="button" value="창 닫기" onclick="closediv();" class="check">
					</td>
				</tr>
			</table>
		     
	    		</div>
	        </div>	
	    <div id="detail">
	    </div>
	    </section>
		<footer>
	        <div class="footer">
		    	Copyrightⓒ2019 Team 일당백 (SCITMASTER) All right reserved.
	        </div>
	    </footer>
</body>
</html>