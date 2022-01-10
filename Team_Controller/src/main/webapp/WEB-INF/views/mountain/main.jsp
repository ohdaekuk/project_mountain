<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>main.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style>
		*{margin: 0px; padding: 0px; text-decoration: none; list-style: none;}
			
		 .slide{width: 1918px; height: 500px;}
			        
	    .frame{
	        width: calc(1918px); height: 500px;
	
	        overflow: hidden;
	
	        position: relative;
	        }
	        
	    .outer{width: 1918px; height: 500px; margin: 0px auto; border: 1px solid lightgray; margin-top: 164px;}
	    .frame>ul{
	         width: calc(1920px*3); 
	        }
	
	    .frame li{float: left;}
	
	    .frame>ul::after{content: ""; clear: both; display: block;}
	
	    .outer>img
	            {position: absolute; top: 47%; width: 50px; height: 50px; text-align: center;}
		.outer>img:first-of-type{left:20px;}
		.outer>img:last-of-type{right: 20px;}
		.homeInfo{text-align: center; margin-top: 40px; font-family: 'Pretendard-Regular';}
		
		@font-face {
    		font-family: 'Pretendard-Regular';
    		src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    		font-weight: 400;
    		font-style: normal;
		}
		@font-face {
    		font-family: 'MaruBuri-Regular';
    		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/MaruBuri-Regular.woff') format('woff');
    		font-weight: normal;
    		font-style: normal;
		}
		@font-face {
    		font-family: 'GowunBatang-Regular';
    		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff') format('woff');
    		font-weight: normal;
    		font-style: normal;
		}
		
		.choice{position: relative; text-align: center; }
		.mountainp{position: absolute; z-index: 3; color: white; top: 43%; left: 40%; font-size: xxx-large; letter-spacing: 5px; text-decoration: underline; font-family: 'MaruBuri-Regular';}
		.mountainpa{position: absolute; z-index: 3; color: white; top: 54%; left: 41.7%; font-size:medium; font-family: 'GowunBatang-Regular';}
		.choice:hover{opacity:0.7;}
		.choice:hover .mountainp{visibility: visible;}
		.mountainp1{position: absolute; z-index: 3; color: white; top: 43%; left: 42%; font-size: xxx-large; letter-spacing: 5px; text-decoration: underline; font-family: 'MaruBuri-Regular';}
		.mountainpa1{position: absolute; z-index: 3; color: white; top: 56%; left: 42.7%; font-size:medium; font-family: 'GowunBatang-Regular';}
		.mountainp2{position: absolute; z-index: 3; color: white; top: 47%; left: 47%; font-size: xxx-large; letter-spacing: 5px; text-decoration: underline; font-family: 'MaruBuri-Regular';}
	</style>
</head>
<body>
	<div class="outer">
		<div class="frame">
			<ul>
				<li>
					<div class="choice">
						<a href="mountain_main"><img class="slide" src="https://ifh.cc/g/QE3VR7.jpg"></a>
						<div class="mountainp"><p>Mountain Page</p></div>
						<div class="mountainpa"><p>산의 정보와 교통, 맛집 등을 제공하는 페이지</p></div>
					</div>
				</li>
	            <li>
					<div class="choice">
						<a href="forum_list"><img class="slide" src="https://ifh.cc/g/n7MjTR.jpg"></a>
						<div class="mountainp1"><p>Community</p></div>
						<div class="mountainpa1"><p>다른 유저들과 소통할 수 있는 게시판</p></div>
					</div>            
	            </li>
	            <li>
	            	<div class="choice">
						<a href="qnaBoard_list"><img class="slide" src="https://ifh.cc/g/gm3yvH.jpg"></a>
						<div class="mountainp2"><p>QnA</p></div>
					</div>    
	            </li>
	         </ul>
		</div>
			<img src="https://ifh.cc/g/FuD8ts.png">
	        <img src="https://ifh.cc/g/wsXqVh.png">
	</div>
	<br>
	<div class="homeInfo">
		<h1>안전하고 즐거운 산행</h1><br>
		<P>초행자들을 위한 산 정보부터 산에 관한 여러가지 이야기들을 나눌 수 있는 등산 정보 사이트입니다.</P>
	</div>
<jsp:include page="head.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
</body>
	<script type="text/javascript">
	$(function(){
        $(".outer>img").last().click(function(){
            $(".frame>ul").animate(
                {"margin-left" : "-1918px"},
                1000,
                function(){
                    $(".frame>ul").css("margin-left", "0px");
                    $(".frame>ul").append($(this).children().eq(0))
                }
            );
        })
        $(".outer>img").first().click(function(){
            $(".frame>ul").prepend($(".frame>ul").children().last())
                $(".frame>ul").css("margin-left","-1918px");

                $(".frame>ul").animate(
                    {"margin-left" : "0px"},
                    1000
                );
        });
    });
	</script>
<c:if test="${!empty result}">
<script type="text/javascript">
	alert("${result}")
</script>
</c:if>
</html>