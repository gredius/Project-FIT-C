<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>차트 연동하기</title>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>	
	<link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Dancing+Script">
	<script>
	
	window.onload=function()
	{
		$('#pcset').on('change',setpc);
		
	}
	
	function setpc()
	{
		var pcset = $('#pcset').val();
		if(pcset!=-1)
		{
			$.ajax({
				url:"/one/board/getpc",
				type:"get",
				data:{"fit_pcnum":pcset},
				dataType:"json",
				contentType:"application/json; charset=utf-8",
				success:function(result)
				{
					$('.pcsettr').remove();
					pcset_table.style.display='block';
					$('#pcset_table').append('<tr class="pcsettr"><th>CPU</th><td>'+result.fit_cpuname
							+'</td></tr><tr class="pcsettr"><th>MAINBOARD</th><td>'+result.fit_mainboardname
							+'</td></tr><tr class="pcsettr"><th>RAM</th><td>'+result.fit_ramname
							+'</td></tr><tr class="pcsettr"><th>GPU</th><td>'+result.fit_gpuname
							+'</td></tr><tr class="pcsettr"><th>CASE</th><td>'+result.fit_casename
							+'</td></tr><tr class="pcsettr"><th>POWER</th><td>'+result.fit_powername+'</td></tr>')
				},
				error:function()
				{
					alert("error");
				}
			})
		} else 
		{
			$('.pcsettr').remove();
		}
	}
	
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
		
	function pageProc(currentPage, searchItem, searchKeyword) {
		location.href="/one/board/boardList?currentPage=" + currentPage + "&searchItem=" + searchItem + "&searchKeyword=" + searchKeyword;
	}
	////////////////////////////add
		function boardUpdate(){
			if(confirm){
				var form = document.getElementById("boardUpdateForm");
				form.submit();
			}
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
	        height: 50px;
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
	    	color: white;
	    	background-color: #4d4d4d;
	    	-webkit-transition-duration: 0.4s;
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
	    	height: 156px;
	    }
	    
	    .infoBanner{
	    	position: fixed;
	    	top: 20%;
	    	right: 20%;
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
	
	.btn {
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
	
	.btn:hover {
		background-color: white;
		color: black;
	}
	.head:hover {
		-webkit-transition-duration: 0.4s;
		color: white;
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
	            사이드1<br>
	            광고가 들어갈 자리
        </div>
    </aside>
    <aside>
	    <div class="box3">
	    <nav id="topMenu">
	    <c:if test="${sessionScope.fit_member.fit_userid != null }">
		    <ul>
	        	<li class="topMenuLi" value="banner">
	        		<a class="menuLink">${sessionScope.fit_usernick}님 Welcome</a>
	        		<ul class="submenu">
	        			<li><a href="#" class="submenuLink longLink">메뉴1</a></li>
	        			<li><a href="#" class="submenuLink longLink">메뉴2</a></li>
	        			<li><a href="/three/board/boardList" class="submenuLink longLink">견적게시판</a></li>
	        			<li><a href="/three/logOUT" class="submenuLink longLink">LOGOUT</a></li>
	        			<li><a href="/three/updateInfoForm" class="submenuLink longLink">회원정보 수정</a></li>
	        		</ul>
	        	</li>
	        </ul>
	    </c:if>
	    <c:if test="${sessionScope.fit_member == null }">
	    	<form id="login" action="logIN" method="post">
				<table style="width:140%">
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
	<section>
		<h2 style="text-align: center" class="head">[글 작성]</h2>
		<div class="box1">
			<form action="/one/board/boardUpdate" id="boardUpdateForm" name="boardUpdateForm" method="post">
				<div>
					<div>
						<table class="table" 
							style="margin-left: auto; margin-right: auto;">
							<tr>
								<th class="write_title" style="width: 10%">제목</th>
								<td><input style="width: 100%" type="text" id="title"
									name="fit_boardtitle" /></td>
							</tr>
							<tr>
								<th class="write_pcset">견적</th>
								<td>
									<table class="pcset_table" id="pcset_table" name="pcset_table"
										style="display: none;">
									</table> 
									<select style="width: 100%" class="pcset" name="fit_pcsets"
									id="pcset" >
										<option value="-1" selected>견적을 선택하세요</option>
										<c:if test="${pcsetList.size()>0}">
											<c:forEach var="i" begin="0" end="${pcsetList.size()-1}">
												<option value="${pcsetList.get(i).fit_pcnum}">${i+1}번째 견적</option>
											</c:forEach>
										</c:if>
								</select>
								</td>
							</tr>
							<tr>
								<th class="write_content">내용</th>
								<td><textarea style="width: 100%" rows="10" cols="10"
										id="b_content" name="fit_boardcontent"></textarea></td>
							</tr>

						</table>
						<input type="hidden" name="fit_userid" value="${sessionScope.fit_member.fit_userid}">
						<input type="hidden" name="fit_boardnum" value="${board.fit_boardnum}">
						<div style="text-align: center">
							<input type="button" value="등록" onclick="boardUpdate()" class="btn"/> 
							<a href='/one/board/boardRead?fit_boardnum=${board.fit_boardnum}' class="btn">취소</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
	<footer>
        <div class="footer">
	            푸터<br>
	            출처가 들어갈 자리
        </div>
    </footer>    
</body>
</html>