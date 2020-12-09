<HTML>
<HEAD>
<SCRIPT LANGUAGE="Javascript">
<!--
var Words = "<!doctype html>
<html lang="ko">
  <head>
    <script type="text / javascript">
      function isMobile(){      
        var UserAgent = navigator.userAgent;
        if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
          return true;
        }else{
          return false;
        }
      }
      if(isMobile()){
        location.href = ".. / OLmobile / FGIS / ";	//모바일페이지
      }
    </script>
<meta http-equiv="Cache - Control "	content="no - cache,no - store,must - revalidate " />
<meta http-equiv="Pragma " content="no - cache " /><meta http-equiv="Expires " content="0 " />
<link rel="shortcut icon " href="gisapplication.ico " />
<meta http-equiv="Content - Type "	content="text / html;charset = utf - 8 " />
<title data-langNum="_title ">FGIS/Professional</title>
<meta name="viewport "	content="width = device - width,initial - scale = 1,maximum - scale = 1 ">
<script type="text / javascript "	src="http: //dapi.kakao.com/v2/maps/sdk.js?appkey=fb865687fe70b7cbeedee1b6f6987232"	charset="utf-8"></script>
<script type = "text/javascript" src = "./config.js?ver=20201103"charset = 'UTF-8' ></script>
<script type="text/javascript">
      if(/MSIE \d|Trident.*rv:/.test(navigator.userAgent))
        document.write('<script type="text / javascript " src="http: //map.vworld.kr/js/vworldMapInit.js.do?version=2.0&apiKey='+VWorldKey+'&domain=www.gisapplication.kr"><'+'/script>');  
//document.write('<script type="text/javascript" src="http://map.vworld.kr/js/vworldMapInit.js.do?version=2.0&apiKey=1CE08370-325D-3DFA-9F34-E4991E494B88&domain=www.gisapplication.kr"><'+'/script>');
else {
	var _URL1 = "../build/vworld"; //"http://map.vworld.kr/js/etrimap";
	var _URL2 = "../build/vworld"; //"http://map.vworld.kr/js/etrimap/map";
	document.write('<script type="text/javascript" src="' + _URL1 + '/etrimap.init.js?ver=20181126"><' + '/script>');
	document.write('<script type="text/javascript" src="' + _URL1 + '/etrimap.function.js?ver=20181126"><' + '/script>');
	document.write('<script type="text/javascript" src="' + _URL2 + '/vw_min_release.js?ver=20181126"><' + '/script>');
	document.write('<script type="text/javascript" src="' + _URL2 + '/gunzip.min.js?ver=20181126"><' + '/script>');
	document.write('<script type="text/javascript" src="' + _URL2 + '/encoding-indexes-min.js?ver=20181126"><' + '/script>');
	document.write('<script type="text/javascript" src="' + _URL2 + '/encoding-min.js?ver=20181126"><' + '/script>');
	document.write('<script type="text/javascript" src="' + _URL2 + '/module.js?ver=20181126"><' + '/script>');
} </script>
    <link rel="stylesheet" type="text/css" media="all " href=".. / css / m - layout.css ? ver = 20181126 "/>
    <!-- link rel="stylesheet " type="text / css " media="all " href=".. / css / board.css "/ -->

    <link rel="stylesheet " href=".. / build / bootstrap.min.css " type="text / css ">
    <link rel="stylesheet " href=".. / build / zTreeStyle / zTreeStyle.css " type="text / css ">
    <link rel="stylesheet " href=".. / build / ol.css " type="text / css ">
    <link rel="stylesheet " href=".. / build / buttonstrip.css " type="text / css ">
    <link rel="stylesheet " href=".. / build / jquery - ui.css " type="text / css ">
    
    <link rel="stylesheet " href=".. / css / screen_time.css " type="text / css ">
    <link rel="stylesheet " href=".. / css / font - awesome.min.css " type="text / css ">
    <link rel="stylesheet " href=".. / css / bookmark.css " type="text / css ">
    <link rel="stylesheet " href=".. / css / tip - twitter.css " type="text / css ">
    <link rel="stylesheet " href=".. / css / ol - profil.css " type="text / css ">
    <link rel="stylesheet " href=".. / css / style.css ? ver = 20201103 " type="text / css ">
    <link rel="stylesheet " href=".. / css / toc.css " type="text / css ">
    <link rel="stylesheet " href=".. / css / map.css ? ver = -20201103 " type="text / css ">

    <script src=".. / build / fenopix.min.js "></script>
	<script src=".. / build / jquery - 3.3.1.min.js "></script>
	<script src=".. / build / jquery - ui.min.js "></script>
	<script src=".. / build / jquery.ui.touch - punch.min.js "></script>
	<script src=".. / build / buttonstrip.min.js "></script>
	<script src=".. / build / jszip.min.js "></script>
	<script src=".. / build / suncalc.js "></script>
	<script src=".. / build / raphael - min.js "></script>

<script type="text / javascript " src=". / suncalc_form.js ? ver = 20201103 " charset='UTF-8'></script>
<script type="text / javascript " src=". / lang.js ? ver = 20201103 " charset='UTF-8'></script>
<script type="
text / javascript "
	src=". / Commons.js ? ver = 20201103 " charset='UTF-8'></script>
<script type="
text / javascript "
	src=". / Commons_code.js ? ver = 20201103 " charset='UTF-8'></script>
<script type="
text / javascript " src=". / DaumRoadView.js "
	charset='UTF-8'></script>
<script type="
text / javascript " src=". / vworld3D.js "
	charset='UTF-8'></script>
<script type="
text / javascript "
	src=". / GA_map.js ? ver = 20201103 " charset='UTF-8'></script>
<script type="
text / javascript " src=". / v4maps.home_M.js "
	charset='UTF-8'></script>
<style>
</style>

</head>

<body id="
body " scroll="
no " style="overflow: hidden;">
	<div id="
header ">
		<div
			style="position: absolute; width: 100%; height: 100%; top: 0px; right: 0px; left: 0px; bottom: 0px; float: left; vertical - align : text - bottom; margin: 0px; padding: 0px;">
			<img src="
