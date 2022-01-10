<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		.homeInfo{text-align: center; margin-top: 30px;}
		@font-face {
    		font-family: 'Pretendard-Regular';
    		src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    		font-weight: 400;
    		font-style: normal;
		}
		body{font-family: 'Pretendard-Regular';}
	</style>
</head>
<body>
	<script type="text/javascript">
		alert("${result}")
	</script>
	<div class="outer">
		<div class="frame">
			<ul>
				<li><a href="mountain_main"><img class="slide" src="https://ifh.cc/g/FJGdhL.jpg"></a></li>
	            <li><a href="forum_list"><img class="slide" src="https://ifh.cc/g/vHYHsf.jpg"></a></li>
	            <li><a href="qnaBoard_list"><img class="slide" src="https://ifh.cc/g/zxCITP.jpg"></a></li>
	         </ul>
		</div>
			<img src="https://ifh.cc/g/Ah7PQy.png.png">
	        <img src="https://ifh.cc/g/kSoc3q.png">
	</div>
	<div class="homeInfo">홈페이지 소개(서울에 있는 산 정보)<br> 홈페이지를 만들게 된 이유(안전하고 즐거운 등산을 위해)</div>
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
</html>