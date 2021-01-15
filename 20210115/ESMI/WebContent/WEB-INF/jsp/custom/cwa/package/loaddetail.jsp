<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
.outer{
	height:97vh;
	width: calc(100vw - 80px);
	padding: 10px 40px;
}
.chart_title{
	width: 100%; 
	height: 34px;
	margin-top: 8px;
	font-size: 26px;
	font-weight: 600;
}
.chart_title .right-btn, .chart_title .left-btn{
	cursor:pointer;
}
.k-grid-content
{
   overflow-x: hidden;
}
</style>


<div class="outer" >
	<div class="" style="height: 40px; width:100%;">
		<!-- 검색 조건 -->
		<div class="fl" style="margin-top: 7px;vertical-align: sub;font-size: 17px;font-weight: bold;">
			<button type="button" id="btn-goback" class="btn btn-default" onclick="fnGoBack();">
				<i class="fa fa-arrow-circle-left"></i>&nbsp; 뒤로가기
			</button>&nbsp;
		</div>
		<!-- 
			조회 버튼 / 엑셀 다운로드 버튼(클릭 시 엑셀 다운이 아니라, Grid 형태의 데이터를 조회할 수 있는 화면으로 이동.)
		 -->
	</div>
	
	<!-- 차트 1 -->
	<div class="fl text-center" style="width:100%; height: calc(50% - 40px); border-radius: 15px; background-color: #333333;">
		<div class="fl chart_main"  style="width:100%; height:100%;">
			<div class="text-center main_chart_title chart_title">
				<label class="left-btn" style="padding: 0 30px;"> <i class="fa fa-caret-left"></i></label> 
				<span class="main_title"></span> 
				<label class="right-btn"  style="padding: 0 30px;"> <i class="fa fa-caret-right"></i></label>
				<button type="button" class="" style="position:absolute;left: 1843px;" onclick="fnExportExcel();">
					<img src="<c:out value='${pageContext.request.contextPath}'/>/resource/img/excel-icon.png" alt="" style="width: 23px;position:absolute;border-radius: 15%;opacity: 90%;top: 5px;">
				</button>
			</div>
			<div id="mainChart" class="unit_chart"></div>
		</div>
	</div>
	
	<!-- 차트 2 /3 -->
	<div class="fl text-center" style= "width:100%; height: calc(50% - 20px); margin-top: 20px;">
		<div class="fl chart_detail" style="width:calc(100% - 690px); height:100%; border-radius: 15px; background-color: #333333;">
			<div class="text-center sub_chart_title chart_title" style="height:20px;font-size: 22px; text-align: center;">
				<div>
					<label class="left-btn" style="padding: 0 30px;visibility: hidden;"> <i class="fa fa-caret-left"></i></label> 
					<span id="subTitle1" style="margin-right: 20px;"></span>
					<label class="right-btn"  style="padding: 0 30px;visibility: hidden;"> <i class="fa fa-caret-right"></i></label>
					
					<div class="dateBox fr" style="visibility: hidden;margin-right: 10px;">
						<input name="sdate" id="sdate" style="width:120px;" />
						~
						<input name="edate" id="edate" style="width:120px;" />
						<button type="button" class="btn btn-lg" onclick="fnSubLeftLoad();">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</div>
			<div id="subChart1" class="unit_chart">
			</div>
		</div>
		<div class="fl alarm_list l-kendo-wrap override"  style="width: 670px; height: 100%; margin-left: 20px;border-radius:15px; background-color: #32323d;">
			<div style="height: 38px;margin-top: 8px;">
				<label class="left-btn" style="padding: 0 30px; visibility:hidden;"> <i class="fa fa-caret-left"></i></label> 
				<span class="text-center chart_title" id="subTitle2" style=""></span>
				<label class="right-btn"  style="padding: 0 30px; visibility:hidden;"> <i class="fa fa-caret-right"></i></label>
			</div>
			<!-- 알람 테이블 -->
			<div class="fr alarm_tbl"style="width: 668px; height:calc(100% - 46px); border-radius: 0px 0px 15px 15px; overflow: hidden;">
				<div id="grid" style="height:100%;"></div>
			</div>
		</div>
	</div>

	
</div>