logo.png " style="height: 48px" /> <label id="
Label1 "
				style="color: #0000FF; bottom: 0px; top: 12px; margin: 0px; padding: 0px; position: relative;"
				data-langNum="_title1"> FirstGIS / Professional </label> <label
				id="Label2"
				style="font-family: Verdana; font-size: 20px; font-weight: bold; color: #f15922; bottom: 0px; top: 13px; margin: 0px; padding: 0px; position: relative;"
				data-langNum="_title2">2020</label>
		</div>
		<div
			style="position: absolute; height: 100%; top: 15px; right: 5px; bottom: 0px; float: right; vertical-align: text-bottom; margin: 0px; padding: 0px;">
			<img src="../images / goto32.png " style="height: 16px;" /> <label
				style="color: #0000FF; bottom: 0px; top: 3px; margin: 0px; padding: 0px; position: relative;">
				<a href="http://www.gisapplication.kr/webedit" target="_blank">
					FGIS / Pro Edit System </a> 
			</label>
		</div>
	</div>

	<div id="main-content">
		<div id="Left-content">
			<ul class="_tabs _tab_tabs">
				<li class="active"><a data - toggle="tab" href="#menu1"
					data - langNum="_layer"> Layer </a></li>
				<li><a data - toggle="tab" href="#menu2"
					data - langNum="_adresSearch"> Adres </a></li>
			</ul>
			<div class="tab-content _tab_content">
				<div id="menu1" class="tab-pane fade in active">
					<div class="toc_menu">
						<div id="toc" class="toc"></div>
					</div>
				</div>
				<div id="menu2" class="tab-pane fade">
					<div class="form_box type_1" percentage="13" isheight="false">
						<input type="text" id="keyword" name="keyword"
							placeholder="주소를 입력하세요." style="width: 180px; height: 25px"
							onmouseover="eventDefault(this)"> <span
							id="btn_search_poi" class="btn"> <a href="#"
							onclick="searchKeyword()" class="type2 b"
							data - langNum="_search"> 검색 </a></span>
					</div>
					<div class="scroll scrollAction sh" id="shleftSidebar"></div>
				</div>
			</div>

			<div onclick="TOCCloseBtn_click();"
				style="position: absolute; cursor: pointer; top: 0px; right: 0px; height: 32px; width: 17px; background: #1891da;">
				<img src="../images/btn-close-slide.gif" alt=""
					style="position: absolute; width: 15px; left: 0; top: 50%; margin-top: -9px;">
			</div>

			<div id="TOCOpenBar" onclick="TOCOpenBtn_click();"
				style="cursor: pointer; visibility: hidden; position: absolute; z-index: 9999; top: 0px; right: 0px; bottom: 0px; width: 19px; height: 100%; background: #1891da;">
				<img src="../images / btn - open - slide.gif " alt=""
					style="position: absolute; left: 0; top: 50%;">
			</div>

			<div id="
TOCEditBar "
				style="position: absolute; padding - top : 4px; left: 0px; right: 0px; bottom: 30px; width: 100%; height: 30px; background: #f0f0f0;">
				<label style="color: #474747; left: 0px;" data-langNum="_EditLayer">
					편집 </label> <select id="CB_EditLayerNames"
					style="color: #474747; width: 115px;">

				</select> <span id="btn_LayerCreate"
					style="margin: 0px; padding: 0px; padding-left: 2px; padding-right: 2px;"
					class="btn"> <a href="#" onclick="Sel_EditingLayer()"
						class="type2 b" data - langNum="_Create"> 생성 </a></span> <span
					id="btn_Layersearch"
					style="margin: 0px; padding: 0px; padding-left: 2px; padding-right: 2px;"
					class="btn"> <a href="#" onclick="Sel_SearchLayer()"
						class="type2 b" data - langNum="_search"> 검색 </a></span>
			</div>
			<div
				style="position: absolute; padding-top: 4px; padding-left: 5px; padding-right: 5px; left: 0px; right: 0px; bottom: 0px; width: 100%; height: 30px; background: #f0f0f0; font-weight: normal; font-size: 12px;">
				<span
					style="width: 49%; margin: 0px; padding: 0px; border: 1px solid #3e4660; background-color: #1891da; color: #ffffff;"
					class="btn"> <a href="#" style="border: none;"
					onclick="Btn_loadShpZip()" class="type2 b"
					data-langNum="_shapefileLoad">shapefile읽기</a> <input
					id="input_shapefile" type="file" style="display: none;"
					accept=".zip" onchange="input_shapefileChange(event)"/ ></span> <span
					style="width: 49%; margin: 0px; padding: 0px; border: 1px solid #3e4660; background-color: #1891da; color: #ffffff;"
					class="btn"><a href="#" style="border: none;"
					onclick="Btn_ReMoveShp()" class="type2 b"
					data-langNum="_shapefileRemove">shapefile삭제</a> </span>
			</div>
		</div>

		<div id="map-content">
			<div id="map" tabindex="0">
				<div id="popup-auto">
					<i id="popup-marker" class="p-marker_no"></i>
				</div>
			</div>
			<div id="main_naviAllDiv"
				style="visibility: visible; display: inline; position: absolute; left: 150px; top: 95px;"
				ondblclick="map_setRotation(0)">
				<div id=main_draggable>
					<div id="main_drag"></div>
					<div id="main_naviCompassDirection">
						<img id="navi_img" name="navi" src="../images / main_HT_B.png "
							style="width: 100%; height: 100%;">
						<div id="
main_naviCompass ">
							<svg width="
55px " height="
55px " viewBox=" - 1 - 1 2 2 "
								style="transform: rotate(- 112.5deg)">
                  <defs>
                    <radialGradient id="
main_gradient ">
                      <stop offset="
0 % "
									stop-color="
rgba(100, 100, 100, 0.7)"></stop>
                      <stop offset="
80 % "
									stop-color="
rgba(100, 100, 100, 0.6)"></stop>
                      <stop offset="
100 % "
									stop-color="
rgba(100, 100, 100, 0.3)"></stop>
                    </radialGradient>
                  </defs>
                  <circle cx="
0 " cy="
0 " r="
1 "
									fill="
