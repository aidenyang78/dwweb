<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/site/www/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>교통 신호등 시설물 통합관리 시스템 || 시설물 통계</title>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/Base.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/ui-lightness/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/jquery-ui.min.css"/>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/jquery-ui-1.12.1/datepicker-ko.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/printThis.js"></script>

<script src="${pageContext.request.contextPath}/common/plugins/html2canvas/bluebird.min.js"></script> 			<!-- ie에서 promise를 사용하기 위해 --> 
<script src="${pageContext.request.contextPath}/common/plugins/html2canvas/FileSaver.min.js"></script>
<script src="${pageContext.request.contextPath}/common/plugins/html2canvas/html2canvas.js"></script>


<!-- leaflet 지도 -->
<jsp:include page="/WEB-INF/jsp/site/www/contents/main/function/leaflet_include.jsp"/>

<script type="text/javascript" src="http://map.vworld.kr/js/vworldMapInit.js.do?version=2.0&apiKey=970E88E0-2536-3A55-8216-0B675CBC5FCD"></script>
</head>
<body>
<input type="text" name="Latitude" id="Latitude"/>
<input type="text" name="Longitude" id="Longitude"/>

				<a href="javascript:;" onclick="fnDownloadMap();" class=btn_attach_map><span>이미지</span></a>
				<a href="javascript:;" onclick="fnPrintMap();" class="btn_print_map"><span>인쇄</span></a>

    <div id="leafletmap" style="width: 100%; height: 800px; border: 1px solid #ccc"></div>
<script>
var map 	= L.map('leafletmap');
var mgroup 	= L.layerGroup();	//marker group
var cgroup 	= L.layerGroup();	//circle group
var popup 	= L.popup();
var url 	= 'http://api.vworld.kr/req/wmts/2.0.0/970E88E0-2536-3A55-8216-0B675CBC5FCD/Base/{z}/{y}/{x}.png';

fnMakeLeafletMap(36.992232, 127.112551, 13);

/* ////////////////////////////////////////////////////////////////////////////////////////////////// */
//zoom level
var ZoomViewer = L.Control.extend({
	onAdd: function(){
		var zoomViewer= L.DomUtil.create('div');
		var zoomTxt = L.DomUtil.create('div');
		
		zoomViewer.style.width = '120px';
		zoomViewer.style.background = 'rgba(255,255,255,0.8)';
		zoomViewer.style.textAlign = 'center';
		
		map.on('zoomstart zoom zoomend', function(e){

			zoomTxt.innerHTML = 'Zoom level: ' + map.getZoom();
			
		})
		zoomViewer.appendChild(zoomTxt);

		return zoomViewer;
	}
});
(new ZoomViewer).addTo(map);


/////////////////////////////////////////////////////////////

//Toolbar.js
map.addControl(new L.Control.Draw({
  edit: {
      featureGroup: drawnItems,
      poly : {
          allowIntersection : false
      }
  },
  draw: {
      polygon : {
          allowIntersection: false,
          showArea:true
      },
     	marker: false,
     	circlemarker: false,
     	rectangle: false
  }
}));

//Truncate value based on number of decimals
var _round = function(num, len) {
  return Math.round(num*(Math.pow(10, len)))/(Math.pow(10, len));
};
//Helper method to format LatLng object (x.xxxxxx, y.yyyyyy)
var strLatLng = function(latlng) {
  return "("+_round(latlng.lat, 6)+", "+_round(latlng.lng, 6)+")";
};

//Generate popup content based on layer type
//- Returns HTML string, or null if unknown object
var getPopupContent = function(layer) {
  // Marker - add lat/long
  if (layer instanceof L.Marker || layer instanceof L.CircleMarker) {
      return strLatLng(layer.getLatLng());
  // Circle - lat/long, radius
  } else if (layer instanceof L.Circle) {
      var center = layer.getLatLng(),
          radius = layer.getRadius();
      return "Center: "+strLatLng(center)+"<br />"
            +"Radius: "+_round(radius, 2)+" m";
  // Rectangle/Polygon - area
  } else if (layer instanceof L.Polygon) {
      var latlngs = layer._defaultShape ? layer._defaultShape() : layer.getLatLngs(),
          area = L.GeometryUtil.geodesicArea(latlngs);
      return "총면적 : "+L.GeometryUtil.readableArea(area, true);
  // Polyline - distance
  } else if (layer instanceof L.Polyline) {
      var latlngs = layer._defaultShape ? layer._defaultShape() : layer.getLatLngs(),
          distance = 0;
      if (latlngs.length < 2) {
          return "총거리: N/A";
      } else {
          for (var i = 0; i < latlngs.length-1; i++) {
              distance += latlngs[i].distanceTo(latlngs[i+1]);
          }
          if(distance > 1000){
          	return "총거리 : "+_round(distance/1000, 2)+" km";
          }else{
          	return "총거리 : "+_round(distance, 2)+" m";
          }
      }
  }
  return null;
};

