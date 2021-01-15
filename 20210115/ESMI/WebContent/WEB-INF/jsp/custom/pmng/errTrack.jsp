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
.round_div{
    background-color: #32323d;
    border-radius: 10px;
    padding: 10px;
}
.ctq_tbl td:not(:last-child){
    border-right: 1px solid #515151;
}
.ctq_tbl tr:not(:last-child) td{
    border-bottom: 1px solid #515151;
}
.ctq_tbl th:not(:last-child) {
    border-right: 1px solid #515151;
}
.ctq_tbl th{
    border-bottom: 1px solid #515151;
}
.ctq_tbl{
	width: 1835px;
    height: 223px;
    font-size: 11px !important;
    float: left;
    position: relative;
    top: 2px;
    left: 10px;
    text-align: center;
}
.ctq_tbl tr{
	height: 15px;
}
.ctq_tbl th {
    background-color: #1D2328;
    font-weight: normal;
}
.ctq_tbl td.gray{
	background-color: #595959;
}
.ctq_tbl td{
	background-color: #484848;
}

#set_bar{
    width: 940px;
    height: 40px;
    line-height: 30px;
}
.grid-wrapper{
	width: 1860px;
	height: 250px;
    margin-bottom: 10px;
}
.img_box{
	float: right;
    width: 295px;
    height: 213px;
    text-align: center;
    background-color: #43434d;
    margin: 8px 8px 8px 0;
    border-radius: 13px;
}
.grid{
    float: left;
    width: 1595px;
    height: 213px;
    background-color: #43434d;
    border-radius: 13px;
    margin: 8px;
}
.chart_group{
	width: 1860px;
	height: 500px;
}
.chart_group .chart_box{
	width: 33%;
	height: 32%;
	float: left;
}
.chart_box .popup {
/* span:first-child */
	float: right;
    position: relative;
        top: 11px;
    right: 55px;
    z-index: 10;
    color: #b4b2b3;
    cursor:pointer;
}
.chart_box .excel{
/* span:nth-child(2)  */
	float: right;
    position: relative;
    top: 10px;
    right: 14px;
    z-index: 10;
    color: #b4b2b3;
    cursor:pointer;
}
.chart_group .po_chart{
	width: 100%;
	height: 100%;
    top: -16px;
}
.ptitle {
    font-size: 20px;
    text-align: center;
    height: 25px;
}
.subtitle {
    font-size: 19px;
    text-align: center;
    color: #b9b7b7;
}
</style>

<div class="wrapper">
	<div style="width:1877px; height: 40px;">
		<select id="chart_type" name="chart_type" class="itx">
			<option value="actual" selected>Actual</option>
			<option value="normalized">Normalized</option>
        </select>
        
		<div id="set_bar" class="fr">
			
			<select id="make_num" name="make_num" class="itx">
				<option value="1">1X1</option>
				<option value="2">2X1</option>
				<option value="4" selected>2X2</option>
				<option value="6">3X2</option>
				<option value="9">3X3</option>
	        </select>
			
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
			
<!-- 			<button class="btn btn-lg" onclick="search();"><span class="k-icon k-i-search"></span></button> -->
		</div>
	</div>

	<div class="content">
		<div class="grid-wrapper round_div">
