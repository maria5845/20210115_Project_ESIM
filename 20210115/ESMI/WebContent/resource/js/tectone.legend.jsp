<%@ page language="java" contentType="text/javascript; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="rootPath" value="${pageContext.request.contextPath}" scope="application"/>
<c:set var="userSession" value="${sessionScope.userSession}" scope="session"/>


var legendJson = {
	factory: {
		TEMP: {
			unitTxt: '℃',
			baseLine: [-5, 14, 28, 35], // 반도넛(게이지차트) 
			zmin: -5, // 컨투어 min
			zmax: 35, // 컨투어 max
			colorscale: [
				[0,'#213e71'], // 파랑
				[0.475,'#213e71'],
				
				[0.5,'#9fc586'], // 초록
				[0.55,'#9fc586'],
				
				[0.575,'#f0cc60'], // 노랑
				[0.675,'#f0cc60'],
				
				[0.7,'#df9062'], // 주황
				[0.8,'#df9062'],
				
				[0.825,'#f00000'], // 빨강
				[1,'#f00000']
				]
		},
		HUMI: {
			unitTxt: '%',
			baseLine: [0, 30, 70, 100], // 반도넛(게이지차트) 
			zmin: 0, // 컨투어 min
			zmax: 100, // 컨투어 max
			colorscale: [
				[0,'#e4e54a'], // 노랑
				[0.3,'#e4e54a'],
				
				[0.31,'#41b98a'], // 연초
				[0.45,'#41b98a'],
				
				[0.46,'#3fb9ad'], // 밝초
				[0.55,'#3fb9ad'],
				
				[0.56,'#3570b9'], // 파랑
				[0.69,'#3570b9'],
				
				[0.70,'#6c57a0'], // 보라
				[1,'#6c57a0']
				]
		},
		PARTICLE05: {
			unitTxt: 'ea',
			baseLine: [0, 10000, 12000], // 반도넛(게이지차트) 
			zmin: 0, // 컨투어 min
			zmax: 12000, // 컨투어 max
			colorscale: [
				[0,'#213e71'], // 파랑
				[0.0083,'#213e71'],
				
				[0.0084,'#9fc586'], // 초록
				[0.416583,'#9fc586'],
				
				[0.416666,'#f0cc60'], // 노랑
				[0.83325,'#f0cc60'],
				
				[0.833333,'#f00000'], // 빨강
				[1,'#f00000']
				]
		},
	},
	ice: {
		TEMP: {
			unitTxt: '℃',
			baseLine: [-30, -5, 5], // 반도넛(게이지차트) 
			zmin: -30, // 컨투어 min
			zmax: 5, // 컨투어 max
			colorscale: [
				[0,'#213e71'], // 파랑
				[0.28571,'#213e71'],
				
				[0.31429,'#9fc586'], // 초록
				[0.57143,'#9fc586'],
				
				[0.6,'#f0cc60'], // 노랑
				[0.82857,'#f0cc60'],
				
				[0.85714,'#f00000'], // 빨강
				[1,'#f00000']
				]
		},
		HUMI: {
			unitTxt: '%',
			baseLine: [0, 30, 70, 100], // 반도넛(게이지차트) 
			zmin: 0, // 컨투어 min
			zmax: 100, // 컨투어 max
			colorscale: [
				[0,'#e4e54a'], // 노랑
				[0.3,'#e4e54a'],
				
				[0.31,'#41b98a'], // 연초
				[0.55,'#41b98a'],
				
				[0.56,'#3570b9'], // 파랑
				[0.69,'#3570b9'],
				
				[0.70,'#6c57a0'], // 보라
				[1,'#6c57a0']
				]
		},
		PARTICLE05: {
			unitTxt: 'ea',
			baseLine: [0, 10000], // 반도넛(게이지차트) 
			zmin: 0, // 컨투어 min
			zmax: 10000, // 컨투어 max
			colorscale: [
				[0,'#213e71'], // 파랑3669CF
				[0.01,'#213e71'],
				
				[0.20,'#5cff05'], // 초록
				[0.21,'#5cff05'],
				
				[0.40,'#9fc586'], // 초록
				[0.41,'#9fc586'],
				
				[0.60,'#f0cc60'], // 노랑
				[0.61,'#f0cc60'],
				
				[0.80,'#ef6e04'], // 주황
				[0.81,'#ef6e04'],
				
				[0.99,'#f00000'], // 빨강
				[1,'#f00000']
				]
		},
	},
};