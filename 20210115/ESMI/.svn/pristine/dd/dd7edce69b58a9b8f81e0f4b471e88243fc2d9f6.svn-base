<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
.wrapper {
    padding: 10px 20px;
}
#set_bar{
    width: 790px;
    height: 40px;
    line-height: 30px;
}
.round_div{
    background-color: #32323d;
    border-radius: 10px;
    padding: 10px;
}
.tree_group{
}
.tree_group .ctq_tree{
	width: 318px;
    height: 200px;
    margin-bottom: 10px;
}
.tree_group .var_tree{
	width: 318px;
    height: 585px;
}
.chart_box{
    height: 235px;
    width: 1527px;
}
.chart_box:not(:last-child){
    margin-bottom: 10px;
}
.chart_box .title{
	height: 10%;
}
.chart_box .chart{
	width: 100%;
	height: 90%;
}
.chart_box.big {
    height: 385px;
    width: 1527px;
}
.tooltip {
	position: relative;
	display: inline-block;
    border: 0 none;
    border-radius: 4px 4px 4px 4px;
    background: rgba(0, 0, 0, 0.8);
    color : white;
    padding: 20px;
    text-align: center;
    max-height: 157px;
    overflow-y: scroll;
    position: absolute;
	z-index: 1;
}
.close-pop {
    position: absolute;
    right: 0;
    top: 0;
    background-image: url(../../resource/img/btn-close-pop.png);
    background-repeat: no-repeat;
    background-position: 50%;
    width: 20px;
    height: 20px;
    overflow: hidden;
    text-indent: -3721em;
}
</style>

<div class="wrapper">
	<div style="width:1877px; height: 40px;">
		<div id="set_bar" class="fr">
<%-- 			<input  class="lot_id" value="${bean.lot_id }" <c:out value="${bean.lot_id }"/> /> --%>
		
			<input name="sdate" id="sdate" class="picker-input date">
			<input name="stime" id="stime" class="picker-input time">
			<span>~</span>
			<input name="edate" id="edate" class="picker-input date">
			<input name="etime" id="etime" class="picker-input time">
			
			<input id="lot_id" name="lot_id" value="${bean.lot_id}" <c:out value="${bean.lot_id }"/> />
			<script id="noDataTemplate" type="text/x-kendo-template">
				<strong>No Data</strong>
			</script>
			<button type="button" class="btn btn-srch" id="kendoSearchBtn" 
    					onclick="search();"
    					style="position:static;">
    					<spring:message code="BUTTON.SEARCH" text="조회" /></button>
<!-- 			<button class="btn btn-lg" onclick="search();"><span class="k-icon k-i-search"></span> 조회</button> -->
		</div>
	</div>
	<div class="tree_group fl">
		<div class="ctq_tree round_div"></div>
		<div class="var_tree round_div"></div>
	</div>
	
	<div class="chart_group fr">
		<div class="chart_box round_div ctq">
			<div class="chart_title">CTQ ZONE
				<button type="button" class="btn btn-excel btn-medium" onclick="fnCreateExcel('ctq');">
					<spring:message code='BUTTON.EXPORTCSV' text='CSV 다운로드' />
				</button>
				<div id="openbutton" style="float: right;" onclick="ontoggleSize('ctq')">
                    <i class="fa fa-expand" style="font-size: 20px;" aria-hidden="true"></i>
                </div>
			</div>
			<div id="chart1" class="chart"></div>
		</div>
		<div class="chart_box round_div para">
			<div class="chart_title">PARA ZONE
				<button type="button" class="btn btn-excel btn-medium" onclick="fnCreateExcel('raw');">
					<spring:message code='BUTTON.EXPORTCSV' text='CSV 다운로드' />
				</button>
				<div id="openbutton" style="float: right;" onclick="ontoggleSize('para')">
                    <i class="fa fa-expand" style="font-size: 20px;" aria-hidden="true"></i>
                </div>
			</div>
			<div id="chart2" class="chart"></div>
		</div>
		<div class="chart_box round_div alarm">
			<div class="chart_title alarm">TROUBLE ZONE</div>
			<div id="chart3" class="chart"></div>
		</div>
	</div>
</div>