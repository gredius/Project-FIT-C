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
		window.onload = function()
		{
			
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
	
	</script>
	<style>
		a
		{
			text-decoration:none;
		}
		/*div{
	        border: 1px solid #ccc;
	    }*/
	
	    h1, h5{
	        text-align: center;
	        font-family: 'NanumGothic';
	    }
	    
	    .box1{
	        margin-top: 30px;
	        margin-left: 20%;
	        width: 60%;
	        height: 60%;
	        margin-bottom: 5%; 
	        align-content: center
	    }
	
	    .box2{
	        float: right;
	        width: 10%;
	        margin-top: 30px;
	        margin-left: 5%;
	        margin-right: 5%;        
	        height: 70%;
	    }
	    .box3{
	        float: left;
	        width: 10%;
	        margin-top: 30px;
	        margin-left: 5%;
	        margin-right: 5%;
	        height: 50px;
	        align-text:center;
	    }
	    .footer{
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
	    	background:rgba;
	    	border:10px solid lightblue;
	    	border-radius:25px;
	    }
	    html, body {
	height: 100%;
}

body {
	margin: 0;
	background: linear-gradient(45deg, #49a09d, #5f2c82);
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

.button:hover {
	background-color: rgba(255, 255, 255, 0.2);
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
                <a href="/one/" >Fit-c</a>
            </h1>
			<h5>
				Fit your game
			</h5>            
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
	        			<li><a href="#" class="submenuLink longLink">자유게시판</a></li>
	        			<li><a href="#" class="submenuLink longLink">About</a></li>
	        		</ul>
	        	</li>
	        </ul>
	    </c:if>
	    <c:if test="${sessionScope.fit_member== null }">
	    	<form id="login" action="logIN" method="post">
				<table style="border:1px solid #ccc; width:140%">
					<tr>
						<td width="250px"><input type="text" name="fit_userid" id="fitc_id" placeholder="ID" style="width:90%" /></td>
					</tr>
					<tr>
						<td width="250px"><input type="password" name="fit_userpwd" id="fitc_pw" placeholder="PASSWORD" style="width:90%" /></td>
					</tr>
					<tr>
						<td width="250px"><input type="button" value="로그인" onclick="logIN()" style="width:100%" /></td>
					</tr>
				</table>		
			</form>
			<a href="signupForm" style="font-size:10px" >아직 회원이 아니신가요?</a><br>
			<a href="#" onclick="window.open('searchInfoForm','pop','resizeable=no scrollbars=yes width=600 height=400');return false" style="font-size:10px" > 아이디 / 비밀번호 찾기 </a>
	    </c:if>
	     </nav>
        </div>
    </aside>
	<footer>
        <div class="footer">
	    	Copyrightⓒ2019 Team 일당백 (SCITMASTER) All right reserved.
        </div>
    </footer>
    
 
	
</body>
</html>