<!-- 			<div id="grid"></div> -->
			<div class="ptitle">
				Position Quality Table 
				<button type="button" class="btn btn-small fr" style="height: 15px !important;"
					onclick="ClPopup.fnOnClickModalOpen('/pmng/guideImg.do', '', 850)">Inspection Item
				</button>
			</div>
			
			<table class="ctq_tbl">
				<thead>
					<tr>
						<th rowspan="3" colspan="2">Index<br>Item</th>
						<th colspan="7">Vision(U)</th>
						<th colspan="14">Vision(L)</th>
					</tr>
					<tr>
						<th colspan="5">X</th>
						<th colspan="2">Y</th>
						<th colspan="7">X</th>
						<th colspan="7">Y</th>
					</tr>
					<tr>
						<th>A1U</th>
						<th>A2U</th>
						<th>A3U</th>
						<th>A4U</th>
						<th>TSU</th>
						<th>A5U</th>
						<th>A6U</th>
						<th>A1L</th>
						<th>A2L</th>
						<th>A3L</th>
						<th>A4L</th>
						<th>TS</th>
						<th>TW_I</th>
						<th>TW</th>
						<th>A5L</th>
						<th>A6L</th>
						<th>TH</th>
						<th>SM1</th>
						<th>SM2</th>
						<th>SM3</th>
						<th>SM4</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th rowspan="3">Spec</th>
						<th>LSL</th>
						<td class="ctq_list lsl A1U  var_id Lower_Limit_of_A1_Dimension_Upper_Vision"></td> 
						<td class="ctq_list lsl A2U  var_id Lower_Limit_of_A2_Dimension_Upper_Vision"></td> 
						<td class="ctq_list lsl A3U  var_id Lower_Limit_of_A3_Dimension_Upper_Vision"></td> 
						<td class="ctq_list lsl A4U  var_id Lower_Limit_of_A4_Dimension_Upper_Vision"></td> 
						<td class="ctq_list lsl TS_U var_id Lower_Limit_of_Tab_Side"></td>          
						<td class="ctq_list lsl A5U  var_id Lower_Limit_of_A5_Dimension_Upper_Vision"></td> 
						<td class="ctq_list lsl A6U  var_id Lower_Limit_of_A6_Dimension_Upper_Vision"></td> 
						<td class="ctq_list lsl A1L  var_id Lower_Limit_of_A1_Dimension_Lower_Vision"></td> 
						<td class="ctq_list lsl A2L  var_id Lower_Limit_of_A2_Dimension_Lower_Vision"></td> 
						<td class="ctq_list lsl A3L  var_id Lower_Limit_of_A3_Dimension_Lower_Vision"></td> 
						<td class="ctq_list lsl A4L  var_id Lower_Limit_of_A4_Dimension_Lower_Vision"></td> 
						<td class="ctq_list lsl TS_U var_id Lower_Limit_of_Tab_Side"></td>         
						<td class="ctq_list lsl TW_I var_id Lower_Limit_of_Tab_Width_Anode"></td>  
						<td class="ctq_list lsl TW   var_id Lower_Limit_of_Tab_Width_Cathode"></td> 
						<td class="ctq_list lsl A5L  var_id Lower_Limit_of_A5_Dimension_Lower_Vision"></td> 
						<td class="ctq_list lsl A6L  var_id Lower_Limit_of_A6_Dimension_Lower_Vision"></td> 
						<td class="ctq_list lsl TH_A var_id Lower_Limit_of_Tab_Height"></td>        
						<td class="ctq_list lsl SM1  var_id Lower_Limit_of_Sepa_MissMatch"></td>    
						<td class="ctq_list lsl SM2  var_id Lower_Limit_of_Sepa_MissMatch"></td>    
						<td class="ctq_list lsl SM3  var_id Lower_Limit_of_Sepa_MissMatch"></td>    
						<td class="ctq_list lsl SM4  var_id Lower_Limit_of_Sepa_MissMatch"></td>    
					</tr>
					<tr>
						<th>Target</th>
						<td class="ctq_list target A1U"></td>
						<td class="ctq_list target A2U"></td>
						<td class="ctq_list target A3U"></td>
						<td class="ctq_list target A4U"></td>
						<td class="ctq_list target TS_U"></td>
						<td class="ctq_list target A5U"></td>
						<td class="ctq_list target A6U"></td>
						<td class="ctq_list target A1L"></td>
						<td class="ctq_list target A2L"></td>
						<td class="ctq_list target A3L"></td>
						<td class="ctq_list target A4L"></td>
						<td class="ctq_list target TS_U"></td>
						<td class="ctq_list target TW_I"></td>
						<td class="ctq_list target TW"></td>
						<td class="ctq_list target A5L"></td>
						<td class="ctq_list target A6L"></td>
						<td class="ctq_list target TH_A"></td>
						<td class="ctq_list target SM1"></td>
						<td class="ctq_list target SM2"></td>
						<td class="ctq_list target SM3"></td>
						<td class="ctq_list target SM4"></td>
					</tr>
					<tr>
						<th>USL</th>
						<td class="ctq_list usl A1U  var_id Upper_Limit_of_A1_Dimension_Upper_Vision"></td> 
						<td class="ctq_list usl A2U  var_id Upper_Limit_of_A2_Dimension_Upper_Vision"></td> 
						<td class="ctq_list usl A3U  var_id Upper_Limit_of_A3_Dimension_Upper_Vision"></td> 
						<td class="ctq_list usl A4U  var_id Upper_Limit_of_A4_Dimension_Upper_Vision"></td> 
						<td class="ctq_list usl TS_U var_id Upper_Limit_of_Tab_Side"></td>          
						<td class="ctq_list usl A5U  var_id Upper_Limit_of_A5_Dimension_Upper_Vision"></td> 
						<td class="ctq_list usl A6U  var_id Upper_Limit_of_A6_Dimension_Upper_Vision"></td> 
						<td class="ctq_list usl A1L  var_id Upper_Limit_of_A1_Dimension_Lower_Vision"></td> 
						<td class="ctq_list usl A2L  var_id Upper_Limit_of_A2_Dimension_Lower_Vision"></td> 
						<td class="ctq_list usl A3L  var_id Upper_Limit_of_A3_Dimension_Lower_Vision"></td> 
						<td class="ctq_list usl A4L  var_id Upper_Limit_of_A4_Dimension_Lower_Vision"></td> 
						<td class="ctq_list usl TS_U var_id Upper_Limit_of_Tab_Side"></td>         
						<td class="ctq_list usl TW_I var_id Upper_Limit_of_Tab_Width_Anode"></td>  
						<td class="ctq_list usl TW   var_id Upper_Limit_of_Tab_Width_Cathode"></td>
						<td class="ctq_list usl A5L  var_id Upper_Limit_of_A5_Dimension_Lower_Vision"></td> 
						<td class="ctq_list usl A6L  var_id Upper_Limit_of_A6_Dimension_Lower_Vision"></td> 
						<td class="ctq_list usl TH_A var_id Upper_Limit_of_Tab_Height"></td>       
						<td class="ctq_list usl SM1  var_id Upper_Limit_of_Sepa_MissMatch"></td>   
						<td class="ctq_list usl SM2  var_id Upper_Limit_of_Sepa_MissMatch"></td>   
						<td class="ctq_list usl SM3  var_id Upper_Limit_of_Sepa_MissMatch"></td>   
						<td class="ctq_list usl SM4  var_id Upper_Limit_of_Sepa_MissMatch"></td>   
					</tr>
					<tr>
						<th rowspan="8">Quality<br>Index</th>
						<th>NG Count</th>
						<td class="ctq_list ng_cnt A1U"></td>
						<td class="ctq_list ng_cnt A2U"></td>
						<td class="ctq_list ng_cnt A3U"></td>
						<td class="ctq_list ng_cnt A4U"></td>
						<td class="ctq_list ng_cnt TS_U"></td>
						<td class="ctq_list ng_cnt A5U"></td>
						<td class="ctq_list ng_cnt A6U"></td>
						<td class="ctq_list ng_cnt A1L"></td>
						<td class="ctq_list ng_cnt A2L"></td>
						<td class="ctq_list ng_cnt A3L"></td>
						<td class="ctq_list ng_cnt A4L"></td>
						<td class="ctq_list ng_cnt TS_U"></td>
						<td class="ctq_list ng_cnt TW_I"></td>
						<td class="ctq_list ng_cnt TW"></td>
						<td class="ctq_list ng_cnt A5L"></td>
						<td class="ctq_list ng_cnt A6L"></td>
						<td class="ctq_list ng_cnt TH_A"></td>
						<td class="ctq_list ng_cnt SM1"></td>
						<td class="ctq_list ng_cnt SM2"></td>
						<td class="ctq_list ng_cnt SM3"></td>
						<td class="ctq_list ng_cnt SM4"></td>
					</tr>
					<tr>
						<th>NG Rate(%)</th>
						<td class="ctq_list ng_rate A1U"></td>
						<td class="ctq_list ng_rate A2U"></td>
						<td class="ctq_list ng_rate A3U"></td>
						<td class="ctq_list ng_rate A4U"></td>
						<td class="ctq_list ng_rate TS_U"></td>
						<td class="ctq_list ng_rate A5U"></td>
						<td class="ctq_list ng_rate A6U"></td>
						<td class="ctq_list ng_rate A1L"></td>
						<td class="ctq_list ng_rate A2L"></td>
						<td class="ctq_list ng_rate A3L"></td>
						<td class="ctq_list ng_rate A4L"></td>
						<td class="ctq_list ng_rate TS_U"></td>
						<td class="ctq_list ng_rate TW_I"></td>
						<td class="ctq_list ng_rate TW"></td>
						<td class="ctq_list ng_rate A5L"></td>
						<td class="ctq_list ng_rate A6L"></td>
						<td class="ctq_list ng_rate TH_A"></td>
						<td class="ctq_list ng_rate SM1"></td>
						<td class="ctq_list ng_rate SM2"></td>
						<td class="ctq_list ng_rate SM3"></td>
						<td class="ctq_list ng_rate SM4"></td>
					</tr>
					<tr>
						<th>Proportion(%)</th>
						<td class="ctq_list proportion A1U"></td>
						<td class="ctq_list proportion A2U"></td>
						<td class="ctq_list proportion A3U"></td>
						<td class="ctq_list proportion A4U"></td>
						<td class="ctq_list proportion TS_U"></td>
						<td class="ctq_list proportion A5U"></td>
						<td class="ctq_list proportion A6U"></td>
						<td class="ctq_list proportion A1L"></td>
						<td class="ctq_list proportion A2L"></td>
						<td class="ctq_list proportion A3L"></td>
						<td class="ctq_list proportion A4L"></td>
						<td class="ctq_list proportion TS_U"></td>
						<td class="ctq_list proportion TW_I"></td>
						<td class="ctq_list proportion TW"></td>
						<td class="ctq_list proportion A5L"></td>
						<td class="ctq_list proportion A6L"></td>
						<td class="ctq_list proportion TH_A"></td>
						<td class="ctq_list proportion SM1"></td>
						<td class="ctq_list proportion SM2"></td>
						<td class="ctq_list proportion SM3"></td>
						<td class="ctq_list proportion SM4"></td>
					</tr>
					<tr>
						<th>Min</th>
						<td class="ctq_list min A1U"></td>
						<td class="ctq_list min A2U"></td>
						<td class="ctq_list min A3U"></td>
						<td class="ctq_list min A4U"></td>
						<td class="ctq_list min TS_U"></td>
						<td class="ctq_list min A5U"></td>
						<td class="ctq_list min A6U"></td>
						<td class="ctq_list min A1L"></td>
						<td class="ctq_list min A2L"></td>
						<td class="ctq_list min A3L"></td>
						<td class="ctq_list min A4L"></td>
						<td class="ctq_list min TS_U"></td>
						<td class="ctq_list min TW_I"></td>
						<td class="ctq_list min TW"></td>
						<td class="ctq_list min A5L"></td>
						<td class="ctq_list min A6L"></td>
						<td class="ctq_list min TH_A"></td>
						<td class="ctq_list min SM1"></td>
						<td class="ctq_list min SM2"></td>
						<td class="ctq_list min SM3"></td>
						<td class="ctq_list min SM4"></td>
					</tr>
					<tr>
						<th>Mean</th>
						<td class="ctq_list mean A1U"></td>
						<td class="ctq_list mean A2U"></td>
						<td class="ctq_list mean A3U"></td>
						<td class="ctq_list mean A4U"></td>
						<td class="ctq_list mean TS_U"></td>
						<td class="ctq_list mean A5U"></td>
						<td class="ctq_list mean A6U"></td>
						<td class="ctq_list mean A1L"></td>
						<td class="ctq_list mean A2L"></td>
						<td class="ctq_list mean A3L"></td>
						<td class="ctq_list mean A4L"></td>
						<td class="ctq_list mean TS_U"></td>
						<td class="ctq_list mean TW_I"></td>
						<td class="ctq_list mean TW"></td>
						<td class="ctq_list mean A5L"></td>
						<td class="ctq_list mean A6L"></td>
						<td class="ctq_list mean TH_A"></td>
						<td class="ctq_list mean SM1"></td>
						<td class="ctq_list mean SM2"></td>
						<td class="ctq_list mean SM3"></td>
						<td class="ctq_list mean SM4"></td>
					</tr>
					<tr>
						<th>Max</th>
						<td class="ctq_list max A1U"></td>
						<td class="ctq_list max A2U"></td>
						<td class="ctq_list max A3U"></td>
						<td class="ctq_list max A4U"></td>
						<td class="ctq_list max TS_U"></td>
						<td class="ctq_list max A5U"></td>
						<td class="ctq_list max A6U"></td>
						<td class="ctq_list max A1L"></td>
						<td class="ctq_list max A2L"></td>
						<td class="ctq_list max A3L"></td>
						<td class="ctq_list max A4L"></td>
						<td class="ctq_list max TS_U"></td>
						<td class="ctq_list max TW_I"></td>
						<td class="ctq_list max TW"></td>
						<td class="ctq_list max A5L"></td>
						<td class="ctq_list max A6L"></td>
						<td class="ctq_list max TH_A"></td>
						<td class="ctq_list max SM1"></td>
						<td class="ctq_list max SM2"></td>
						<td class="ctq_list max SM3"></td>
						<td class="ctq_list max SM4"></td>
					</tr>
					<tr>
						<th>STD</th>
						<td class="ctq_list std A1U"></td>
						<td class="ctq_list std A2U"></td>
						<td class="ctq_list std A3U"></td>
						<td class="ctq_list std A4U"></td>
						<td class="ctq_list std TS_U"></td>
						<td class="ctq_list std A5U"></td>
						<td class="ctq_list std A6U"></td>
						<td class="ctq_list std A1L"></td>
						<td class="ctq_list std A2L"></td>
						<td class="ctq_list std A3L"></td>
						<td class="ctq_list std A4L"></td>
						<td class="ctq_list std TS_U"></td>
						<td class="ctq_list std TW_I"></td>
						<td class="ctq_list std TW"></td>
						<td class="ctq_list std A5L"></td>
						<td class="ctq_list std A6L"></td>
						<td class="ctq_list std TH_A"></td>
						<td class="ctq_list std SM1"></td>
						<td class="ctq_list std SM2"></td>
						<td class="ctq_list std SM3"></td>
						<td class="ctq_list std SM4"></td>
					</tr>
					<tr>
						<th>Cpk</th>
						<td class="ctq_list cpk A1U"></td>
						<td class="ctq_list cpk A2U"></td>
						<td class="ctq_list cpk A3U"></td>
						<td class="ctq_list cpk A4U"></td>
						<td class="ctq_list cpk TS_U"></td>
						<td class="ctq_list cpk A5U"></td>
						<td class="ctq_list cpk A6U"></td>
						<td class="ctq_list cpk A1L"></td>
						<td class="ctq_list cpk A2L"></td>
						<td class="ctq_list cpk A3L"></td>
						<td class="ctq_list cpk A4L"></td>
						<td class="ctq_list cpk TS_U"></td>
						<td class="ctq_list cpk TW_I"></td>
						<td class="ctq_list cpk TW"></td>
						<td class="ctq_list cpk A5L"></td>
						<td class="ctq_list cpk A6L"></td>
						<td class="ctq_list cpk TH_A"></td>
						<td class="ctq_list cpk SM1"></td>
						<td class="ctq_list cpk SM2"></td>
						<td class="ctq_list cpk SM3"></td>
						<td class="ctq_list cpk SM4"></td>
					</tr>
				</tbody>
			</table>