//Object created - bind popup to layer, add to feature group
map.on(L.Draw.Event.CREATED, function(event) {
  var layer = event.layer;
  var content = getPopupContent(layer);
  var lat = $("#Latitude").val();
  var lng = $("#Longitude").val();
	
  if (content !== null) {
      layer.bindPopup(content);
  }
  
  //marker.bindPopup("<h1>[ 평택시 ]</h1>", {autoClose:false, closeButton:false }).openPopup();			//정보 표출
  
  drawnItems.addLayer(layer);
});

//Object(s) edited - update popups
map.on(L.Draw.Event.EDITED, function(event) {
  var layers = event.layers,
      content = null;
  layers.eachLayer(function(layer) {
      content = getPopupContent(layer);
      if (content !== null) {
          layer.setPopupContent(content);
      }
  });
});


var customActionToPrint = function(context) {
	return function() {
		window.alert("We are printing the MAP. Let's do Custom print here!");
		context._printCustom();
	}
}

L.control.browserPrint({
	printLayer: L.tileLayer(url, {
					attribution : '<a href="http://www.vworld.kr/" target="_blank">vWrold</a>',
					minZoom: 7,
					maxZoom: 19,
					ext: 'png'
          	}),
            closePopupsOnPrint: false,
			printModes: [
					L.control.browserPrint.mode("Alert", "User specified print action", "A6", customActionToPrint, false),
					L.control.browserPrint.mode.landscape(),
					"PORTrait",
					L.control.browserPrint.mode.auto("Auto", "A4"),
					L.control.browserPrint.mode.custom("Séléctionnez la zone", "A5")
				]
}).addTo(map);

L.Control.BrowserPrint.Utils.registerLayer(L.TileLayer.WMS, 'L.TileLayer.WMS', function(layer) {
	console.info("Printing WMS layer.");
	return L.tileLayer.wms(layer._url, layer.options);
});

//L.popup({minWidth: 500}).setLatLng(L.latLng(39.73, -104.99)).setContent("Leaflet browser print plugin with custom print Layer and content").openOn(map);

//pop all control
var markersBounds;
var markersDisplayed = false;
//moveend
map.on('zoomend', function(e){
	var getZoom = map.getZoom();
	
	markersBounds = map.getBounds();
	
	if(getZoom > 13){
		mgroup.eachLayer(function (layer) {
			if (markersBounds.contains(layer.getLatLng())) {
				markersDisplayed = true;
				layer.openPopup();
	      	}
		});
		
	}else if(markersDisplayed){
		markersDisplayed = false;
		
		mgroup.eachLayer(function (layer) {
			if (markersBounds.contains(layer.getLatLng())) {
	    	    layer.closePopup();
			}
		});
	}
});

map.on('moveend', function(e){
	//alert(1);
	var getZoom = map.getZoom();
	markersBounds = map.getBounds();
	
	if(getZoom > 13){
		mgroup.eachLayer(function (layer) {
			if (markersBounds.contains(layer.getLatLng())) {
				
	    	    markersDisplayed = true;
	    	    
	    	    if(!layer._popup.isOpen()){
					layer.openPopup();
	    	    }
			}
		});
	}else if(markersDisplayed){
		markersDisplayed = false;
		
		mgroup.eachLayer(function (layer) {
			if (markersBounds.contains(layer.getLatLng())) {
				if(layer._popup.isOpen()){
	    	    	layer.closePopup();
				}
			}
		});
	}
});

map.on('click',function(e){
	//alert(e.latlng);
	$("#Latitude").val(e.latlng.lat);
	$("#Longitude").val(e.latlng.lng);
});

