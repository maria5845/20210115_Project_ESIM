<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<jsp:include page='../../../../resource/css/web/chartCss.jsp' flush="false"/>

<div class="wrapper">
	<div>
		<div id="set_bar" class="panel">
			<input name="sdate" id="sdate" class="picker-input date">
			<input name="stime" id="stime" class="picker-input time">
			<span>~</span>
			<input name="edate" id="edate" class="picker-input date">
			<input name="etime" id="etime" class="picker-input time">
	
			<button class="btn btn-lg" onclick="search();"><span class="k-icon k-i-search"></span>Search</button>
		</div>
	</div>
	<div class="contents">
		<div class="tree panel">
		</div>
		<div class="box sub3">
			<div>
				<div>
					<p>RMS Monitoring</p>
					<button class="downCh btn btn-excel" onclick="fnExportExcel('Rms');">Export Data</button>
					<button class="btn btn-add2" onclick="getChartImg('RMS')">Chart Save</button>
				</div>
				<div id="chart1" class="chart-wrap panel"></div><span id="no_crt1"></span>
				<div>
					<p>PEAK Monitoring</p>
					<button class="downCh btn btn-excel" onclick="fnExportExcel('MinPlusMax');">Export Data</button>
					<button class="btn btn-add2" onclick="getChartImg('PEAK')">Chart Save</button>
				</div>
				<div id="chart2" class="chart-wrap panel"></div><span id="no_crt2"></span>
			</div>
		</div>
	</div>
</div>

<script id="radio-treeview" type="text/kendo-ui-template">
	# if (!item.items) { #
		<input type="radio" name="radio_c" style="margin-right: 15%;" />
	# } #
	#: item.dvc_id #
</script>