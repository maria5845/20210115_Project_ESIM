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
    width: 616px;
    height: 40px;
    line-height: 30px;
}
.round_div{
    background-color: #32323d;
    border-radius: 10px;
    padding: 10px;
}

.tree_group .ctq_tree{
	width: 318px;
    height: 190px;
    margin-bottom: 10px;
}
.tree_group .var_tree{
	width: 318px;
    height: 583px;
}
.chart_box{
    height: 500px;
    width: 1508px;
}
.chart_box:not(:last-child){
    margin-bottom: 10px;
}
.chart_box .title{
	height: 10%;
}
.chart_box .chart{
	float: left;
	width: 33%;
	height: 24%;
}
.chart_box.big {
    height: 385px;
    width: 1527px;
}

.tbl td:not(:last-child){
    border-right: 1px solid #515151;
}
.tbl tr:not(:last-child) td{
    border-bottom: 1px solid #515151;
}
.tbl th:not(:last-child) {
    border-right: 1px solid #515151;
}
.tbl th{
    border-bottom: 1px solid #515151;
}
.tbl tr{
    border-bottom: 1px solid #515151;
}
.tbl td{
	max-height: 30px;
}
.mg-b10{
    margin-bottom: 10px;
}
.chart_title {
    height: 20px;
    margin-bottom: 5px;
}
.change{
    height: 120px;
    margin-bottom: 10px;
}
.alarm{
    height: 120px;
    margin-bottom: 10px;
}
.date_wrapper{
	width: 320px;
    height: 80px;
}

.summary {
    width: 106px;
    height: 40px;
    float: left;
    text-align: center;
}
.stitle {
    width: 98%;
    height: 45px;
    background-color: #1D2328;
    vertical-align: middle;
    line-height: 22px;
}
.summary_tbl_wrapper{ 
 	position: relative; 
	top: 36px; 
	overflow-y: scroll; 
	width: 319px; 
	height: 465px; 
} 
.summary_tbl {
    width: 312px;
    height: 300px;
    text-align: center;
    overflow: hidden;
}
.summary_tbl th , .change_tbl th, .alarm_tbl th{
    background-color: #1D2328;
    font-weight: normal;
}
.summary_tbl td.gray{
	background-color: #595959;
}
.summary_tbl td, .sval, .change_tbl td, .alarm_tbl td{
	background-color: #484848;
}
table.alarm_tbl, table.change_tbl  {
	height: 85px;
    text-align: center;
}

.summary_tbl tbody tr:hover td{
	background-color: #6b6b6b;
	cursor:pointer;
}

.highlight {
	background-color: #6b6b6b !important; 
}
.mate_wrapper, .trouble_wrapper{ 
 	overflow-y: scroll; 
 	height: 85px;
} 

.ng_cnt_title {
    position: relative;
    top: 30px;
    left: 180px;
    font-size: 23px;
    color: red;
    font-weight: bold;
}
.ng_cnt {
    position: relative;
    top: 34px;
    font-size: 30px;
    text-align: center;
}

.tooltip {
	position: relative;
	display: inline-block;
    border-top: 1px dotted #484848;
    border-bottom: 1px dotted #484848;
    height: 20px;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 100px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;
  position: absolute;
  z-index: 1;
  bottom: 150%;
  left: 50%;
  margin-left: -60px;
}

.tooltip .tooltiptext::after {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  margin-left: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: black transparent transparent transparent;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
}
</style>