//user right mouse click function
var contextmenu;
map.on('contextmenu', function(e){	
	var rMenuContent = '';
		rMenuContent = '<context-menu>'
			+'<div class="context-menu active" style="top: 0px; left: 0px;" id="contextMenu">'
			+'	<ul class="list_context">'
			+'		<li class="item_context">'
			+'			<button class="btn btn_context1" type="button" onclick="fnInsertCrossroadLatlng('+e.latlng.lat+','+e.latlng.lng+');">이 위치에 교차로 등록</button>'
			+'		</li>'
			+'		<li class="item_context">'
			+'			<button class="btn btn_context2" type="button" onclick="fnMatchingCrossroadLatlng('+e.latlng.lat+','+e.latlng.lng+');">이 위치에 교차로 좌표 매칭</button>'
			+'		</li>'
			+'		<li class="item_context">'
			+'			<button class="btn btn_context3" type="button" onclick="fnCalculationDistance();">거리측정</button>'
			+'		</li>'
			+'		<li class="item_context">'
			+'			<button class="btn btn_context4" type="button">면적측정</button>'
			+'		</li>'
			+'		<li class="item_context">'
			+'			<button class="btn btn_context5" type="button">반경측정</button>'
			+'		</li>'
			+'	</ul>'
			+'</div>'
			+'</context-menu>';
		
	contextmenu = L.popup({offset: [46, 36], autoClose:true, closeButton:false } ).setLatLng(e.latlng).setContent(rMenuContent);
	contextmenu.openOn(map);
});

//close contextmenu
function fnCloseContextmenu(){
	if(contextmenu.isOpen()){
		contextmenu.remove();
	}
}

//call measure plugin
function fnCalculationDistance(){
	fnCloseContextmenu();
	plugin._startMeasuring();
}

//stop measure plugin
function fnStopCalculationDistance(){
	plugin._stopMeasuring();
}

//insert Crossroad with Latlng
function fnInsertCrossroadLatlng(lat,lng){
	var latlng = map.getCenter();
	$("#crossroadLat").val(lat);
	$("#crossroadLng").val(lng);
	
	fnCloseContextmenu();
	
	var rMenuContent = $("#rInsertCrossroadLatlng").html();
	
	var rMenu = L.popup({autoClose:true, closeButton:true, minWidth:340} ).setLatLng(latlng).setContent(rMenuContent).openOn(map);
}
 	

    
//make Leaflet vWorld Map
function fnMakeLeafletMap(lat,lng,zLevel){
	
	//var lat = 36.992232;
	//var lng = 127.112551;
	//var zLevel = 13;
	
	
	map.setView([lat, lng], zLevel);
	
	L.tileLayer(url, {
		maxZoom: 19,
		minZoom: 7,
		attribution : '<a href="http://www.vworld.kr/" target="_blank">vWrold</a>',
		id: 'mapbox/streets-v11'
		//tileSize: 512
		//zoomOffset: -1
	}).addTo(map);

	
	
	//map = new L.Map('map', {center: new L.LatLng(36.992232, 127.112551), zoom: 13}),
    drawnItems = L.featureGroup().addTo(map);
	
	
	
	mgroup.clearLayers();	//클리어
	
	map.addLayer(mgroup);	//map에 layer 생성
	map.addLayer(cgroup);	//circle group;
	
	mgroup.addLayer( marker = new L.marker([lat,lng], {draggable: false, riseOnHover: false}) );		//기본 marker 설정
	
	marker.bindPopup("<h1>[ 평택시 ]</h1>", {autoClose:false, closeButton:false }).openPopup();			//정보 표출	

	marker.on('dragend', function(event) {
	    var position = marker.getLatLng();
		
		fnChangeLatLng(position.lat,position.lng);	//좌표 변경
		
	    /* $("#Latitude").val(position.lat);
	    $("#Longitude").val(position.lng).keyup(); */
	});
	
}

function afterRender(result) {
    return result;
  }

  function afterExport(result) {
    return result;
  }

function fnDownloadMap(caption) {
    var downloadOptions = {
      container: map._container,
      caption: {
        text: caption,
        font: '30px Arial',
        fillStyle: 'black',
        position: [100, 200]
      },
      exclude: ['.leaflet-control-zoom','.easy-button-container' , '.leaflet-control-attribution'],
      format: 'image/png',
      fileName: 'Map.png',
      afterRender: afterRender,
      afterExport: afterExport
    };
    var promise = map.downloadExport(downloadOptions);
    var data = promise.then(function (result) {
      return result;
    });
  }

function fnPrintMap(caption) {
    var printOptions = {
      container: map._container,
      exclude: ['.leaflet-control-zoom','.easy-button-container'],
      format: 'image/png',
      afterRender: afterRender,
      afterExport: afterExport
    };
    printOptions.caption = {
      text: caption,
      font: '30px Arial',
      fillStyle: 'black',
      position: [50, 50]
    };
    var promise = map.printExport(printOptions);
    var data = promise.then(function (result) {
      return result;
    });
  }
      
</script>
</body>
</html>