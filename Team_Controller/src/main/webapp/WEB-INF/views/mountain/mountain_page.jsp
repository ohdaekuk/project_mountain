<%@ page import="com.mountain.entity.SanDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         
<%
    //response.get

    SanDto san = (SanDto) request.getAttribute("san");
    request.setAttribute("san", san);

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>mountain_page.jsp</title>
    <jsp:include page="head_ver2.jsp"></jsp:include>
    <jsp:include page="footer.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/a586df2ab8.js" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            let weatherIcon = {
                '01': 'fas fa-sun',
                '02': 'fas fa-cloud-sun',
                '03': 'fas fa-cloud',
                '04': 'fas fa-cloud-meatball',
                '09': 'fas fa-cloud-sun-rain',
                '10': 'fas fa-cloud-showers-heavy',
                '11': 'fas fa-poo-storm',
                '13': 'far fa-snowflake',
                '50': 'fas fa-smog'
            };

            // http://api.openweathermap.org/data/2.5/weather?lat=${san.lat}& =${san.lon}&appid=cc6e7d7b3720e50508b00f6221fdf419 위도 경도로 검색
            // http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=cc6e7d7b3720e50508b00f6221fdf419 도시로 검색
            $.getJSON('http://api.openweathermap.org/data/2.5/weather?lat=${san.lat}&lon=${san.lon}&appid=cc6e7d7b3720e50508b00f6221fdf419',
                function (
                    결과) {

                    $(".mountain_temp").append("온도 : " + parseFloat((결과.main.temp - 273.15)).toFixed(1) + "°C");
                    $(".mountain_humidity").append("습도 : " + 결과.main.humidity + "%");
                    var $Icon = (결과.weather[0].icon).substr(0, 2);
                    $(".mountain_icon").append('<i style="font-size: 80px;" class="' + weatherIcon[$Icon] + '"></i>');
                    $(".mountain_speed").append("바람   : " + 결과.wind.speed + "m/s");
                    $(".mountain_clouds").append("구름  : " + (결과.clouds.all) + "%");
                    // $(".mountain_main").append("날씨 : " + 결과.weather[0].main);
                    // $(".mountain_description").append("상세날씨설명 : " + 결과.weather[0].description);
                    // var imgURL = "http://openweathermap.org/img/w/" + 결과.weather[0].icon + ".png";
                    // $(".mountain_icon").attr("src", imgURL);
                    // $(".mountain_country").append("나라   : " + 결과.sys.country);
                    // $(".mountain_name").append("도시이름  : " + 결과.name);
                })
        });
    </script>
    <style>
        ul, li{
           list-style: none;
        }


        .mountain_icon{
            float: left; margin-left: 10px; margin-top: 12px;
        }

        .weather_box > *{
            margin-right: 5px;
        }

        .weather_box > i{
            font-size: 20px;
        }

        .weather_box {
            width: 260px;
            margin: 0 auto;
            color: white;
            background: navy;
            text-align: right;
        }

        .mountain_temp {
            color: white;
        }

        .mountain_page_box>hr {
            width: 1000px;
        }

        .mountain_page_box {
            text-align: center;
            margin-top: 100px;
            width: 1890px;
            margin-bottom: 50px;
        }

        .mountain_page_mountain_img {
            width: 400px;
            height: 250px;
        }

        .mountain_page_map_img {
            width: 50%;
            height: 50%;
            zoom: 0.50;
            -moz-transform: scale(1);
            -moz-transform-origin: 0 0;
            -o-transform: scale(1);
            -o-transform-origin: 0 0;
            -webkit-transform: scale(1);
            -webkit-transform-origin: 0 0;
        }

        .mountain_page_box > div {
            width: 1200px;
            font-size: 20px;
            margin: 0 auto;
        }

        .table {
            margin-left: 200px;
        }

        td>span {
            margin-right: 20px;
            font-size: 17px;
        }

        .restaurant_tr, .cafe_tr{
            width: 1000px; display: inline-block;
        }

        .restaurant_tr > td, .cafe_tr > td{
            width: 200px; height: 200px; display: inline-block; margin: 0 auto;
            border: 1px solid black; margin-right: 20px;
        }

        .mountain_page_restaurant > a, .mountain_page_cafe > a{
            text-decoration: none; color: black;
        }

        .mountain_page_bar{
            border: 1px solid black; border-radius: 15px; width: 110px; height: 245px;
            position: fixed; right: 20px; bottom: 37%; text-align: center;
        }

        .mountain_top{
            position: fixed; right: 20px; bottom: 28%; text-align: center; width: 100px; height: auto;
            text-decoration: none; color: black;
        }

        .mountain_page_bar > hr{
            width: 80%;
        }

        .mountain_page_bar > span{
            font-size: 20px;
        }

        .mountain_page_bar > a{
            text-decoration: none; color: gray;
        }
        #map{
            width: 80%; height: 350px; margin-right: auto; margin-left: auto;
        }
        .display_none{
            display: none;
        }
        .find_way{
            position: absolute; width:100%; height: 100%; top: 0; left: 0;
        }
        
        .level{border-bottom : 1px solid black; border-top :1px solid black; border-collapse: collapse; width: 700px;margin: auto;margin-top: 5px; font-size: medium;}
        .htd1{width: 100px; text-align: center; font-weight: bold; border-bottom:1px solid black;}
		.htd2{width: 500px; text-align: center; font-weight: bold; border-bottom:1px solid black;}
		.htd4{width: 100px; text-align: center; font-weight: bold; border-bottom:1px solid black;}
		.tr1{height: 30px;}
		.tr2{height: 25px;border-bottom: 0.5px solid gray;}
		
        .FD6_list {
            width: 90%; display: inline-flex;flex-direction: row; justify-content: space-between;
        }
        .list_container{
            display: inline-flex; justify-content: center; flex-direction: row;
        }
        .list_container > list > div{
            width: 25px; margin-left: 10px;
        }
        .button_container{
            display: inline-flex; justify-content: center; width: 80%;
        }
        .button_container > *{
            margin-right: 10px;
        }
        .button_container > *::after{
            content: "  |";
        }
        
    .placeList{
        border: 1px solid darkgrey; border-radius: 3%; overflow: hidden;
    }
    
    .each_list_page{
        margin-left: 30px;
    }
	
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
<jsp:include page="head_ver3.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
<div class="mountain_page_box">
    <div class="mountainname" style="font-size: xx-large;">
        <br><b>${san.name}</b><br><br><img class="mountain_page_mountain_img" src=${san.sanImg } alt="북한산">
    </div><br><br>

    <div id="1" class="mountain_page_info">
        <span><b>${san.name} 정보</b></span><br><br>
        <span>${san.info}</span><br><br>
    </div>

    <hr><br>

    <div id="2" class="mountain_page_entry">
        <span><b>등산로 입구</b></span>
        <br><br>
        <div id = "map"></div><br>
        <button class="moveToFindWay">클릭 위치 길찾기</button><br><br>
    </div>

    <hr><br>

    <div id="3" class="mountain_page_weather">
        <span><b>날씨</b></span><br><br>
        <div class="weather_box">
            <div class="mountain_icon"></div>
            <div class="mountain_temp"></div>
            <div class="mountain_humidity"></div>
            <div class="mountain_speed"></div>
            <div class="mountain_clouds"></div>
        </div>
    </div><br>

    <hr><br>

   	<div id="4" class="mountain_page_level">
            <span><b>난이도</b></span><br><br>
            <form action="mountain_page?id=${san.id}#4" method="post" name="levelForm" id="levelForm">
                <select name="level" style="height: 30px; margin-top: 10px;">
                	<option value="🔥☆☆☆☆">🔥☆☆☆☆</option>
                	<option value="🔥🔥☆☆☆">🔥🔥☆☆☆</option>
                	<option value="🔥🔥🔥☆☆">🔥🔥🔥☆☆</option>
                	<option value="🔥🔥🔥🔥☆">🔥🔥🔥🔥☆</option>
                	<option value="🔥🔥🔥🔥🔥">🔥🔥🔥🔥🔥</option>
                </select>
                <input type="hidden" name="sanId" value="${san.id}">
                <input type="hidden" name="userId" value="${user.id}">
                <input type="text" name="text" placeholder="한줄 평" style="width: 500px; height: 30px; ">
                <button type="submit" style="height: 30px;">난이도 등록</button>
            </form>
            <br>
            <table class="level">
            	<thead>
            		<tr class="tr1">
            			<td class="htd1">난이도</td>
						<td class="htd2">한줄평</td>
						<td class="htd4">작성일</td>
            		</tr>
            	</thead>
                <c:forEach var="diffi" items="${List}" >
					<tr class="tr2">
						<td class="td1">${diffi.level}</td>
						<td class="td2">${diffi.text}</td>
						<td class="td4">${diffi.writeDate.getYear()}-${diffi.writeDate.getMonthValue()}-${diffi.writeDate.getDayOfMonth()}</td>
					</tr>
				</c:forEach>
            </table><br>
    </div>

    <hr><br>

    <div id="5" class="mountain_page_map">
        <span><b>교통</b></span><br><br>
        <div class="mountain_page_map_img" alt="지도" style="position: relative; width: 80%; padding-top: 50.0%; margin-left: auto; margin-right: auto;">
            <embed class="find_way" src="https://map.kakao.com/link/to/${san.name},<%=san.getLat()%>,<%=san.getLon()%>" style="position: absolute; width:100%; height: 100%; top: 0; left: 0;z-index: -1">
        </div><br>
        <span>카카오 맵 API를 통해 길찾기 지원</span><br><br>

    </div>

    <hr>
    <h3>카페와 식당</h3>
    <div id="6" class="mountain_page_restaurant">
        <div class="button_container">
            <div class="CE7 caffe_button">카페찾기</div>
            <div class="FD6 food_button">음식점 찾기</div>
            <div class="default_button">처음으로 돌아가기</div>
            <div class="moveToFindWay">마지막으로 클릭한 위치 길찾기</div>
        </div><br><br>
        
        <div id="map2" style="width:80%;height:350px; margin-left: auto; margin-right: auto"></div>

        <div class="coffee_rest_container">
            <p class="coffee"></p>
            <ul class="FD6_list">

            </ul>
            <p class=""></p>
            <ul class="CE7_list">

            </ul>
            <ul class="list_container">

            </ul>
        </div>
        <br><br>

    </div><br>

    <hr><br>

    