url(#main_gradient)"></circle>
                  <path
									d="
M 1 0 A 1 1 0 0 1 0.7071067811865476 0.7071067811865475 L 0 0 Z "
									fill="
rgb(64, 64, 64)" fill-opacity="
0.3 "
									stroke="
rgba(255, 255, 255, 0.1)"
									stroke-width="
0.014285714285714285 "
									onclick="
mapMove_Mode('up')"></path>
                  <path
									d="
M 0.7071067811865476 0.7071067811865475 A 1 1 0 0 1 6.123233995736766e-17 1 L 0 0 Z "
									fill="
rgb(64, 64, 64)" fill-opacity="
0.3 "
									stroke="
rgba(255, 255, 255, 0.1)"
									stroke-width="
0.014285714285714285 "
									onclick="
mapMove_Mode('up_right')"></path>
                  <path
									d="
M 6.123233995736766e-17 1 A 1 1 0 0 1 - 0.7071067811865475 0.7071067811865476 L 0 0 Z "
									fill="
rgb(64, 64, 64)" fill-opacity="
0.3 "
									stroke="
rgba(255, 255, 255, 0.1)"
									stroke-width="
0.014285714285714285 "
									onclick="
mapMove_Mode('right')"></path>
                  <path
									d="
M - 0.7071067811865475 0.7071067811865476 A 1 1 0 0 1 - 1 1.2246467991473532e-16 L 0 0 Z "
									fill="
rgb(64, 64, 64)" fill-opacity="
0.3 "
									stroke="
rgba(255, 255, 255, 0.1)"
									stroke-width="
0.014285714285714285 "
									onclick="
mapMove_Mode('down_right')"></path>
                  <path
									d="
M - 1 1.2246467991473532e-16 A 1 1 0 0 1 - 0.7071067811865477 - 0.7071067811865475 L 0 0 Z "
									fill="
rgb(64, 64, 64)" fill-opacity="
0.3 "
									stroke="
rgba(255, 255, 255, 0.1)"
									stroke-width="
0.014285714285714285 "
									onclick="
mapMove_Mode('down')"></path>
                  <path
									d="
M - 0.7071067811865477 - 0.7071067811865475 A 1 1 0 0 1 - 1.8369701987210297e-16 - 1 L 0 0 Z "
									fill="
rgb(64, 64, 64)" fill-opacity="
0.3 "
									stroke="
rgba(255, 255, 255, 0.1)"
									stroke-width="
0.014285714285714285 "
									onclick="
mapMove_Mode('down_left')"></path>
                  <path
									d="
M - 1.8369701987210297e-16 - 1 A 1 1 0 0 1 0.7071067811865474 - 0.7071067811865477 L 0 0 Z "
									fill="
rgb(64, 64, 64)" fill-opacity="
0.3 "
									stroke="
rgba(255, 255, 255, 0.1)"
									stroke-width="
0.014285714285714285 "
									onclick="
mapMove_Mode('left')"></path>
                  <path
									d="
M 0.7071067811865474 - 0.7071067811865477 A 1 1 0 0 1 1 - 2.4492935982947064e-16 L 0 0 Z "
									fill="
rgb(64, 64, 64)" fill-opacity="
0.3 "
									stroke="
rgba(255, 255, 255, 0.1)"
									stroke-width="
0.014285714285714285 "
									onclick="
mapMove_Mode('up_left')"></path>
                </svg>
						</div>
						<div id="
main_rotate " onclick="
map_setRotation(0)"></div>
					</div>
				</div>
			</div>
			<label id="
lb_MapLevel "
				style="position: absolute; bottom: 26px; left: 8px; height: 20px; background - color : rgba( 0, 60, 136, .4); color: #FFFFFF; padding: 1px;">Level:
				00</label>
			<div id="
MapModeButton_content "></div>
			<div id="
MapColorButton_content "></div>
			<div id="
MapControlButton_content "></div>
			<div id="
MainMapModeDropdown " class="
dropdown ">
				<div class="
select ">
					<span data-langNum="
_vworld ">브이월드</span> <i
						class="
fa fa - chevron - left "></i>
				</div>
				<input type="
hidden " name="
gender " value="브이월드">
				<ul class="
dropdown_menu ">
					<li class="
selected " id="
map0 " data-langNum="
_vworld ">브이월드</li>
					<li id="
map1_1 " data-langNum="
_naver ">네이버지도</li>
					<li id="
map2 " data-langNum="
_daum ">다음지도</li>
					<li id="
map3 " data-langNum="
_google ">구글지도</li>
					<li id="
map1 " data-langNum="
_Ngii ">국토정보맵</li>
					<li id="
map1 " data-langNum="
_Ngii_en ">국토정보맵(영)</li>
					<li id="
map1 " data-langNum="
_Ngii_cn ">국토정보맵(중)</li>
					<li id="
map1 " data-langNum="
_Ngii_jp ">국토정보맵(일)</li>
					<li id="
map4 ">NONE</li>
				</ul>
			</div>

			<div id="
DaumMapYearDropdown " class="
dropdown "
				style="display: none; left: 165px; width: 70px;">
				<div class="
select ">
					<span data-langNum="
_NewYearNowMAP ">최신영상</span> <i
						class="
fa fa - chevron - left "></i>
				</div>
				<input type="
hidden " name="
gender " value="최신영상">
				<ul class="
dropdown_menu ">
					<li class="
selected " id="
DaumMap_NEW "
						data-langNum="
_NewYearNowMAP ">최신영상</li>
					<li id="
DaumMap_2018 ">2018</li>
					<li id="
DaumMap_2017 ">2017</li>
					<li id="
DaumMap_2016 ">2016</li>
					<li id="
DaumMap_2015 ">2015</li>
					<li id="
DaumMap_2014 ">2014</li>
					<li id="
DaumMap_2013 ">2013</li>
					<li id="
DaumMap_2012 ">2012</li>
					<li id="
DaumMap_2011 ">2011</li>
					<li id="
DaumMap_2010 ">2010</li>
					<li id="
DaumMap_2009 ">2009</li>
					<li id="
DaumMap_2008 ">2008</li>
				</ul>
			</div>

			<div id="
popup " class="
ol - popup ">
				<a href="#" id="
popup - closer " class="
ol - popup - closer "></a>
				<div id="
popup - content "></div>
			</div>
			<div id="
roadviewForm " class="
roadviewmap "
				style="display: none"></div>
			<!--
        <div class="
ol - attribution ol - unselectable ol - control " style="
display: table;
padding: 1px;
vertical - align: middle;
position: absolute;
border - radius: 4px;
bottom: .5em;
right: .5em;
background: rgba(255, 255, 255, .8);
">
          <div id="
GA_DIV " style="
display: inline;
">
            <li>
              <a href="
http: //www.gisapplication.kr/" target="_blank">
<img src = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAFXUlEQVR42n3UaVDUBRjH8e2YqTdd1jRN9qJjpoPIA0JLKxNRc9VAPEAoDJIFQbFFYZGl5RBxcXfZXViOwG0RDAQWFDDBgCVRUUMSvIDAFC0IEUWEgP3DfludqalhpmfmefuZ55lnfo9I9K8qLuYRtWl4cWK29dhOo1XQHhi2hewos63z+9YWIT9mS9ZdsqVmX7SZin8dqGvszzrbYp0r+r8y7B/9aLtmOF+eMYa2xEpJg0BeZQe70zqJSOgiOPIGkvA2QradRZ3a2lNl+aOusm5M3NnJk1OwJMNd8dakux3hulHSy61UNVtp6Rbo7hf4bUCguqGTPcZf2ZE6iCTmd/zCutHlXCOvdOSmuUKI/wcFHjIdGHH5KmHo3GbVnzZNmZWKJoFLNwT6hwRGxgXGhQkGh0e50jPMqfYxMsuH2J5yjzjDECU1VnILrNf35o4uegDW1Iy+GrO7Ty2R96H4dpxci0Bjh0DPnQlG7dCkbRKbzcbk5OQDuP/uOO09Y9S39hMqLyVR/zMROwoHioq6sk6ftk957MSfnkn6zprNCddILhqjqFHg3DWBgeEJJiYmHmB/g21tbfzwYyPmqkZ26svwlp7FO6wPT99qZPLm74zG9idERaU90fHa/utS9RB7ikYpOyNwwb7unRFhClhrsWCqPInaWEuI4jCBCXfw+Wocn+Ab+Ac1Dm7cWP+SSLGrO04a1zuxRXmbXd8NYz4l0Go/xsA9AeH+ynbofguCgEabSmRSLhEqC59vq2HtJgtua86wZFU1bsvz0OlOx4tkitaGdQENfCZtJs40SOFxKz9dEegdtMMX2ymtqKP1QhtKbQ5ZuaUo0hpJyheQqgW8NrWz0vc27j6X8Qk4SUBQvVYUHFx2fvbsGJa6lyEz3GJvtZWaVoGOHgGzHVPlNJG5rw5zbS+x6kOExjURqRXYGG1l5fpWXFe0s8T9OImqCxgyz2lFsu315e7iQhaLSwhL7kWmO092+W9UnuzFP1RPlLqHWO1FktOb8dvyPdJdI2yUWVntP8TCZXXM/bAe1+XVRMc3kWqwg5Hh1XJpcAkhEjNBik4WLE9kvmsyYs8sXMXZrPW34LupmfWSM3j4HuFTr1rcVlThtqyAtV5JePsq8fRKwX1tBpGyo1pRpv6qt0HZNbIr5ijp2S287bSFNx0z+HhZLQuWnuMTj1/wWH/b3oOIV19lmccl/CSH8dmcgniDAjfvSAI2JxKjKKS4uMVLtG/frek65e/G8JAjqOTV+K7Zz4xZGmbNSeGtd3JwmpOHy7xaXOZb+GBhJR5f7sM7IJ4VQUqcwzJxkWhw8pThF/w1hoy98fej92hRfve6LH1TX1SomS0h51kuNrJ0aQYzZyTwrrMKR0c9bznoWeSh4f1tRlz9EokK38NrCZU8Jy1g+mca3lsVjlKlu/kgfkdSOx87e6prQ47ucL3Er4IZjqG4fpiO6/wsFs5LY57LN7g4a3BYr+T56ApeSDmOovw0iw918VRaC9MiDzLri0T2aNP5z8exR8s/V3PiuvviHBwclDi+o+fNN+yTvKbCySmaVwMNPJNyhmcLunjl0GXCjnfyVME1pqlOsGTrbhTxidlT3liDpbsrfnsjSxblM9vZiONMDXPm5zPLOYY5m1J4OvVnXjzYzStHr+BwpI3p5qu8q6ok7OukgfLy8o+mgDU190Iys25eiIzqxj/wF1avqSIouJ6oiGJCwpN5X2nm9QMdTDt4lZfNF/lAXYREnjSoT0uXm0ymx6eAsbE8nJd37/n9hQOBpvxbP6Zl9tkT0Mvly7fp++MW6rQs/LdGESiLxTc0nJ1K1U2pNGLB39hfWPjmyNzOt78AAAAASUVORK5CYII=" / ></a>
            </li > <li style = "font-family:Arial Black;font-size: 12px;" > <a href = "http://www.gisapplication.kr/"
target = "_blank"
style = "font-family:Arial Black;font-size: 14px; color:#337ab7" > GIS Application </a> FGIS/Professional </li>
            <img id="btn_export-pdf" src="../images / btn - print.png " onclick="
BtnPrint_click();
" style="
cursor: pointer;
">
          </div>
          <button id="
GA_button " type="
button " title="
GIS Application®" class="
ol - control - Attribution " onclick="
GA_button_click();
"><span id="
GA_buttonLabel " data-langNum="
left_arr ">»</span></button>
        </div>
        -->
			<img id="
Btn_3D " onclick="
Map3D_Btn_click();
"
				src=".. / images / 1.png " alt=""
				style="cursor: pointer; position: absolute; right: 0px; bottom: 50%;">

			<div id="
time - slider - container " style="display: none;">
				<div id="
time - scale - container "></div>
				<div id="
time - slider - 2 ">
					<div id="
time - scale - twilight "></div>
					<div id="
time - scale - twilight - 2 "></div>
					<div id="
time - scale - sunlight "></div>
					<div id="
time - scale - sunlight - 2 "></div>
				</div>
			</div>

			<div id="
time - slider - info3 "
				style="display: none; white - space : pre; color: #ffffff; font - weight : bold; position: absolute; border: 1px solid rgb(216, 216, 216); padding: 3px; width: 290px; right: 0px; bottom: 31px; height: 60px;">

			</div>
			<div id="
time - slider - info2 "
				style="display: none; position: absolute; padding: 0px; border: 1px solid rgb(216, 216, 216); left: 395px; bottom: 31px; width: 305px; height: 30px;">
				<li style="position: inherit; right: 4px; top: 0px;"><input
					id="
time - slider_checkboxMM " type="
checkbox "
					style="color: #ffffff; width: 15px; background - color : #000000; border: inherit; height: 26px; margin: 1px; font-size: 16px; font-weight: bold"
					onclick="time_sliderMM_click();"/ ><label
					style="color: #ffffff;"> Play </label> </li>
				<button id="time_btn1" type="button"
					style="color: #ffffff; width: 20px; background-color: #000000; border: inherit; height: 26px; top: 0px; margin: 1px; font-size: 14px; font-weight: bold; margin-right: -4px;"
					onclick="time_slider_MM_click(1);">
					1 </button>
					<button id="time_btn2" type="button"
						style="color: #ffffff; width: 20px; background-color: #000000; border: inherit; height: 26px; top: 0px; margin: 1px; font-size: 14px; font-weight: bold; margin-right: -4px;"
						onclick="time_slider_MM_click(2);">2</button>
					<button id="time_btn3" type="button"
						style="color: #ffffff; width: 20px; background-color: #000000; border: inherit; height: 26px; top: 0px; margin: 1px; font-size: 14px; font-weight: bold; margin-right: -4px;"
						onclick="time_slider_MM_click(3);">
						3 </button>
						<button id="time_btn4" type="button"
							style="color: #ffffff; width: 20px; background-color: #000000; border: inherit; height: 26px; top: 0px; margin: 1px; font-size: 14px; font-weight: bold; margin-right: -4px;"
							onclick="time_slider_MM_click(4);">4</button>
						<button id="time_btn5" type="button"
							style="color: #ffffff; width: 20px; background-color: #000000; border: inherit; height: 26px; top: 0px; margin: 1px; font-size: 14px; font-weight: bold; margin-right: -4px;"
							onclick="time_slider_MM_click(5);">
							5 </button>
							<button id="time_btn6" type="button"
								style="color: #ffffff; width: 20px; background-color: #000000; border: inherit; height: 26px; top: 0px; margin: 1px; font-size: 14px; font-weight: bold; margin-right: -4px;"
								onclick="time_slider_MM_click(6);">6</button>
							<button id="time_btn7" type="button"
								style="color: #ffffff; width: 20px; background-color: #000000; border: inherit; height: 26px; top: 0px; margin: 1px; font-size: 14px; font-weight: bold; margin-right: -4px;"
								onclick="time_slider_MM_click(7);">
								7 </button>
								<button id="time_btn8" type="button"
									style="color: #ffffff; width: 20px; background-color: #000000; border: inherit; height: 26px; top: 0px; margin: 1px; font-size: 14px; font-weight: bold; margin-right: -4px;"
									onclick="time_slider_MM_click(8);">8</button>
								<button id="time_btn9" type="button"
									style="color: #ffffff; width: 20px; background-color: #000000; border: inherit; height: 26px; top: 0px; margin: 1px; font-size: 14px; font-weight: bold; margin-right: -4px;"
									onclick="time_slider_MM_click(9);">
									9 </button>
									<button id="time_btn10" type="button"
										style="color: #ffffff; width: 20px; background-color: #000000; border: inherit; height: 26px; top: 0px; margin: 1px; font-size: 14px; font-weight: bold; margin-right: -4px;"
										onclick="time_slider_MM_click(10);">10</button>
									<button id="time_btn11" type="button"
										style="color: #ffffff; width: 20px; background-color: #000000; border: inherit; height: 26px; top: 0px; margin: 1px; font-size: 14px; font-weight: bold; margin-right: -4px;"
										onclick="time_slider_MM_click(11);">
										11 </button>
										<button id="time_btn12" type="button"
											style="color: #ffffff; width: 20px; background-color: #000000; border: inherit; height: 26px; top: 0px; margin: 1px; font-size: 14px; font-weight: bold; margin-right: -4px;"
											onclick="time_slider_MM_click(12);">12</button>
			</div>
			<div id="time-slider-info"
				style="display: none; position: absolute; border: 1px solid rgb(216, 216, 216); padding: 3px; width: 390px; left: 0px; bottom: 31px; height: 30px; z-index: 1999; font-size: 12px; padding-left: 20px; padding-top: 5px; background-color: rgb(51, 51, 51);">
				<button type="button"
					style="color: #ffffff; width: 15px; left: 0px; position: inherit; background-color: #000000; border: inherit; height: 26px; top: 0px; margin: 1px; font-size: 16px; font-weight: bold;"
					onclick="time_sliderPrevious_click();">-</button>
				<input id="SetSunCalc_date" readonly='true' type="text" name="date"
					size="12"
					style="width: 70px; text-align: center; background: #000000; color: #ffffff;"/ ><a
					href="javascript:void(0);" id="zeigeSoFi"> <span> sun
						info </span> </a>
				<li style="position: inherit; right: 20px; top: 0px;"><input
					id="time-slider_checkbox" type="checkbox"
					style="color: #ffffff; width: 15px; background-color: #000000; border: inherit; height: 26px; margin: 1px; font-size: 16px; font-weight: bold"
					onclick="time_slider_click();"/ ><label
					style="color: #ffffff;"> Play </label> </li>
				<button type="button"
					style="color: #ffffff; width: 15px; right: 0px; position: inherit; background-color: #000000; border: inherit; height: 26px; top: 0px; margin: 1px; font-size: 16px; font-weight: bold;"
					onclick="time_sliderNext_click();">+</button>
			</div>
		</div>

		<div id="right-content">
			<div id="maparea"
				style="border: none; position: absolute; overflow: hidden; left: 0px; top: 0px; width: 100%; height: 100%"">
				<div id="EtriGlobeArea"
					style="border: none; position: absolute; overflow: hidden; left: 0px; top: 0px; width: 100%; height: 100%"">
					<canvas id="3D-globe"
						style="border: none; position: absolute; overflow: hidden; left: 0px; top: 0px; width: 100%; height: 100%"></canvas>
					<canvas id="3D-globe1"
						style="border: none; position: absolute; overflow: hidden; left: 0px; top: 0px; width: 100%; height: 100%"> </canvas>
				</div>

				<div id="naviAllDiv" style="visibility: visible; display: none;">
					<div id="naviCompassDirection">
						<img name="navi" src="../images/HT.png">
					</div>
					<div id="naviCompass">
						<svg width="70px" height="70px" viewBox="-1 -1 2 2"
							style="transform: rotate(-112.5deg)">
                <defs>
                  <radialGradient id="gradient">
                    <stop offset="0%"
								stop-color="rgba(100, 100, 100, 0.7)"></stop> <stop offset="80%"
								stop - color="rgba(100, 100, 100, 0.6)"> </stop>
                    <stop offset="100%"
								stop-color="rgba(100, 100, 100, 0.3)"></stop> </radialGradient>
                </defs> <circle cx="0" cy="0" r="1" fill="url(#gradient)"> </circle>
              <path
								d="M 1 0 A 1 1 0 0 1 0.7071067811865476 0.7071067811865475 L 0 0 Z"
								fill="rgb(64, 64, 64)" fill-opacity="0.3"
								stroke="rgba(255, 255, 255, 0.1)"
								stroke-width="0.014285714285714285"
								onpointerdown="Map3D.getNavi().navi_compass_rotateT('1', Map3D);"
								onpointerup="Map3D.getNavi().navi_compass_rotateT('2', Map3D);"></path> <path
								d="M 0.7071067811865476 0.7071067811865475 A 1 1 0 0 1 6.123233995736766e-17 1 L 0 0 Z"
								fill="rgb(64, 64, 64)" fill - opacity="0.3"
								stroke="rgba(255, 255, 255, 0.1)"
								stroke - width="0.014285714285714285"
								onpointerdown="Map3D.getNavi().navi_compass_rotateTR('1', Map3D);"
								onpointerup="Map3D.getNavi().navi_compass_rotateTR('2', Map3D);"> </path>
							<path
								d="M 6.123233995736766e-17 1 A 1 1 0 0 1 -0.7071067811865475 0.7071067811865476 L 0 0 Z"
								fill="rgb(64, 64, 64)" fill-opacity="0.3"
								stroke="rgba(255, 255, 255, 0.1)"
								stroke-width="0.014285714285714285"
								onpointerdown="Map3D.getNavi().navi_compass_rotateR('1', Map3D);"
								onpointerup="Map3D.getNavi().navi_compass_rotateR('2', Map3D);"></path> <path
								d="M -0.7071067811865475 0.7071067811865476 A 1 1 0 0 1 -1 1.2246467991473532e-16 L 0 0 Z"
								fill="rgb(64, 64, 64)" fill - opacity="0.3"
								stroke="rgba(255, 255, 255, 0.1)"
								stroke - width="0.014285714285714285"
								onpointerdown="Map3D.getNavi().navi_compass_rotateBR('1', Map3D);"
								onpointerup="Map3D.getNavi().navi_compass_rotateBR('2', Map3D);"> </path>
							<path
								d="M -1 1.2246467991473532e-16 A 1 1 0 0 1 -0.7071067811865477 -0.7071067811865475 L 0 0 Z"
								fill="rgb(64, 64, 64)" fill-opacity="0.3"
								stroke="rgba(255, 255, 255, 0.1)"
								stroke-width="0.014285714285714285"
								onpointerdown="Map3D.getNavi().navi_compass_rotateB('1', Map3D);"
								onpointerup="Map3D.getNavi().navi_compass_rotateB('2', Map3D);"></path> <path
								d="M -0.7071067811865477 -0.7071067811865475 A 1 1 0 0 1 -1.8369701987210297e-16 -1 L 0 0 Z"
								fill="rgb(64, 64, 64)" fill - opacity="0.3"
								stroke="rgba(255, 255, 255, 0.1)"
								stroke - width="0.014285714285714285"
								onpointerdown="Map3D.getNavi().navi_compass_rotateBL('1', Map3D);"
								onpointerup="Map3D.getNavi().navi_compass_rotateBL('2', Map3D);"> </path>
							<path
								d="M -1.8369701987210297e-16 -1 A 1 1 0 0 1 0.7071067811865474 -0.7071067811865477 L 0 0 Z"
								fill="rgb(64, 64, 64)" fill-opacity="0.3"
								stroke="rgba(255, 255, 255, 0.1)"
								stroke-width="0.014285714285714285"
								onpointerdown="Map3D.getNavi().navi_compass_rotateL('1', Map3D);"
								onpointerup="Map3D.getNavi().navi_compass_rotateL('2', Map3D);"></path> <path
								d="M 0.7071067811865474 -0.7071067811865477 A 1 1 0 0 1 1 -2.4492935982947064e-16 L 0 0 Z"
								fill="rgb(64, 64, 64)" fill - opacity="0.3"
								stroke="rgba(255, 255, 255, 0.1)"
								stroke - width="0.014285714285714285"
								onpointerdown="Map3D.getNavi().navi_compass_rotateTL('1', Map3D);"
								onpointerup="Map3D.getNavi().navi_compass_rotateTL('2', Map3D);"> </path></svg>
						<!--
path d = "M 1 0 A 1 1 0 0 1 0.7071067811865476 0.7071067811865475 L 0 0 Z"
fill = "rgb(64, 64, 64)"
fill - opacity = "0.3"
stroke = "rgba(255, 255, 255, 0.1)"
stroke - width = "0.014285714285714285"
onmousedown = "Map3D.getNavi().navi_compass_rotateT('1', Map3D);"
onmouseup = "Map3D.getNavi().navi_compass_rotateT('2', Map3D);" > </path><path d="M 0.7071067811865476 0.7071067811865475 A 1 1 0 0 1 6.123233995736766e-17 1 L 0 0 Z" fill="rgb(64, 64, 64)" fill-opacity="0.3" stroke="rgba(255, 255, 255, 0.1)" stroke-width="0.014285714285714285" onmousedown="Map3D.getNavi().navi_compass_rotateTR('1', Map3D);" onmouseup="Map3D.getNavi().navi_compass_rotateTR('2', Map3D);"></path > <path d = "M 6.123233995736766e-17 1 A 1 1 0 0 1 -0.7071067811865475 0.7071067811865476 L 0 0 Z"
fill = "rgb(64, 64, 64)"
fill - opacity = "0.3"
stroke = "rgba(255, 255, 255, 0.1)"
stroke - width = "0.014285714285714285"
onmousedown = "Map3D.getNavi().navi_compass_rotateR('1', Map3D);"
onmouseup = "Map3D.getNavi().navi_compass_rotateR('2', Map3D);" > </path><path d="M -0.7071067811865475 0.7071067811865476 A 1 1 0 0 1 -1 1.2246467991473532e-16 L 0 0 Z" fill="rgb(64, 64, 64)" fill-opacity="0.3" stroke="rgba(255, 255, 255, 0.1)" stroke-width="0.014285714285714285" onmousedown="Map3D.getNavi().navi_compass_rotateBR('1', Map3D);" onmouseup="Map3D.getNavi().navi_compass_rotateBR('2', Map3D);"></path > <path d = "M -1 1.2246467991473532e-16 A 1 1 0 0 1 -0.7071067811865477 -0.7071067811865475 L 0 0 Z"
fill = "rgb(64, 64, 64)"
fill - opacity = "0.3"
stroke = "rgba(255, 255, 255, 0.1)"
stroke - width = "0.014285714285714285"
onmousedown = "Map3D.getNavi().navi_compass_rotateB('1', Map3D);"
onmouseup = "Map3D.getNavi().navi_compass_rotateB('2', Map3D);" > </path><path d="M -0.7071067811865477 -0.7071067811865475 A 1 1 0 0 1 -1.8369701987210297e-16 -1 L 0 0 Z" fill="rgb(64, 64, 64)" fill-opacity="0.3" stroke="rgba(255, 255, 255, 0.1)" stroke-width="0.014285714285714285" onmousedown="Map3D.getNavi().navi_compass_rotateBL('1', Map3D);" onmouseup="Map3D.getNavi().navi_compass_rotateBL('2', Map3D);"></path > <path d = "M -1.8369701987210297e-16 -1 A 1 1 0 0 1 0.7071067811865474 -0.7071067811865477 L 0 0 Z"
fill = "rgb(64, 64, 64)"
fill - opacity = "0.3"
stroke = "rgba(255, 255, 255, 0.1)"
stroke - width = "0.014285714285714285"
onmousedown = "Map3D.getNavi().navi_compass_rotateL('1', Map3D);"
onmouseup = "Map3D.getNavi().navi_compass_rotateL('2', Map3D);" > </path><path d="M 0.7071067811865474 -0.7071067811865477 A 1 1 0 0 1 1 -2.4492935982947064e-16 L 0 0 Z" fill="rgb(64, 64, 64)" fill-opacity="0.3" stroke="rgba(255, 255, 255, 0.1)" stroke-width="0.014285714285714285" onmousedown="Map3D.getNavi().navi_compass_rotateTL('1', Map3D);" onmouseup="Map3D.getNavi().navi_compass_rotateTL('2', Map3D);"></path > </svg> -->
					</div>
				</div>
			</div>
		</div>

	</div>

	<div id="footer">
		<div
			style="position: absolute; top: 0px; left: 3px; width: 100%; height: 100%; padding-left: 8px; padding-top: 3px; vertical-align: middle;">
			<div
				style="display: inline-block; color: #FFFFFF; font-family: Verdana; font-size: 13px; line-height: 25px;">
				<label style="color: #FFFFFF" data - langNum="_Projection">
					Projection </label> <select id="projection"
					style="color: #474747; font-weight: normal; font-size: 13px;">
						<option value="EPSG:4326">WGS84 (DMS)</option>
						<option value="EPSG:3857">PseudoMercator </option>
						<option value="EPSG:5178">UTM-K (Bessel)</option>
						<option value="EPSG:5179">UTM - K(GRS80) </option>
						<option value="EPSG:5181">GRS80</option>
						<option value="EPSG:5186">GRS80(2010) </option>
				</select>
			</div>
			<div id="mouse-position"
				style="display: inline-block; color: #FFFFFF; font-family: Verdana; font-size: 13px; line-height: 25px;"></div>
		</div>

		<div class="adresArea">
			<a class="btn_adres"><span id="totalAdres"
				style="color: #FFFFFF; font-size: 14px; font-weight: bold;"></span>
			</a>
			<div id="div_adresArea" class="div_adresArea">
				<div class="adresSelt" id="adresSelt">
					<ul id="ul_sido"></ul>
					<ul id="ul_sgg">
					</ul>
					<ul id="ul_emd"></ul>
				</div>
				<div class="tc mb10">
					<span class="btn" id="btn_city_accept"><a href="#"
						class="type2" data-langNum="_ok">확인</a> </span> <span class="btn"
						id="btn_city_cancle"><a href="#" class="type2"
						data-langNum="_cancle">취소</a> </span>
				</div>
			</div>
		</div>

		<div
			style="color: #FFFFFF; position: absolute; top: 0px; height: 100%; padding-left: 8px; padding-top: 6px; right: 10px;">
			<label id="user_count" style="color: #FFFFFF;"> count <
				/label> 
		</div>
	</div>
	<!-- ----------------------------------------------------------------------------------------------------------------- -->
	<script type="text/javascript">
      //-------------------------------------------------------------------------------//
      var DropdownFocusoutTimer;
      window.onload=function() {
        setLanguage(Curr_Language);
        
        /*mapMode Dropdown Menu*/
        $('#MainMapModeDropdown').click(function () {
          $(this).attr('tabindex', 99999).focus();
          $(this).toggleClass('active');
          $(this).find('.dropdown_menu').slideToggle(300);
        });
        $('#MainMapModeDropdown').focusout(function () {
          var _this = $(this);
          DropdownFocusoutTimer = setTimeout(function() {
            _this.removeClass('active');
            _this.find('.dropdown_menu').slideUp(300);
          }, 1500);
        });
        $('#MainMapModeDropdown').mousemove(function () {
          if(DropdownFocusoutTimer) clearTimeout(DropdownFocusoutTimer);
          $(this).focus();
        });
        $('#MainMapModeDropdown .dropdown_menu li').click(function () {
          $(this).parents('#MainMapModeDropdown').find('span').text($(this).text());
          $(this).parents('#MainMapModeDropdown').find('input').attr('value', $(this).attr('id'));

          MainMapIndxName = $(this).text();
          var input = $(this).parents('#MainMapModeDropdown').find('input').val();
          $(this).addClass('selected').siblings('li').removeClass('selected');
          Set_Map(input);
        });
        
        $('#DaumMapYearDropdown').click(function () {
          $(this).attr('tabindex', 99999).focus();
          $(this).toggleClass('active');
          $(this).find('.dropdown_menu').slideToggle(300);
        });
        $('#DaumMapYearDropdown').focusout(function () {
          var _this = $(this);
          DropdownFocusoutTimer = setTimeout(function() {
            _this.removeClass('active');
            _this.find('.dropdown_menu').slideUp(300);
          }, 1500);
        });
        $('#DaumMapYearDropdown').mousemove(function () {
          if(DropdownFocusoutTimer) clearTimeout(DropdownFocusoutTimer);
          $(this).focus();
        });
        $('#DaumMapYearDropdown .dropdown_menu li').click(function () {
          $(this).parents('#DaumMapYearDropdown').find('span').text($(this).text());
          $(this).parents('#DaumMapYearDropdown').find('input').attr('value', $(this).attr('id'));

          MainMapIndxName = $(this).text();
          var input = $(this).parents('#DaumMapYearDropdown').find('input').val();
          $(this).addClass('selected').siblings('li').removeClass('selected');
          input = input.substring(input.indexOf("
_ ")+1);
          MainDaumMapYear = input;
          LastDaumZoom = null;
          Set_Map(MainMapIndx);
        });

        /*mapMode Button*/
        var bs1 = new ButtonStrip({
          id: 'MapModeButton'
        });
        bs1.addButton(getLang_value(Curr_Language, "
_mapmode1 "), true, 'click', function(){
          MainMapMode = "
Base ";
          Set_Map(MainMapIndx);
        });
        bs1.addButton(getLang_value(Curr_Language, "
_mapmode2 "), false, 'click', function(){
          MainMapMode = "
Satellite ";
          Set_Map(MainMapIndx);
        });
        bs1.addButton(getLang_value(Curr_Language, "
_mapmode3 "), false, 'click', function(){
          MainMapMode = "
Hybridmap ";
          Set_Map(MainMapIndx);
        });
        bs1.append('#MapModeButton_content');
        /*mapColor Button*/
        var bs2 = new ButtonStrip({
          id: 'MapColorButton'
        });
        bs2.addButton(getLang_value(Curr_Language, "
_mapolor1 "), true, 'click', function(){
          MapColorMode = "
color ";
          Set_Map(MainMapIndx);
        });
        bs2.addButton(getLang_value(Curr_Language, "
_mapolor2 "), false, 'click', function(){
          MapColorMode = "
grayscale ";
          Set_Map(MainMapIndx);
        });
        bs2.append('#MapColorButton_content');
        /*MapControlButton_content Button*/
        var bsMapControlButton = new ButtonStrip({
          id: 'MapControlbutton'
        });
        bsMapControlButton.addButton(getLang_value(Curr_Language, "
_MOVE "), true, 'click', function(){
          MapControlMode("
MOVE ");
        });
        bsMapControlButton.addButton(getLang_value(Curr_Language, "
_Distance "), false, 'click', function(){
          MapControlMode("
Distance ");
        });
        bsMapControlButton.addButton(getLang_value(Curr_Language, "
_Area "), false, 'click', function(){
          MapControlMode("
Area ");
        });
        bsMapControlButton.addButton(getLang_value(Curr_Language, "
_RoadView "), false, 'click', function(){
          MapControlMode("
RoadView ");
        });
        bsMapControlButton.append('#MapControlButton_content');
        $('ul._tabs').each(function(){
          var $active, $content, $links = $(this).find('a');
          $active = $($links.filter('[href="'+location.hash+'"]')[0] || $links[0]);
          $active.addClass('active');
          $content = $($active[0].hash);
          $links.not($active).each(function () {
            $(this.hash).hide();
		      });
          $(this).on('click', 'a', function(e){
            $active.removeClass('active');
            $content.hide();
            $active = $(this);
            $content = $(this.hash);
            $active.addClass('active');
            $content.show();
      
			      jsMapsVisiblenMarkers(false);
            if(e.target.href.indexOf("#menu1 ")>=0){

            }else if(e.target.href.indexOf("#menu2 ")>=0){
              jsMapsVisiblenMarkers(true);
            }
            e.preventDefault();
          });
        });

        Systrm_init();
        InitAddressMenu();
        Init_control_Profil(document.getElementById('map-content'));
        Init_Analysis_Form();
        Init_SOer_Form();
      }
      //////////////////////////////////////////////////////////////////////////
      function TOCCloseBtn_click(){
        $('#menu1').css({visibility: 'hidden'});
        $('#menu2').css({visibility: 'hidden'});
        $('#TOCEditBar').css({visibility: 'hidden'});
        $('#TOCOpenBar').css({visibility: 'visible'});
        $('#Left-content').css({width: 19});
        $('#map-content').css({left: 19});
        map.updateSize(); 
      }
      function TOCOpenBtn_click(){
        $('#TOCEditBar').css({visibility: 'visible'});
        $('#TOCOpenBar').css({visibility: 'hidden'});
        $('#Left-content').css({width: 250});
        $('#map-content').css({left: 250});
        $('#menu1').css({visibility: 'visible'});
        $('#menu2').css({visibility: 'visible'});
        map.updateSize();
      }
      //////////////////////////////////////////////////////////////////////////
      
      //////////////////////////////////////////////////////////////////////////
      </script>
</body>
</html>
" function EncryptCode() { var codeValue; codeValue = unescape(Words);
document.write(codeValue); } EncryptCode(); // --> </SCRIPT>
</HEAD>
</BODY>
</HTML>
