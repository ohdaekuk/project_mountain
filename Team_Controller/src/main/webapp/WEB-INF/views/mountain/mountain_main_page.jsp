<%@ page import="java.util.List"%>
<%@ page import="com.mountain.entity.SanDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String soeulBoundJson = (String)request.getAttribute("soeulBoundJson");
    Object sanList = request.getAttribute("sanList");
    if(request.getAttribute("sanList") == null){
        sanList = null;
    }else {
        sanList = (List<SanDto>)sanList;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mountain_main_page.jsp</title>
<style>
.pageTitle {
	text-align: center;
	font-size: large;
	margin-top: 130px;
}

.mountain_main_box {
	text-align: center;
	margin-top: 30px;
}

#map {
	height: 800px;
	width: 800px;
	margin-left: auto;
	margin-right: auto;
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
	<jsp:include page="head_ver2.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	<div class="pageTitle">
		<h1>산 선택하기</h1>
	</div>

	<%--지도만들고 산에다가 마커만 표시--%>
	<div class="mountain_main_box" id='map'></div>
</body>
<%--값 가져 오기 테스트--%>
<p id="test"></p>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=550bdf43dad6f30740d7f79d82612985"></script>
<script>

    $.ajax({
        type: "post",
        datatype: "json",
        chche: "false",
        url: "mountain_main",
        success:function (data){
            //sanList는 DB의 모든 산 객체가 들어가 있는 리스트
            let sanList = data;
            //java객체 javascript 객체로 만들기
            //맵 담을 컨테이너
            let mapContainer = document.getElementById('map');
            //맵설정
            let mapOption = {
                center: new kakao.maps.LatLng(37.660229925715335, 126.97990619509201),
                draggable: false,
                level: 5
            };
            //맵 생성
            let map = new kakao.maps.Map(mapContainer, mapOption);
            let bounds = new kakao.maps.LatLngBounds();
            //북한산

            let seoulJson = ${soeulBoundJson};

            let soeulBound = (seoulJson.features[0].geometry.coordinates[0]).map(function (item){
                return new kakao.maps.LatLng(item[1], item[0])
            })

            let soeulOuter = [
                new kakao.maps.LatLng(37.8731343491831, 126.61056434087557),
                new kakao.maps.LatLng(37.86514738956397, 127.36266438415588),
                new kakao.maps.LatLng(37.268898572592654, 127.36555748366192),
                new kakao.maps.LatLng(37.2561080973716, 126.60222036658494)
            ]


            let polygon = new kakao.maps.Polygon({
                path:[soeulOuter, soeulBound],
                strokeWeight: 3,
                strokeColor: 'grey;',
                strokeOpacity: 0.5,
                strokeStyle: 'longdash',
                fillColor: 'white',
                fillOpacity: 1
            });

            polygon.setMap(map);



            for(let i = 0; i < data.length; i++){
                var san = data[i]
                //장소 담을 변수
                var location = new kakao.maps.LatLng(san.lat, san.lon);
                //마커 생성
                let imageSrc = "resources/kakao_map_img/mountains_marker.png"
                let imageSize = new kakao.maps.Size(52, 52);
                let imageOption = {offset: new kakao.maps.Point(22,52)};
                let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

                var marker = new kakao.maps.Marker({
                    position: location,
                    clickable: true,
                    image: markerImage
                });
                //마커를 맵에 붙임.
                marker.setMap(map);
                //영역을 장소 만큼 확장.
                bounds.extend(location);
                //각 산의 정보
                var info = "<div class='info_window'>"+san.name + "</div>";
                //마커 위 설명창 생성
                var iw = new kakao.maps.InfoWindow({
                    position : location,
                    content : info
                });


                //맵 마커에 이벤트 등록.
                kakao.maps.event.addListener(marker, 'click', function() {
                    //클릭이벤트로 이동
                    window.location.href="http://localhost:8080/main/mountain_page?id="+(i+1);

                });

                iw.open(map, marker)
            }


            map.setBounds(bounds);
            //map.addOverlayMapTypeId(kakao.maps.MapTypeId.TERRAIN);
            document.querySelectorAll(".info_window").forEach(function (data){
                data.parentElement.style = "margin-left: auto; margin-right: auto;"
            })





        },
        error: function (e){
            console.log(e)
        },
    })


</script>

</html>
