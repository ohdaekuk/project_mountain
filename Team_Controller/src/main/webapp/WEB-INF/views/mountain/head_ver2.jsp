<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>head_ver2.jsp</title>
	 <style>
	 	@font-face {
    		font-family: 'Pretendard-Regular';
    		src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    		font-weight: 400;
    		font-style: normal;
		}
		
	 	.head{position: absolute; top: 0; left: 0; right: 0; background: white; z-index: 2}
	 	
        .mountainicon{
        	margin-top: 10px;
            margin-left: 15px;
            height: 45px;
            float: left;
            position: absolute;
        }

        .login{
        	height: 10px;
            margin-left: 1660px;
            font-size: small;
            margin-top: 25px;
            display: inline-block;
            font-family: 'Pretendard-Regular';
        }
        .login a{
            text-decoration: none; color: black;
        }
        .dropbtn{
            height: 40px;
            margin-left: 1850px; 
            margin-top: -25px;
            display: inline-block;
        }
        .dropdown-content {
            margin-left: 88%;
            display: none;
            position: absolute;
            background-color: grey;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            float: right;
           	font-family: 'Pretendard-Regular';
        }
        
        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }
        
        .dropdown-content a:hover {background-color: dimgrey}
        
        .show {display:block;}

         .mountainlogo{
            width: 200px; height: 50px; display: block; 
            position: absolute; top: 15px; left: 860px; 
         }
       </style>
</head>
<body>
	 <div class="head">
        <a href="main"><img src="https://ifh.cc/g/DT3VRF.png" class="mountainicon"></a>
        
        <%if(session.getAttribute("userId") == null){%>
        	<span class="login"><span><a href="login">?????????</a> &nbsp;  | &nbsp; <a href="join">????????????</a></span></span>
        <% } else{%>
        	<span class="login"><span><%=session.getAttribute("userName") %>??? &nbsp;  | &nbsp; <a href="logout">????????????</a></span></span>
        <%} %>
        
        <img src="https://ifh.cc/g/IBDqjk.png"  class="dropbtn" onclick="myFunction()">
        <div class="dropdown-content" id="myDropdown">
            <a href="mountain_main">???</a>
            <a href="forum_list">???????????????</a>
            <a href="qnaBoard_list">????????????</a>
        </div>
        <a href="main"><img src="https://ifh.cc/g/bTvwkU.png" class="mountainlogo" ></a>
    </div>
    <script>
        function myFunction() {
            document.getElementById("myDropdown").classList.toggle("show");
        }
        
        window.onclick = function(e) {
          if (!e.target.matches('.dropbtn')) {
        
            var dropdowns = document.getElementsByClassName("dropdown-content");
            for (var d = 0; d < dropdowns.length; d++) {
              var openDropdown = dropdowns[d];
              if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
              }
            }
          }
        }
    </script>
</body>
</html>