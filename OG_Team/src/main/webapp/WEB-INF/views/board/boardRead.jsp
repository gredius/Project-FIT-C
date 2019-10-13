<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>차트 연동하기</title>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">	
	 --><script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Dancing+Script">
	<script>

		window.onload = function()
		{
			$('#rpybtn').on('click',commentWrite);

		}

		function commentWrite()
		{
			$.ajax({
				url:"/one/board/commentWrite",
				type:"post",				
				data:$('#commentForm').serialize(),
				success:function(result){
						$('.removetr').remove();
						document.getElementById('comments').value="";
						$(result).each(function(index,item)
						{
							$('#rpytab').append('<tr class="removetr" id="comlist"><td>'+item.fit_comments
									+'</td><td>'+item.fit_userid+'</td><td>'+item.fit_commentdate
									+'</td><td><input type="button" value="삭제" id="'+item.fit_commentnum
									+'" onclick="commentDelete(this)"></td>'+
									'<td><input type="button" value="수정" id="'+item.fit_commentnum
									+'" onclick="commentModify(this)"</td></tr>');
						}
						)	
					},
				error:function()
				{
					alert("안된당");
				}
			})
		}

		
		function boardDelete(){
			if(confirm("삭제하시겠습니까?")){
				location.href="/one/board/boardDelete?fit_boardnum=${fit_boardnum}"
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
		}
		function pageProc(currentPage, searchItem, searchKeyword) {
			location.href="/one/board/boardRead?currentPage=" + currentPage + "&searchItem=" + searchItem + "&searchKeyword=" + searchKeyword;
		}
	/////////////////////////////////add
	function commentModify(fit_commentnum, fit_comments){
			var fit_comments = document.getElementById("fit_comments");
			var rpybtn = document.getElementById("rpybtn");
						
			rpybtn.value = "댓글 수정";

			rpybtn.onclick = function(){
				var updatecomments = fit_comments.value;
				location.href="/one/board/commentUpdate?fit_commentnum=" + fit_commentnum + "&fit_boardnum="+${vo.fit_boardnum};
				//+"&comments="+updatecomments;

				//http://localhost:8888/one/board/commentUpdate?fit_commentnum=96&fit_boardnum=15
				//http://localhost:8888/one/board/boardRead?fit_boardnum=15
			}
		}

		function commentDelete(fit_commentnum){
			if(confirm("댓글을 삭제하시곘습니까?")){
				location.href="/one/board/commentDelete?fit_commentnum=" + fit_commentnum + "&fit_boardnum=" +${vo.fit_boardnum}
			}
		}
	
	
	</script>
	
	<style>
		a{
			text-decoration:none;
		}
		
		a:hover{
			text-decoration:none;
		}
	    
	    .th_num{
	    	width:10%;
	    }
	    
	    .th_title{
	    	width:50%;
	    }
	    
	    .th_fitc_id{
	    
	    }
	    
	    .th_hit{
	    	width:10%;
	    }
	    
	    .th_date{
	    	width:15%;
	    }
	    
	    .read_title{
	    	font-weight:bold;
	    }
	    
	    th{
	    	text-align:center;
	    }
	
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
	    	width: 148px;
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
	background-color: rgba(255, 255, 255, 0.2);
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
	    <c:if test="${sessionScope.fit_member != null }">
		    <ul>
	        	<li class="topMenuLi" value="banner">
	        		<a class="menuLink">${sessionScope.fit_member.fit_usernick}님 Welcome</a>
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
	    	<form id="/one/login" action="logIN" method="post">
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
	<section>
	<h2 style="text-align:center" class="head"> [견적게시판] </h2>
	<hr/>
        <div class="box1" id="board_div" >
	    	<table class="table" style="margin-left: auto; margin-right: auto;">
		    	<tr>
					<th><div><span class="read_title">${vo.fit_boardtitle}</span></div><br>
						<span>작성자 : ${vo.fit_userid}</span> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span style="text-align:right">${vo.fit_boarddate}</span> 					
					</th>
				</tr>
				
				<tr>
					<td class="read_hit">조회수 : ${vo.fit_boardhit} | 댓글수 : ${commentList.size()}</td>
				</tr>
				<tr>
					<td>
					<c:if test="${pcvo != null}">
						<table class="pcset_table" id="pcset_table" style="border:solid 1px;">
		                	<tr style="border:solid 1px;">
		                    	<th>CPU</th>
		                        <td style="border:solid 1px;">${pcvo.fit_cpuname}</td>
		                    </tr>
		                    <tr style="border:solid 1px;">
		                        <th>MAINBOARD</th>
		                        <td style="border:solid 1px;">${pcvo.fit_mainboardname}</td>
		                    </tr>
		                    <tr style="border:solid 1px;">	
		                       	<th>GPU</th>
		                        <td style="border:solid 1px;">${pcvo.fit_gpuname}</td>
		                    </tr>
		                    <tr style="border:solid 1px;">
		                        <th>RAM</th>
		                        <td style="border:solid 1px;">${pcvo.fit_ramname}</td>
		                    </tr>
		                    <tr style="border:solid 1px;">
		                        <th>POWER</th>
		                        <td style="border:solid 1px;">${pcvo.fit_powername}</td>
		                    </tr>
		                    <tr style="border:solid 1px;">
		                        <th>CASE</th>
		                        <td style="border:solid 1px;">${pcvo.fit_casename}</td>
		                    </tr>
		                </table>
					</c:if>
					</td>
				</tr>
				<tr>
					<td><textarea readonly="readonly" style="width:100%" rows="10" cols="10">${vo.fit_boardcontent}</textarea></td>
				</tr>
				<tr>
					<td class="right" colspan="2" align="right">
						<c:if test="${sessionScope.fit_member.fit_userid == vo.fit_userid}">
							<a href="/one/board/boardUpdateForm?b_num=${vo.fit_boardnum}"><input type="button" value="수정" class="btn"></a>
							<input type="button" value="삭제" onclick="boardDelete()" class="btn">
						</c:if>
						<a href="/one/board/boardList"><input type="button" value="목록" class="btn"></a>
					</td>
				</tr>
			</table>
			
			
	    	<!-- 댓글 입력 -->
			<form action="/one/board/commentWrite" id="commentForm" method="post">
				<input type="hidden" name="fit_boardnum" value="${vo.fit_boardnum}" />
				<input type="hidden" name="fit_userid" value="${sessionScope.fit_member.fit_userid}" />
				<table class="table" id="commentinput" style="margin-left: auto; margin-right: auto;">
					<tr>
						<td>
							<textarea rows="3" cols="10" style="width:100%" id="comments" name="fit_comments"></textarea><br/>
							<input id="rpybtn" type="button" value="댓글작성" class="btn">
						</td>
					</tr>
				</table>
			</form>
			
			<!-- 댓글 출력 -->
<div id="commentdisplay">
			<table id="rpytab" class="table" style="margin-left: auto; margin-right: auto;">
				<thead>
				<tr>
					<th style="width:15%; font-weight:bold;">작성자</th>
					<th style="width:40%; font-weight:bold;">내용</th>
					<th style="width:20%; font-weight:bold;">작성일</th>
				</tr>
				</thead>
				<c:forEach items="${commentList}" var="comment">
					<tr class="removetr">
						<td class="commentid">
							<span>${comment.fit_userid} </span>
						</td>
						<td class="comments">
							<span>${comment.fit_comments}</span>
						</td>						
						<td class="commentdate">
							<span>${comment.fit_commentdate}</span>
						</td>
						<c:if test="${sessionScope.fit_member.fit_userid == comment.fit_userid}">
						<td class="commentbtn">
							<input type="button" value="삭제" onclick="commentDelete('${comment.fit_commentnum}')" class="btn"/>
							<input type="button" value="수정" onclick="commentModify('${comment.fit_commentnum}', '${comment.fit_comments}')" class="btn"/>
						</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
			</div>
	    	<hr/>
	    	<!-- 게시글 목록 -->
	    	<table style="margin-left: auto; margin-right: auto;" class="table table-bordered table-striped table-hover">
	    		<thead>
				<tr>
					<th class="th_num">번호</th>
					<th class="th_title">제목</th>
					<th class="th_fitc_id">작성자</th>
					<th class="th_hit">조회</th>
					<th class="th_date">날짜</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="boardVO">
					<tr>
						<td class="center" style="text-align:center">${boardVO.fit_boardnum}</td>
						<td id="title" style="padding-left:2%"><a href="/one/board/boardRead?fit_boardnum=${boardVO.fit_boardnum}">${boardVO.fit_boardtitle}</a></td>
						<td class="center" style="text-align:center">${boardVO.fit_userid}</td>
						<td class="center" style="text-align:center">${boardVO.fit_boardhit}</td>
						<td id="inputdate" style="text-align:center">
							<fmt:parseDate value="${boardVO.fit_boarddate}" var="parseRegdate" pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${parseRegdate}" pattern="MM.dd HH:mm"/>	
						</td>
					</tr>
				</c:forEach>
				</tbody>
				<tr style="text-align:center">
					<td id="navigator" colspan="5">
						<a href="javascript:pageProc(${navi.currentPage - navi.pagePerGroup}, '${searchCondition}', '${searchKeyword}')">◁◁ </a> &nbsp;&nbsp;
						<a href="javascript:pageProc(${navi.currentPage - 1}, '${searchCondition}', '${searchKeyword}')">◀</a> &nbsp;&nbsp;
					
						<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
							<c:if test="${counter == navi.currentPage}"><b></c:if>
								<a href="javascript:pageProc(${counter}, '${searchCondition}', '${searchKeyword}')">${counter}</a>&nbsp;
							<c:if test="${counter == navi.currentPage}"></b></c:if>
						</c:forEach>
						&nbsp;&nbsp;
						<a href="javascript:pageProc(${navi.currentPage + 1}, '${searchCondition}', '${searchKeyword}')">▶</a> &nbsp;&nbsp;
						<a href="javascript:pageProc(${navi.currentPage + navi.pagePerGroup}, '${searchCondition}', '${searchKeyword}')">▷▷</a>
					</td>
				</tr>						
				<tr>
					<td id="boardSearch" colspan="5" style="text-align:center">
					<form action="/one/board/boardList" method="get">
						<select name="searchItem">
							<option value="title" selected="selected">제목</option>
							<option value="fitc_id">작성자</option>
						</select>
						<input type="text" name="searchKeyword">
						<input type="submit" value="검색" class="btn">
						<button type="button" class="btn" >버튼</button>
					</form>
					</td>
				</tr>				
			</table>
			<hr/>
			<a class="btn btn-default pull-right" href="/one/board/boardWriteForm">글쓰기</a>
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