<div class="wrapper">
	<div class="tree_group fl">
		<div class="ctq_tree round_div">
			
			<select id="" name="make_num" class="itx mg-b10"style="width: 100%;" >
				<option value="9" selected>Production Line</option>
	        </select>  
	        
	        <div class="date_wrapper">
		        <span style="width: 47px; display: inline-block;">Start</span>
		        <input name="sdate" id="sdate" class="picker-input date mg-b10">
				<input name="stime" id="stime" class="picker-input time mg-b10">
				
				<span style="width: 47px; display: inline-block;">End</span>
				<input name="edate" id="edate" class="picker-input date mg-b10">
				<input name="etime" id="etime" class="picker-input time mg-b10">
	        </div>
	        
	        <select id="" name="make_num" class="itx mg-b10"style="width: 100%;" >
				<option value="9" selected>Lot ID</option>
	        </select>  
			<div>
				<div style="float: left;width: 100px;">Sample Size<br> Per 1 Group</div>
				<input id="sample_size" type="number" step="100" min="100" style="width: 155px;
				    height: 32px;
				    background-color: #414550;
				    border: none;
				    border-radius: 5px;
				    color: #fff;
				    padding-left: 10px;">
				<button class="btn btn-lg fr" onclick="search();" style="margin-top: 3px;"><span class="k-icon k-i-search"></span></button>
			</div>
		</div>
		<div class="var_tree round_div">
			<div style="height: 20px;padding: 9px;">SUMMARY</div>
			<div class="summary">
				<div class="stitle">Total Input<br> Count</div>
				<div class="sval tot_input_cnt">-</div>
			</div>
			<div class="summary">
				<div class="stitle">Total NG<br>Count</div>
				<div class="sval tot_ng_cnt">-</div>
			</div>
			<div class="summary">
				<div class="stitle">NG Rate<br>(%)</div>
				<div class="sval ng_rate">-</div>
			</div>
			
			<div class="summary_tbl_wrapper">
				<table class="summary_tbl tbl">
					<thead>
						<tr>
							<th>Group No</th>
							<th>NG Rate</th>
							<th>Trouble<br>Count</th>
							<th>Material<br>Supply Count</th>
							<th>Non-<br>Operation<br>Time</th>
						</tr>
					</thead>
					<tbody class="summary_tbody">
						<tr class="no_data">
							<td colspan = '5'> No Data </td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<div class="chart_group fr">
		<div class="chart_box round_div">
			<div style="height: 29px;">
				<select id="chart_type" name="chart_type" class="itx">
	<!-- 			total, rightLeft, box -->
					<option value="total" selected>Total Trend</option>
					<option value="rightLeft">Right Left Trend</option>
					<option value="box">Right Left Box</option>
		        </select>
			</div>
<!-- 			<div class="chart_title">차트 영역 -->
<!-- 				<div id="openbutton" style="float: right;" onclick="ontoggleSize('ctq')"> -->
<!--                     <i class="fa fa-expand" style="font-size: 20px;" aria-hidden="true"></i> -->
<!--                 </div> -->
<!-- 			</div> -->
			<div id="err_chart1" class="chart"></div>
			<div id="err_chart2" class="chart"></div>
			<div id="err_chart3" class="chart"></div>
			<div id="err_chart4" class="chart"></div>
			<div id="err_chart5" class="chart"></div>
			<div id="err_chart6" class="chart"></div>
			<div id="err_chart7" class="chart"></div>
			<div id="err_chart8" class="chart"></div>
			<div id="err_chart9" class="chart"></div>
			<div id="err_chart10" class="chart"></div>
			<div id="err_chart11" class="chart"></div>
			<div id="err_chart12" class="chart">
				<div class="ng_cnt_title"></div><div class="ng_cnt"></div>
			</div>
		</div>
		<div class="round_div change">
			<div class="chart_title">Material Supply Record
<!-- 				<div id="openbutton" style="float: right;" onclick="ontoggleSize('para')"> -->
<!--                     <i class="fa fa-expand" style="font-size: 20px;" aria-hidden="true"></i> -->
<!--                 </div> -->
			</div>
			<div class="mate_wrapper">
				<table class="change_tbl tbl">
					<thead>
						<tr>
							<th>Graph Start</th>
							<th>Graph End</th>
							<th>Event Start</th>
							<th>Event End</th>
							<th>Input Lot ID</th>
							<th>Input Type</th>
							<th>Lot ID</th>
						</tr>
					</thead>
					<tbody class="mate_tbody">
						<tr class="no_data">
							<td colspan = '7'> No Data </td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="round_div alarm">
			<div class="chart_title">Trouble Record</div>
			<div class="trouble_wrapper">
				<table class="alarm_tbl tbl">
					<thead>
						<tr>
							<th>Graph Start</th>
							<th>Graph End</th>
							<th>Event Start</th>
							<th>Event End</th>
							<th>Trouble Name</th>
							<th>Loss Detail</th>
							<th>Delay Time</th>
						</tr>
					</thead>
					<tbody class="trouble_tbody">
						<tr class="no_data">
							<td colspan = '7'> No Data </td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>