<!-- 			<div class="img_box"> -->
<%-- 				<c:if test="${unit.cd_val eq 'A'}"> --%>
<!-- 					<img alt="Vision image" style="margin-top: 17px;height: 180px;" -->
<%-- 					 src="${rootPath}/resource/img/bts/cmi/lami/cmi_lami_a.png"> --%>
<%-- 				</c:if> --%>
<%-- 				<c:if test="${unit.cd_val eq 'C'}"> --%>
<!-- 					<img alt="Vision image" style="margin-top: 17px;height: 180px;" -->
<%-- 					 src="${rootPath}/resource/img/bts/cmi/lami/cmi_lami_c.png"> --%>
<%-- 				 </c:if> --%>
<!-- 			</div> -->
		</div>
		<div class="chart_group round_div">
			<div class="ptitle">
				
				Position Vision Trend
<!-- 				<button type="button" class="btn btn-small btn-x90 fr" onclick="javascript:fnSetVariable();"> -->
<%--  					<spring:message code="BUTTON.SAVE" text="저장" /> --%>
<!-- 					Setting Tab -->
<!-- 				</button> -->
			</div>
			<div style="width: 100%; height: calc(100% - 30px);">
			
				
				
				<div class="chart_box1 chart_box">
<!-- 					<span onclick="fnCreateExcel(chartParamJsn[0].var_arr)"> -->
<!-- 						<i class="fa fa-file-excel-o" style="font-size: 20px;" aria-hidden="true"></i> -->
<!-- 					</span> -->
					<span class="popup" onclick="javascript:ClPopup.fnOnClickModalOpen('/pmng/errTrackCtqModal.do', 'id=1&var_arr='+chartParamJsn[0].var_arr, 520)">
						<i class="fa fa-plus" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<span class="excel" onclick="fnCreateExcel('err_chart1');">
						<i class="fa fa-file-excel-o" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<div id="err_chart1" class="po_chart"></div>
				</div>
				
				<div class="chart_box2 chart_box">
					<span class="popup" onclick="javascript:ClPopup.fnOnClickModalOpen('/pmng/errTrackCtqModal.do', 'id=2&var_arr='+chartParamJsn[1].var_arr, 520)">
						<i class="fa fa-plus" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<span class="excel" onclick="fnCreateExcel('err_chart2');">
						<i class="fa fa-file-excel-o" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<div id="err_chart2" class="po_chart"></div>
				</div>
				
				<div class="chart_box3 chart_box">
					<span class="popup" onclick="javascript:ClPopup.fnOnClickModalOpen('/pmng/errTrackCtqModal.do', 'id=3&var_arr='+chartParamJsn[2].var_arr, 520)">
						<i class="fa fa-plus" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<span class="excel" onclick="fnCreateExcel('err_chart3');">
						<i class="fa fa-file-excel-o" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<div id="err_chart3" class="po_chart"></div>
				</div>
				
				<div class="chart_box4 chart_box">
					<span class="popup" onclick="javascript:ClPopup.fnOnClickModalOpen('/pmng/errTrackCtqModal.do', 'id=4&var_arr='+chartParamJsn[3].var_arr, 520)">
						<i class="fa fa-plus" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<span class="excel" onclick="fnCreateExcel('err_chart4');">
						<i class="fa fa-file-excel-o" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<div id="err_chart4" class="po_chart"></div>
				</div>
				<div class="chart_box5 chart_box">
					<span class="popup" onclick="javascript:ClPopup.fnOnClickModalOpen('/pmng/errTrackCtqModal.do', 'id=5&var_arr='+chartParamJsn[4].var_arr, 520)">
						<i class="fa fa-plus" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<span class="excel" onclick="fnCreateExcel('err_chart5');">
						<i class="fa fa-file-excel-o" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<div id="err_chart5" class="po_chart"></div>
				</div>
				<div class="chart_box6 chart_box">
					<span class="popup" onclick="javascript:ClPopup.fnOnClickModalOpen('/pmng/errTrackCtqModal.do', 'id=6&var_arr='+chartParamJsn[5].var_arr, 520)">
						<i class="fa fa-plus" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<span class="excel" onclick="fnCreateExcel('err_chart6');">
						<i class="fa fa-file-excel-o" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<div id="err_chart6" class="po_chart"></div>
				</div>
				<div class="chart_box7 chart_box">
					<span class="popup" onclick="javascript:ClPopup.fnOnClickModalOpen('/pmng/errTrackCtqModal.do', 'id=7&var_arr='+chartParamJsn[6].var_arr, 520)">
						<i class="fa fa-plus" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<span class="excel" onclick="fnCreateExcel('err_chart7');">
						<i class="fa fa-file-excel-o" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<div id="err_chart7" class="po_chart"></div>
				</div>
				<div class="chart_box8 chart_box">
					<span class="popup" onclick="javascript:ClPopup.fnOnClickModalOpen('/pmng/errTrackCtqModal.do', 'id=8&var_arr='+chartParamJsn[7].var_arr, 520)">
						<i class="fa fa-plus" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<span class="excel" onclick="fnCreateExcel('err_chart8');">
						<i class="fa fa-file-excel-o" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<div id="err_chart8" class="po_chart"></div>
				</div>
				<div class="chart_box9 chart_box">
					<span class="popup" onclick="javascript:ClPopup.fnOnClickModalOpen('/pmng/errTrackCtqModal.do', 'id=9&var_arr='+chartParamJsn[8].var_arr, 520)">
						<i class="fa fa-plus" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<span class="excel" onclick="fnCreateExcel('err_chart9');">
						<i class="fa fa-file-excel-o" style="font-size: 20px;" aria-hidden="true"></i>
					</span>
					<div id="err_chart9" class="po_chart"></div>
				</div>
			</div>
		</div>
	</div>
</div>