<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="dvcListSize" value="${(fn:length(dvcList)/2) + (1 - ((fn:length(dvcList))/2 % 1)) % 1}" />

<style>
.outer{
	height:97vh;
	width:100vw;
}

.load_factor_wrap{
    display: flex;
    flex-wrap: wrap;
	height: calc(100% - 50px);
    width: calc(100% - 30px);
    margin: 10px 10px 0px 10px;
}

.unit{
    flex-grow: 1;
	cursor:pointer;
	border-radius: 15px;
	background-color: #333333;
    width:calc(50% - 20px);
    height:calc(100%/${dvcListSize} - 20px);
/*  max-width: calc(50% - 30px);  */
	margin: 10px 10px;
}

.btn-switch{
/* 	position: absolute; */
/*     left: 20px; */
    top: 5px;
}

.bg-grey{
	background-color: grey !important;
	color : yellow;
}

</style>


<div class="outer switch-view view1 display-none">
	<div class="title fl text-center" style="height: 50px;width: 100%; left:0">
		<span style="font-weight: 600;font-size: 26px;">Load Factor</span>
		<button type="button" id="" class="btn btn-switch btn-default" style="position: absolute; left: 20px; top: 5px;"  onclick="switchView('view2')">
			<i class="fa"></i>Abnormal Unit List
		</button>&nbsp;
		<button type="button" class="" style="position:absolute;right: 60px; top:5px;" onclick="fnExportExcel();">
			<img src="<c:out value='${pageContext.request.contextPath}'/>/resource/img/excel-icon.png" alt="" style="width: 25px;position:absolute;border-radius: 15%;opacity: 90%;">
		</button>
	</div>

	<div class="load_factor_wrap fl" >
	<c:forEach var="i" items="${dvcList}" varStatus="idx">
		<div class="fl unit"  onclick="fnUnitDetail(${idx.index+1})">
			<div class="text-center chart_title${idx.index+1}" style="width: 100%; height: 28px; margin-top: 8px; font-size: 20px; font-weight: 600;"></div>
			<div id="unit_${idx.index+1}_chart" class="unit_chart" style="margin: 0 15px 0 15px;"></div>
		</div>
	</c:forEach>
	</div>
</div>

<div class="outer switch-view view2 display-none display-block">
	<div class="title fl text-center" style="height: 50px;width: 99%;">
		<button type="button" id="" class="btn btn-switch btn-default" style="float:left;" onclick="fnUnitDetail(1);">
			<i class="fa"></i>Overall Graph
		</button>
		<span style="font-weight:600; font-size:26px; position:fixed; left:calc(50% - 110px);">Abnormal Unit List</span>
		
        <button type="button" id="reset_date" class="btn btn-switch btn-default fr" style="height:20px; position:relative; margin-right:25px;" onclick="fnOpenResetHistModal();"> </button>
		<button type="button" class="btn btn-medium btn-excel fr" style="position:relative; margin:5px; height:31px;" onclick="fnGridExportExcel();"> Excel Export</button>
	</div>

	<div class="load_factor_wrap fl" style="height:calc(100% - 100px);" >
		<div class="fl l-kendo-wrap override"  style="width: 100%; height:100%; margin-left:10px; border-radius:15px; background-color: #32323d;">
			<!-- 알람 테이블 -->
			<div class="fr "style="border-radius: 0px 0px 15px 15px; height:100%; overflow: hidden;">
				<div id="grid" style=""></div>
			</div>
		</div>
	</div>
	
	<div class="fl text-center" style="height: 50px;width: 100%; left:0">
      <button type="button" id="" class="btn btn-default" onclick="doReset()"
      		  style="position: fixed; right: 20px; margin-top: 10px;">
	  	<i class="fa"></i>Reset
	  </button>
	</div>
</div>