</div>
<div class="mountain_page_bar">
    <br>
    <span>산</span>
    <hr>
    <a href="#1">정보</a><br>
    <a href="#2">등산로 입구</a><br>
    <a href="#3">날씨</a><br>
    <a href="#4">난이도</a><br>
    <a href="#5">교통</a><br><br>
    <a href="#6">카페와 식당</a>
    <hr>
</div>
<a class="mountain_top" href="#"><img style="width: 100px; height: 50px; " src="https://ifh.cc/g/0JVJC2.jpg"><br>
    <span>맨위로</span></a>


</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=550bdf43dad6f30740d7f79d82612985&libraries=services"></script>
<script>
    //상태값 받을 전역 변수들.
    var curName = "";
    var curLat = "";
    var curLng = "";
    //전역변수 currentSearchingState "cafe", "rest", "entrance"
    var currentSearchingState = "entrance";

    //.FD6_list>.onload_img_frame : 로딩중 이미지의 외부 프레임 선택자
    let findWayButtonList = document.querySelectorAll(".moveToFindWay")
    for(button of findWayButtonList) {
        button.onclick = function findWay(Name, Lat, Lng) {
            document.querySelector("embed").remove();
            let embed = document.createElement("embed")
            embed.classList.add("find_way")
            embed.src = "https://map.kakao.com/link/to/" + curName + "," + curLat + "," + curLng;
            document.querySelector(".mountain_page_map_img").append(embed);
            document.querySelector(".embed").focus();
        }


        defaultSet();

        //처음 실행했을때 부를 함수.
        function defaultSet() {
            $.ajax({
                type: "post",
                datatype: "json`",
                url: "getEntranceList?sanId=" + <%=san.getId()%>,
                success: function (data) {
                    showEntrance(data);
                    showRestCaffeListMap(data);
                },
                error: function (e) {
                    console.log(e)
                },
            })
        }

        //초기화버튼 눌렀을때.
        document.querySelector(".default_button").onclick = function () {
            defaultSet();
            document.querySelector('.FD6_list').innerHTML = "";
            document.querySelector(".list_container").innerHTML = "";
            currentSearchingState = "entrance";
        }


        function showEntrance(data) {
            let imageSrc = "resources/kakao_map_img/entrance_marker.png"
            let imageSize = new kakao.maps.Size(32, 34)
            let imageOption = {offset: new kakao.maps.Point(16,17)};
            let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
            //sanList는 DB의 모든 산 객체가 들어가 있는 리스트
            //java객체 javascript 객체로 만들기
            //맵 담을 컨테이너
            var mapContainer = document.getElementById('map');


            //맵설정
            let mapOption = {
                center: new kakao.maps.LatLng(<%=san.getLat()%>, <%=san.getLon()%>),
                level: 5
            };
            //맵 생성
            let map = new kakao.maps.Map(mapContainer, mapOption);

            //북한산

            let maxLat = 0;
            let maxLng = 0;
            let minLat = 0;
            let minLng = 0;
            for (let i = 0; i < data.length; i++) {
                entrance = data[i];
                if (minLat == 0) {
                    minLat = entrance.latitude;
                } else if (minLat > entrance.latitude) {
                    minLat = entrance.latitude
                }

                if (minLng == 0) {
                    minLng = entrance.longitude;
                } else if (minLng > entrance.longitude) {
                    minLng = entrance.longitude
                }

                if (maxLat < entrance.latitude) {
                    maxLat = entrance.latitude;
                }
                if (maxLng < entrance.longitude) {
                    maxLng = entrance.longitude
                }
            }
            let sw = new kakao.maps.LatLng(minLat, minLng);
            let ne = new kakao.maps.LatLng(maxLat, maxLng);
            let bounds = new kakao.maps.LatLngBounds(sw, ne);


            for (let i = 0; i < data.length; i++) {
                let entrance = data[i]
                let location = new kakao.maps.LatLng(entrance.latitude, entrance.longitude);
                let marker = new kakao.maps.Marker({
                    position: location,
                    clickable: true,
                    image: markerImage
                });
                marker.setMap(map);
                kakao.maps.event.addListener(marker, 'click', function () {
                    map.setCenter(new kakao.maps.LatLng(entrance.latitude, entrance.longitude));
                    map.setLevel(2);
                    curLat = entrance.latitude;
                    curLng = entrance.longitude;
                    curName = "찾으시는 등산로 위치";
                });
            }
            map.setBounds(bounds);
            map.addOverlayMapTypeId(kakao.maps.MapTypeId.TERRAIN);
        }

        function showRestCaffeListMap(data) {
            let imageSrc = "resources/kakao_map_img/entrance_marker.png"
            let imageSize = new kakao.maps.Size(32, 34)
            let imageOption = {offset: new kakao.maps.Point(16,17)};
            let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

            var markerList = [];
            // 마커를 클릭하면 장소명을 표출할 정보 표시창 zInedex 옵션객체를 추가해 겹침 방지
            var infowindow = new kakao.maps.InfoWindow({zIndex: 1});

            //찾을 중심 좌표, 나중에 합칠때 값 받은 것에 따라 다르게 설정하기.
            var searchLocation = new kakao.maps.LatLng(<%=san.getLat()%>, <%=san.getLon()%>)

            var mapContainer = document.getElementById('map2'), // 지도를 표시할 div
                mapOption = {
                    //클릭 되었을때 검색될 좌표₩
                    center: searchLocation,
                    level: 3 // 지도의 확대 레벨
                };
            // 지도를 생성
            var map = new kakao.maps.Map(mapContainer, mapOption);

            let maxLat = 0;
            let maxLng = 0;
            let minLat = 0;
            let minLng = 0;
            for (let i = 0; i < data.length; i++) {
                entrance = data[i];
                if (minLat == 0) {
                    minLat = entrance.latitude;
                } else if (minLat > entrance.latitude) {
                    minLat = entrance.latitude
                }

                if (minLng == 0) {
                    minLng = entrance.longitude;
                } else if (minLng > entrance.longitude) {
                    minLng = entrance.longitude
                }

                if (maxLat < entrance.latitude) {
                    maxLat = entrance.latitude;
                }
                if (maxLng < entrance.longitude) {
                    maxLng = entrance.longitude
                }
            }
            let sw = new kakao.maps.LatLng(minLat, minLng);
            let ne = new kakao.maps.LatLng(maxLat, maxLng);
            let bounds = new kakao.maps.LatLngBounds(sw, ne);


            for (let i = 0; i < data.length; i++) {
                let entrance = data[i]
                let location = new kakao.maps.LatLng(entrance.latitude, entrance.longitude);
                let marker = new kakao.maps.Marker({
                    position: location,
                    clickable: true,
                    image: markerImage
                });
                marker.setMap(map);

                kakao.maps.event.addListener(marker, 'click', function (event) {
                    map.setCenter(new kakao.maps.LatLng(entrance.latitude, entrance.longitude));
                    map.setLevel(2);
                    let center = map.getCenter();
                    searchLocation = new kakao.maps.LatLng(center.getLat(), center.getLng());
                    curLat = entrance.latitude;
                    curLng = entrance.longitude;
                    curName = "찾으시는 등산로 위치";
                });
            }
            map.setBounds(bounds);


            // 장소 검색 객체를 생성합니다


            //CE = 'C'aff'E'의 약자 카카오에서 그렇게 정해놓음
            //카페찾기했을때 리스트와 맵마커를 보여줄 함수
            document.querySelector(".CE7").onclick = function () {
                var imgTag = document.querySelector(".onload_img");
                currentSearchingState = "카페";
                //categorysearch(카테고리 검색 객체)에 넣을 옵션객체, location은 찾을 장소 변수화, radius는 주변반경 1000=1km
                var option = {
                    useMapBounds: true,
                    location: searchLocation,
                    radius: 1000
                }
                var ps = new kakao.maps.services.Places(map);
                //맵마커 초기화
                //markerList에 어떤 정보가 있는지 확인하려고
                //markerList의 marker에는 해당지역의 주소, 전화번호, 상표명, 카테고리 등등이 있음.
                //온클릭을 불러온 태그의 클래스명 확인하려고 = 이경우에는 카페
                var categoryClass = this.classList[0]

                //categoryClass = 카페, afterSearch = 검색후 실행할 함수, option 검색옵션
                //->categoryClass를 option에 따라 검색하는데, 검색후에 afterSearch실행함.
                ps.categorySearch(categoryClass, afterSearch, option);
            }

            //위와 같은 로직.
            document.querySelector(".FD6").onclick = function () {
                currentSearchingState = "식당";
                var option = {
                    useMapBounds: true,
                    location: searchLocation,
                    radius: 1000
                }
                var ps = new kakao.maps.services.Places(map);
                var categoryClass = this.classList[0]
                ps.categorySearch(categoryClass, afterSearch, option);
            }


            // 키워드 검색 완료 시 호출되는 콜백함수
            // placeList: 검색후에 뜨는 장소에 대한 정보의 리스트, status: 성공했는지 아닌지, pagination: 페이지 나눌때 쓰는 카카오맵 라이브러리
            //-> 검색후의 정보를 받아서 실행하는 함수. pagination은 페이지나누는 것을 커스텀 할 것이기 때문에 사용안하는 변수.

            function afterSearch(placeList, status, pagination) {
                //성공했을때
                if (status === kakao.maps.services.Status.OK) {
                    //마커 초기화
                    resetMarker();
                    //마커 띄움.
                    for (var i = 0; i < placeList.length; i++) {
                        displayMarker(placeList[i]);
                    }

                    mkList(placeList, 1, 4);
                    //페이지 번호 만들기
                    mkPage(placeList, 4);

                } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
                    let coffeeTitle = document.querySelector(".coffee");
                    document.querySelector(".list_container").innerHTML = "";
                    document.querySelector(".coffee").innerHTML = "";
                    coffeeTitle = document.querySelector(".coffee")
                    var h2 = document.createElement("h2")
                    h2.innerHTML = "이 주위에는 " + currentSearchingState + "가 없습니다."
                    coffeeTitle.appendChild(h2)

                }
            }

            // 지도에 마커를 표시하는 함수입니다
            function displayMarker(place) {
                let imageSrc = "resources/kakao_map_img/"
                if(currentSearchingState == "카페"){
                    imageSrc += "cafe_marker.png";
                }else if(currentSearchingState == "식당"){
                    imageSrc += "rest_marker.png"
                }
                let imageSize = new kakao.maps.Size(52, 52)
                let imageOption = {offset: new kakao.maps.Point(22,52)};
                let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

                // 마커를 생성하고 지도에 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: new kakao.maps.LatLng(place.y, place.x),
                    image: markerImage
                });
                //마커 생성하고 추가하기
                markerList.push(marker);
                marker.setMap(map);

                // 마커에 클릭이벤트를 등록합니다
                kakao.maps.event.addListener(marker, 'click', function () {
                    // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                    infowindow.setContent('<div style="padding:5px;font-size:12px; text-align: center">' + place.place_name + '</div>');
                    //map, maker에 정보표시창 붙이기.
                    infowindow.open(map, marker);
                    curLat = place.y;
                    curLng = place.x;
                    curName = place.category_name;
                });
            }

            //마커초기화 함수.
            function resetMarker() {
                for (var i = 0; i < markerList.length; i++) {
                    markerList[i].setMap(null);
                }
            }

            //placeList를 받고, pageNumber onclick으로 넘어온 pageNumber와 ClassName을 받는 리스트 생성함수.

            //List를 만드는 함수
            //페이지나눌 정보가 들어있는 placeList, 그리고 현재 페이지 정보값 pageNumber
            function mkList(placeList, pageNumber, listPerPage) {
                //호출할때마다 초기화
                document.querySelector(".list_container").innerHTML = "";
                document.querySelector(".coffee").innerHTML = "";
                var listDom = document.querySelector('.FD6_list');

                while (listDom.firstChild) {
                    //여기에 조건 붙이기.
                    listDom.removeChild(listDom.firstChild);
                }

                let h2 = document.createElement("h2")
                h2.innerHTML = currentSearchingState;
                document.querySelector(".coffee").append(h2);
                let restOrfoddUl = document.querySelector(".FD6_list");



                //h2 = 제목 표시할 DOM 객체
                //category_group_name: 카페나 음식점


                //리스트 만들기
                let totalPageNumber = 0

                //총페이지수 값 구하기.
                if (placeList % listPerPage == 0) {
                    totalPageNumber = placeList.length / listPerPage;
                } else {
                    totalPageNumber = parseInt(placeList.length / listPerPage) + 1
                }

                //리스트 만들기 현재페이지가 마지막 페이지일때와 아닐떄로 구분
                if (totalPageNumber == pageNumber) {
                    for (let i = pageNumber * listPerPage - listPerPage; i < placeList.length; i++) {
                        let list = document.createElement("li")
                        list.classList.add("placeList")
                        let loadImg = document.createElement("img")
                        loadImg.src = "https://tistory2.daumcdn.net/tistory/1898109/skin/images/Spinner.gif";
                        loadImg.style.width = "2600"
                        loadImg.style.height = "260px"
                        loadImg.classList.add("load_img");
                        let loadImgDiv = document.createElement("div");
                        loadImgDiv.classList.add("placeImgDiv")


                        let thisPlace = placeList[i]
                        //getPageImageSrc(thisPlace);
                        getPageImageSrc(thisPlace);
                        let pPlace = document.createElement("p");
                        pPlace.innerHTML = thisPlace.place_name;

                        let pAddress = document.createElement("p");
                        let pAddressStr = "주소: " + thisPlace.address_name;
                        pAddress.innerHTML = pAddressStr;

                        let pPhone = document.createElement("p")
                        let pPhoneStr = "전화번호: " + thisPlace.phone;
                        pPhone.innerHTML = pPhoneStr;

                        //pPlace.id = "place_id" + thisPlace.id
                        list.id = "place_id" + thisPlace.id;
                        loadImgDiv.append(loadImg);
                        list.append(loadImgDiv);
                        list.appendChild(pPlace);
                        list.appendChild(pAddress);
                        list.appendChild(pPhone);
                        listDom.append(list);

                    }

                } else {
                    for (let i = pageNumber * listPerPage - listPerPage; i < pageNumber * listPerPage; i++) {
                        //<img class="onload_img display_none" src="https://tistory2.daumcdn.net/tistory/1898109/skin/images/Spinner.gif" style="width: 350px; height: 350px">
                        let list = document.createElement("li")
                        let loadImgDiv = document.createElement("div");
                        loadImgDiv.classList.add("placeImgDiv")
                        loadImgDiv.style.width = "250px";
                        loadImgDiv.style.width = "250px";
                        list.classList.add("placeList")
                        let loadImg = document.createElement("img")
                        loadImg.src = "https://tistory2.daumcdn.net/tistory/1898109/skin/images/Spinner.gif";
                        loadImg.style.height = "260px";
                        loadImg.style.width = "260px"
                        loadImg.classList.add("load_img");


                        let thisPlace = placeList[i]
                        getPageImageSrc(thisPlace);
                        let pPlace = document.createElement("p");
                        pPlace.innerHTML = thisPlace.place_name;

                        let pAddress = document.createElement("p");
                        pAddressStr = "주소: " + thisPlace.address_name;
                        pAddress.innerHTML = pAddressStr;

                        let pPhone = document.createElement("p")
                        let pPhoneStr = "전화번호: " + thisPlace.phone;
                        pPhone.innerHTML = pPhoneStr;


                        list.id = "place_id" + thisPlace.id
                        loadImgDiv.append(loadImg);
                        list.append(loadImgDiv);


                        list.appendChild(pPlace);
                        list.appendChild(pAddress);
                        list.appendChild(pPhone);
                        listDom.append(list);


                    }

                }

            }

            //page 만들기
            function mkPage(placeList, listPerPage) {
                let totalPageNumber = 0
                document.querySelector(".list_container").innerHTML = "";
                if (placeList.length % listPerPage == 0) {
                    totalPageNumber = placeList.length / listPerPage;
                } else {
                    totalPageNumber = parseInt(placeList.length / listPerPage) + 1
                }
                for (let i = 0; i < totalPageNumber; i++) {
                    let eachPage = document.createElement("div")
                    eachPage.style.width = "fit-content"
                    eachPage.innerHTML = (i + 1) + "";
                    eachPage.href = "#"
                    eachPage.classList.add("each_list_page")

                    eachPage.onclick = function () {
                        mkList(placeList, i + 1, 4);
                        mkPage(placeList, 4);
                    }
                    let pageNumber = document.createElement("li");
                    pageNumber.appendChild(eachPage)
                    document.querySelector(".list_container").appendChild(pageNumber);
                }

            }

            //placeList값을 주면, 이미지 소스 List를 반환해주는 메서드
            function getPageImageSrc(place) {
                //var srcList = []; srcList 반환하려고 처음에 구상했던것 더미파일.

                var placeId = place.id;
                $.ajax({
                    type: "GET",
                    url: "getSrc",
                    datatype: "html",
                    cache: false,
                    beforeSend: function () {
			let beforeImg = document.querySelectorAll(".getImg");
                        if(beforeImg.length != 0){
                            beforeImg.forEach(function (data){
                                return data.remove();
                            })
                        }

                    },
                    data: {
                        id: placeId + ""
                    },
                    success: async function (data) {
                        let loadImg = document.querySelectorAll(".FD6_list > li .load_img")
			
                        for (let img of loadImg) {
                            img.remove();
                            let placeImgDiv = document.createElement("div")
                            placeImgDiv.style.width="250px";
                            placeImgDiv.style.height="250px";
                            placeImgDiv.classList.add("placeImgDiv")
                        }

                        let placeImgDiv = document.querySelector("#place_id" + placeId + "> .placeImgDiv");
                        let backgorundImg = document.createElement("img")
                        backgorundImg.classList.add("getImg")
                        //전역변수 currentSearchingState "cafe", "rest", "entrance"
                        if(data == "none"){
                            if(currentSearchingState == "카페"){
                                backgorundImg.src = "resources/kakao_map_img/cafe.jpeg"
                            }else if (currentSearchingState == "식당"){
                                backgorundImg.src = "resources/kakao_map_img/rest.jpeg"
                            }
                        }else {
                            backgorundImg.src = "https://" + data;
                        }

                        backgorundImg.style = "width: 260px; height: 260px";
                        placeImgDiv.append(backgorundImg);
                        let div = document.createElement("div")




                        return data;
                        await sleep(1000);

                    },
                    error: function (e) {
                        console.log(e)
                    },
                })
            }


        }
    }


</script>
<script>

</script>
</html>
