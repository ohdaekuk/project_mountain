<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <style>
    	
    	@font-face {
    		font-family: 'Pretendard-Regular';
    		src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    		font-weight: 400;
    		font-style: normal;
		}
		
        *{z-index: 2,}
        .footer > *, .footer *{margin: auto 0; text-align: center;}
        .footer{width: 100%; display: flex; justify-content: space-between; background-color: #202020; height: 40px; position: fixed; left: 0; bottom: 0; z-index: 2; font-family: 'Pretendard-Regular';}
        .left > *{margin-left: 70px; display:inline-block; color: aliceblue;}
        .right > *{margin-right: 30px; margin-left: 30px; display:inline-block; color: aliceblue;}
        .footer_a, .footer_a:hover, .footer_a:active{text-decoration: none; color: aliceblue;}
        
    </style>
    <body>
        <section class="footer">
            <nav class="left">
                <div>
                    <a class="footer_a" href="developer.jsp">제작자</a>
                </div>
            </nav>
    
            <nav class="right">
                <div>
                    <a class="footer_a" href="privacy.jsp">개인정보처리</a>
                </div>
                <div>
                    <a class="footer_a" href="service.jsp">약관</a>
                </div>
            </nav>
        </section>
        
    </body>
    </html>