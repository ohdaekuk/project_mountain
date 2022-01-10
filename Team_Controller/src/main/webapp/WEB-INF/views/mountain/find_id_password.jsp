<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find_id_password·jsp</title>
<style>
		@font-face {
    		font-family: 'Pretendard-Regular';
    		src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    		font-weight: 400;
    		font-style: normal;
		}
		body{font-family: 'Pretendard-Regular';}
		.find_IdPassword{text-align: center; font-size: large; margin-top: 130px;}
       	.find_id > hr {
            width: 400px;
        }

        .find_password > hr{
            width: 400px;
        }

        .find_box {
            width: 1000px;
            margin: 0 auto;
            text-align: center;
            margin-top: 50px;
            margin-bottom: 162px;
        }

        .find_id {
            width: 500px;
            margin: 0 auto;
            border-radius: 5px;
            margin-bottom: 50px;
        }

        .find_password {
            width: 500px;
            margin: 0 auto;
            border-radius: 5px;
        }

        .find_span {
            display: inline-block;
            width: 50px;
            margin-right: 50px;
        }

        .find_name_input_01 {
            width: 220px;
            height: 20px;
            margin-top: 10px;
        }

        .find_email_input_01 {
            width: 220px;
            height: 20px;
        }

        .find_name_input_02 {
            width: 220px;
            height: 20px;
        }

        .find_userId_input_02 {
            width: 220px;
            height: 20px;
        }

        .find_email_input_02 {
            width: 220px;
            height: 20px;
        }

        .find_submit_01{
            background: white;
            border-radius: 5px;
            width: 500px;
            height: 35px;
            font-size: 15px; 
        }

        .find_submit_02 {
            background: white;
            margin-top: 40px;
            border-radius: 5px;
            width: 500px;
            height: 35px;
            font-size: 15px;
        }

        .find_form_01 {
            margin-bottom: 50px;
        }
        
        .find_form_02 {
        	margin-top: 30px;
        }
        
    </style>
</head>
<body>
<jsp:include page="head_ver2.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
	<div class="find_IdPassword"><h1>아이디/비밀번호 찾기</h1></div>
    <div class="find_box">
        <form class="find_form_01" action="findId" method="get">
            <fieldset class="find_id">
                <legend>아이디 찾기</legend>
                <span class="find_span">이름</span><input class="find_name_input_01" type="text" name="name"><br>
                <hr>
                <span class="find_span">이메일</span><input class="find_email_input_01" type="text" name="email"><br>
                
            </fieldset>
            	<input class="find_submit_01" type="submit" name="find_userId" value="아이디찾기">

        </form>
        <hr>
        <form class="find_form_02" action="findPassword" method="get">
            <fieldset class="find_password">
                <legend>비밀번호 찾기</legend>
                <span class="find_span">이름</span><input class="find_name_input_02" type="text" name="name"><br>
                <hr>
                <span class="find_span">아이디</span><input class="find_userId_input_02" type="text" name="userId"><br>
                <hr>
                <span class="find_span">이메일</span><input class="find_email_input_02" type="text" name="email"><br>
                <hr>
            </fieldset>
            <input class="find_submit_02" type="submit" name="find_password" value="비밀번호찾기">
        </form>
    </div>
</body>
</html>