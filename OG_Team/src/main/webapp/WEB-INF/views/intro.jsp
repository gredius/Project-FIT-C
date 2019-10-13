<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Dancing+Script">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script>
	window.onload=function()
	{
		window.setTimeout(function(){
			movepage();
		},10000);
			
	}
	function movepage()
	{
		location.href="/one/";
	}
</script>    
<style>
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
	</style>
</head>
<body>
	<div class="loadingview">
		<div class="drawsvg"> 
			<svg version="1.1" viewBox="0 0 500 100"> 
				<symbol class="fade-text" id="fade-text"> 
					<text x="50%" y="50%" text-anchor="middle">F i t - c</text> 
					<text style="font-size:0.5em;" x="50%" y="90%" text-anchor="middle">F i t  y o u r  g a m e</text> 
				</symbol> 
				<g> 
					<use class="stroke" xlink:href="#fade-text"/> 
					<use class="fill" xlink:href="#fade-text"/> 
				</g> 
			</svg> 
		<input type="button" value="Skip" onclick="movepage()">
		</div>
	</div>
</body>
</html>