<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
.mg-a10{
	margin: 10px;
}
.mg-b3{
	margin-bottom: 3px;
}
.wd-250{
    width: 250px;
}
.he-200{
    height: 200px;
}
table {
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
}
.top_wapper{
    width: 100%;
    height: 240px;
}
.top_wapper .left_box {
	width: 629px;
    height: 254px;
    position: relative;
    top: 3px;
    left: 18px;
    float: left;
    margin: 10px;
    border-radius: 10px;
    background-color: #999999;
}
.top_wapper .left_box .ptitle{
	background-color: #171C21;
    text-align: center;
    height: 28px;
    line-height: 31px;
}
.bottom_wapper .ptitle {
    background-color: #171C21;
    text-align: center;
   	height: 22px;
    line-height: 27px;
    font-size: 12px;
}
.top_wapper .left_box .content{
	background-color: #484848;
    height: 35px;
    text-align: center;
    line-height: 35px;
}

.top_wapper table{
	font-family: 'LGSmHa';
    font-size: 13px;
    text-align: center;
}
.top_wapper .left_box tr {
    height: 31px;
}
.top_wapper th {
    background-color: #1D2328;
    font-weight: normal;
}
.top_wapper td.gray{
	background-color: #595959;
}
.top_wapper td{
	background-color: #484848;
}
.top_wapper .right_box {
    width: 1208px;
    height: 254px;
    float: right;
    border-radius: 10px;
    position: absolute;
    top: 0;
    left: 652px;
    margin: 10px;
    
}

.ctq_tbl{
	width: 1204px;
    height: 250px;
    font-size: 11px !important;
    position: absolute;
    top: 1px;
    left: 5px;
    cursor: pointer;
}
.ctq_tbl tr{
	height: 15px;
}

td:not(:last-child){
    border-right: 1px solid #515151;
}
tr:not(:last-child) td{
    border-bottom: 1px solid #515151;
}
th:not(:last-child) {
    border-right: 1px solid #515151;
}
table th{
    border-bottom: 1px solid #515151;
}


.bottom_wapper table{
	font-family: 'LGSmHa';
    font-size: 11px;
    text-align: center;
}
.bottom_wapper tr {
    height: 18px;
}
.bottom_wapper th {
    background-color: #1D2328;
    font-weight: normal;
}
.bottom_wapper td.gray{
	background-color: #595959;
}
.bottom_wapper td{
	background-color: #484848;
}
.bottom_wapper .left_box div {
	float: left;
}
.ctitle {
    font-size: 12px;
    background-color: #171c21;
}
.ctitle div{
	position: absolute;
    top: 18px;
    left: 4px;
}
.el_epc_tbl {
	font-size: 8px !important;
}
.el_epc_tbl tr{
    height: 15px;
}
.sepa_epc_tbl tr{
	height: 21px;
}
.combinercul_tbl tr{
	height: 25px;
}
.lami_dancer_ten_tbl tr{
	height: 24px;
}
.cell_ins_tbl tr{
	height: 15px;
}
table.cell_ins_tbl {
    font-size: 10px;
}
.final_cutter_tbl tr{
	height: 20px;
}
.final_cv_tbl tr{
	height: 11px;
}
table.final_cv_tbl {
    font-size: 10px;
}
.upper_el_tbl tr{
	height: 20px;
}
.centerel_tbl {
    height: 130px;
}

table.lami_dancer_ten_tbl {
    height: 143px;
}
.crossOut .child{
    position:absolute; 
    width:0; 
    height:0;
    border-style:solid;
}
.crossOut .black-triangle{
    z-index:-2;
    border-color: transparent black white white;
}
.crossOut .white-triangle{
    border-color: transparent white white white;
    z-index:-1;
}


.var_id.red, .ctq_list.red{
	background-color: red !important;
	color : #fff !important;
	cursor: pointer;
}
.var_id.yellow, .ctq_list.yellow{
	background-color: yellow !important;
	color : black !important;
	cursor: pointer;
}
.var_id.green, .ctq_list.green{
	background-color: green !important;
	color : #fff !important;
	cursor: pointer;
}


</style>


<div style="width: 100%; height: 100%">
	<img style="
	    float: left;
	    position: absolute;
	    top: 272px;
	    left: 23px;
	    height: 576px;
	    width: 1865px;"
		alt="Notching Main" src="${rootPath}/resource/img/bts/cmi/lami/bg-bottom.png">
	<img style=" 
        float: left;
	    position: absolute;
	    top: 285px;
	    left: 25px;
	    width: 1865px;
	    height: 210px;"
		alt="Notching Main" src="${rootPath}/resource/img/bts/cmi/lami/machine-image.png">
	<img style="    width: 1920px;height: 885px;
	    float: left;
	    opacity: 0.5;
	    position: fixed;
	    display: none;"
		alt="Notching Main" src="${rootPath}/resource/img/bts/cmi/lami/CMI_Lami_main.png">
		
		
	<div class="top_wapper">
		<div class="left_box">
			<div class="mg-a10">
				<div class="ptitle">Equipment Operation Information</div>
				<div class="content">
					<div style="width: 33%;" class="fl">Lot ID: <span class="var_id_str Lot_ID"></span></div>
					<div style="width: 40%;" class="fl">Recipe ID: <span class="var_id_str Recipe_ID"></span></div>
					<div style="width: 23%;" class="fl">Cell Type: <span class="var_id Cell_Type"></span></div>
				</div>
			</div>
			<div class="mg-a10">
				<div class="ptitle mg-b3">Common Setting</div>
				<div>
					<table>
						<thead>
							<tr>
								<th>ITEM</th>
								<th>Value</th>
								<th>ITEM</th>
								<th>EA</th>
								<th>ITEM</th>
								<th>%</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="gray">Cell Size (mm)</td>
								<td class="var_id Cell_Size"></td>
								<td class="gray">Input Count</td>
								<td class="var_id Input_Count"></td>
								<td class="gray">Operation Rate</td>
								<td class="var_id Operation_Rate"></td>
							</tr>
							<tr>
								<td class="gray">Process Speed (cpm)</td>
								<td class="var_id Process_Spd"></td>
								<td class="gray">Pass Count</td>
								<td class="var_id Pass_Good_OK_Count_"></td>
								<td class="gray">Pass Rate</td>
								<td class="var_id Pass_Rate"></td>
							</tr>
							<tr>
								<td class="gray">Lami. Roller<br>Speed (mm/s)</td>
								<td class="var_id Lami_Roller_Speed"></td>
								<td class="gray">NG Count</td>
								<td class="var_id NG_Count"></td>
								<td class="gray">NG Rate</td>
								<td class="var_id NG_Rate"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="right_box">
			<table class="ctq_tbl" onclick="fnMove();">
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
						<td class="ctq_list lsl A1U"></td> 
						<td class="ctq_list lsl A2U"></td> 
						<td class="ctq_list lsl A3U"></td> 
						<td class="ctq_list lsl A4U"></td> 
						<td class="ctq_list lsl TS_U"></td>
						<td class="ctq_list lsl A5U"></td> 
						<td class="ctq_list lsl A6U"></td> 
						<td class="ctq_list lsl A1L"></td> 
						<td class="ctq_list lsl A2L"></td> 
						<td class="ctq_list lsl A3L"></td> 
						<td class="ctq_list lsl A4L"></td> 
						<td class="ctq_list lsl TS_A"></td>
						<td class="ctq_list lsl TW_I"></td>
						<td class="ctq_list lsl TW"></td>  
						<td class="ctq_list lsl A5L"></td> 
						<td class="ctq_list lsl A6L"></td> 
						<td class="ctq_list lsl TH_A"></td>
						<td class="ctq_list lsl SM1"></td> 
						<td class="ctq_list lsl SM2"></td> 
						<td class="ctq_list lsl SM3"></td> 
						<td class="ctq_list lsl SM4"></td> 
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
						<td class="ctq_list target TS_A"></td>
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
						<td class="ctq_list usl A1U"></td> 
						<td class="ctq_list usl A2U"></td> 
						<td class="ctq_list usl A3U"></td> 
						<td class="ctq_list usl A4U"></td> 
						<td class="ctq_list usl TS_U"></td>
						<td class="ctq_list usl A5U"></td> 
						<td class="ctq_list usl A6U"></td> 
						<td class="ctq_list usl A1L"></td> 
						<td class="ctq_list usl A2L"></td> 
						<td class="ctq_list usl A3L"></td> 
						<td class="ctq_list usl A4L"></td> 
						<td class="ctq_list usl TS_A"></td>
						<td class="ctq_list usl TW_I"></td>
						<td class="ctq_list usl TW"></td>  
						<td class="ctq_list usl A5L"></td> 
						<td class="ctq_list usl A6L"></td> 
						<td class="ctq_list usl TH_A"></td>
						<td class="ctq_list usl SM1"></td> 
						<td class="ctq_list usl SM2"></td> 
						<td class="ctq_list usl SM3"></td> 
						<td class="ctq_list usl SM4"></td> 
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
						<td class="ctq_list ng_cnt TS_A"></td>
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
						<td class="ctq_list ng_rate TS_A"></td>
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
						<td class="ctq_list proportion TS_A"></td>
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
						<td class="ctq_list min TS_A"></td>
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
						<td class="ctq_list mean TS_A"></td>
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
						<td class="ctq_list max TS_A"></td>
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
						<td class="ctq_list std TS_A"></td>
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
						<td class="ctq_list cpk TS_A"></td>
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
			
		</div>
	</div>
	
	
	<div class="bottom_wapper" style="background-color: #fefefe;">
		<div class="left_box">
			<div style="position: absolute;top: 280px;left: 40px;width: 177px;" class="ptitle">Unwinder</div>
			<div style="position: absolute;top: 280px;left: 572px;width: 136px;" class="ptitle">Combiner</div>
			<div style="position: absolute;top: 280px;left: 827px;width: 245px;" class="ptitle">Laminator</div>
			<div style="position: absolute;top: 280px;left: 1305px;width: 217px;" class="ptitle">Cell, Final Cutter</div>
			<div style="position: absolute;top: 280px;left: 1591px;width: 258px;" class="ptitle">Cell, Inspector</div>
			
			
			<div style="position: absolute;top: 504px;left: 40px;width: 196px;" class="ptitle">Dancer Tension</div>
			<div style="position: absolute;top: 529px;left: 40px;width: 196px;" class="fl">
				<table>
					<thead>
						<tr>
							<th colspan="2">Item</th>
							<th>SV</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray" rowspan="3">EL U/W</td>
							<td class="gray">Upper</td>
							<td class="var_id Upper_Electrode_Dancer_Tension"></td>
						</tr>
						<tr>
							<td class="gray">Center</td>
							<td class="var_id Center_Electrode_Dancer_Tension"></td>
						</tr>
						<tr>
							<td class="gray">Lower</td>
							<td class="var_id Lower_Electrode_Dancer_Tension"></td>
						</tr>
						<tr>
							<td class="gray" rowspan="2">Sepa U/W</td>
							<td class="gray">Upper</td>
							<td class="var_id Upper_Sepa_Unwinder_Dancer_Tension"></td>
						</tr>
						<tr>
							<td class="gray">Lower</td>
							<td class="var_id Lower_Sepa_Unwinder_Dancer_Tension"></td>
						</tr>
						<tr>
							<td class="gray" rowspan="2">Sepa PET <br>R/W</td>
							<td class="gray">Upper</td>
							<td class="var_id Upper_Sepa_PET_Rewinder_Dancer_Tension"></td>
						</tr>
						<tr>
							<td class="gray">Lower</td>
							<td class="var_id Lower_Sepa_PET_Rewinder_Dancer_Tension"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 703px;left: 40px;width: 106px;" class="ptitle">EL EPC</div>
			<div style="position: absolute;top: 733px;left: 40px;width: 106px;" >
				<table class="el_epc_tbl">
					<thead>
						<tr>
							<th colspan="2">Item</th>
							<th>SV</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray" rowspan="3">Present<br>Position<br>Value</td>
							<td class="gray">U</td>
							<td class="var_id Present_Position_of_Edge_Sensor_Upper_Electrode_EPC_in_Electrode_Separator_Combiner"></td>
						</tr>
						<tr>
							<td class="gray">C</td>
							<td class="var_id Present_Position_of_Edge_Sensor_Center_Electrode_EPC_in_Electrode_Separator_Combiner"></td>
						</tr>
						<tr>
							<td class="gray">L</td>
							<td class="var_id Present_Position_of_Edge_Sensor_Lower_Electrode_EPC_in_Electrode_Separator_Combiner"></td>
						</tr>
						<tr>
							<td class="gray" rowspan="3">Offset</td>
							<td class="gray">U</td>
							<td class="var_id Servo_Position_Offset_of_Upper_Electrode_EPC"></td>
						</tr>
						<tr>
							<td class="gray">C</td>
							<td class="var_id Servo_Position_Offset_of_Center_Electrode_EPC"></td>
						</tr>
						<tr>
							<td class="gray">L</td>
							<td class="var_id Servo_Position_Offset_of_Lower_Electrode_EPC"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 703px;left: 151px;width: 106px;" class="ptitle">Sepa EPC</div>
			<div style="position: absolute;top: 733px;left: 151px;width: 106px;" >
				<table class="sepa_epc_tbl">
					<thead>
						<tr>
							<th colspan="2">Item</th>
							<th>SV</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray" rowspan="2">Present<br>Position<br>Value</td>
							<td class="gray">U</td>
							<td class="var_id Present_Position_of_Edge_Sensor_Upper_Separator_EPC_in_Electrode_Separator_Combiner"></td>
						</tr>
						<tr>
							<td class="gray">L</td>
							<td class="var_id Present_Position_of_Edge_Sensor_Lower_Separator_EPC_in_Electrode_Separator_Combiner"></td>
						</tr>
						<tr>
							<td class="gray" rowspan="2">Offset</td>
							<td class="gray">U</td>
							<td class="var_id Servo_Position_Offset_of_Upper_Separator_EPC"></td>
						</tr>
						<tr>
							<td class="gray">L</td>
							<td class="var_id Servo_Position_Offset_of_Lower_Separator_EPC"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 504px;left: 267px;width: 196px;" class="ptitle">Upper EL</div>
			<div style="position: absolute;top: 529px;left: 267px;width: 196px;" >
				<table class="upper_el_tbl">
					<thead>
						<tr>
							<th colspan="2">Item</th>
							<th>SV</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray" rowspan="3">Tension</td>
							<td class="gray">C/V</td>
							<td class="var_id Push_Pressure_of_Upper_Electrode_Conveyor"></td>
						</tr>
						<tr>
							<td class="gray">Cutter</td>
							<td class="var_id Blade_Push_Pressure_of_Upper_Electrode_Cutter"></td>
						</tr>
						<tr>
							<td class="gray">Gripper</td>
							<td class="var_id Push_Pressure_of_Upper_Cutting_Gripper"></td>
						</tr>
						<tr>
							<td class="gray" rowspan="2">Offset</td>
							<td class="gray">C/V<br>Speed Ratio</td>
							<td class="var_id Rotate_Angular_Speed_Ratio_Offset_of_Upper_Electrode_Cutting"></td>
<!-- 							<td class="var_id Rotate_Angular_Speed_Ratio_Offset_of_Upper_Electrode_Cutting"></td> -->
						</tr>
						<tr>
							<td class="gray">Cutting Position</td>
							<td class="var_id Position_Offset_of_Upper_Electrode_Cutting"></td>
						</tr>
						<tr>
							<td class="gray">Distance</td>
							<td class="gray">Cutter ~ Tab Sensor</td>
							<td class="var_id Distance_between_Tab_Sensor_and_Upper_Electrode_Blade"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 504px;left: 467px;width: 196px;" class="ptitle">Combiner (U/C/L)</div>
			<div style="position: absolute;top: 529px;left: 467px;width: 196px;" >
				<table class="combinercul_tbl">
					<thead>
						<tr>
							<th colspan="2">Item</th>
							<th>SV</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray" rowspan="2">Tension</td>
							<td class="gray">C/V</td>
							<td class="var_id Push_Pressure_of_Upper_Center_Lower_Align_Conveyor"></td>
						</tr>
						<tr>
							<td class="gray">U/C/L Union</td>
							<td class="var_id Up_Lo_Union_EPR"></td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td class="gray">C/V U/C/L (Nip Roll)</td> -->
<!-- 							<td class="var_id Push_Pressure_of_Upper_Center_Lower_Nip_Roller"></td> -->
<!-- 						</tr> -->
						<tr>
							<td class="gray">Offset</td>
							<td class="gray">C/V Speed Ratio</td>
							<td class="var_id Rotate_Angular_Speed_Ratio_Offset_of_Pully_02_Electrode_Separator_Combiner_Conveyor"></td>
						</tr>
						<tr>
							<td class="gray">Distance</td>
							<td class="gray">Align ~ Combiner</td>
							<td class="var_id Distance_of_Tab_Sensor_02_Electrode_Separator_Combiner_Conveyor_from_Tab_Sensor"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 660px;left: 468px;width: 196px;" class="ptitle">Combiner (C-EL)</div>
			<div style="position: absolute;top: 684px;left: 468px;width: 196px;" >
				<table class="">
					<thead>
						<tr>
							<th colspan="2">Item</th>
							<th>SV</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray">Tension</td>
							<td class="gray">C/V</td>
							<td class="var_id Push_Pressure_of_Center_Electrode_Align_Conveyor"></td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td class="gray">Nip Roll</td> -->
<!-- 							<td class="var_id Push_Pressure_of_Center_Nip_Roller"></td> -->
<!-- 						</tr> -->
						<tr>
							<td class="gray">Offset</td>
							<td class="gray">C/V Speed Ratio</td>
							<td class="var_id Rotate_Angular_Speed_Ratio_Offset_of_Pully_01_Electrode_Separator_Combiner_Conveyor"></td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td class="gray">Distance</td> -->
<!-- 							<td class="gray">Align ~ Combiner</td> -->
<!-- 							<td class="var_id Up_Lo_Tab_S_S_Union_Distance"></td> -->
<!-- 						</tr> -->
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 687px; left: 267px;width: 196px;" class="ptitle">Center EL</div>
			<div style="position: absolute;top: 714px;left: 267px;width: 196px;" >
				<table class="centerel_tbl">
					<thead>
						<tr>
							<th colspan="2">Item</th>
							<th>SV</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray" rowspan="3">Tension</td>
							<td class="gray">C/V</td>
							<td class="var_id Push_Pressure_of_Center_Electrode_Conveyor"></td>
						</tr>
						<tr>
							<td class="gray">Cutter</td>
							<td class="var_id Blade_Push_Pressure_of_Center_Electrode_Cutter"></td>
						</tr>
						<tr>
							<td class="gray">Gripper</td>
							<td class="var_id Push_Pressure_of_Center_Cutting_Gripper"></td>
						</tr>
						<tr>
							<td class="gray" rowspan="2">Offset</td>
							<td class="gray">C/V Speed Ratio</td>
							<td class="var_id Rotate_Angular_Speed_Ratio_Offset_of_Center_Electrode_Cutting"></td>
						</tr>
						<tr>
							<td class="gray">Cutting Position</td>
							<td class="var_id Position_Offset_of_Center_Electrode_Cutting"></td>
						</tr>
						<tr>
							<td class="gray">Distance</td>
							<td class="gray">Cutter ~ Tab Sensor</td>
							<td class="var_id Distance_between_Tab_Sensor_and_Center_Electrode_Blade"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 504px;left: 667px;width: 51px;height: 74px;" class="ctitle">
				<div>Cutter (U)<br>(Count)</div>
			</div>
			<div style="position: absolute;top: 504px;left: 716px;width: 129px;height: 74px;font-size: 12px;line-height: 26px;text-align: center;background-color: #595959;">
				<div style="position: absolute;float:left;text-align: center;width:35px;top: 1px;font-size: 8px;letter-spacing: -0.24px;">Set</div>
				<div class="var_id Cutter_Number_Setting_of_Strokes_of_Upper_Electrode_Cutting" style="position: absolute;top: 15px;float:left;text-align: center;width: 35px;font-size: 8px;color:#11a448;letter-spacing: -0.24px;"></div>
				<div style="position: absolute;float:left;text-align: center;width: 35px;top: 34px;font-size: 8px;letter-spacing: -0.24px;">Present</div>
				<div class="var_id Cutter_Number_of_Strokes_of_Upper_Electrode_Cutting" style="position: absolute;top: 46px;float:left;text-align: center;width: 35px;font-size: 8px;color:#ffc52a;letter-spacing: -0.24px;"></div>
				<div id="main_chart1" style="width: 88px;height: 70px;background-color: #484848;position: relative;top: 3px;left: 37px;overflow: hidden;">
<!-- 					<div style="position: absolute;bottom: 30px;left: 1px;width: 89px;height: 11px;background-color: #11A448;"></div> -->
<!-- 					<div style="position: absolute;bottom: 9px;left: 1px;width: 59px;height: 11px;background-color: #FFC52A;"></div> -->
				</div>
			</div>
			<div style="position: absolute;    top: 585px;left: 667px;width: 51px;height: 74px;" class="ctitle">
				<div>Cutter (C)<br>(Count)</div>
			</div>
			<div style="position: absolute;top: 585px;left: 716px;width: 129px;height: 74px;font-size: 12px;line-height: 26px;text-align: center;background-color: #595959;">
				<div style="position: absolute;float:left;text-align: center;width:35px;top: 1px;font-size: 8px;letter-spacing: -0.24px;">Set</div>
				<div class="var_id Cutter_Number_Setting_of_Strokes_of_Center_Electrode_Cutting" style="position: absolute;top: 15px;float:left;text-align: center;width: 35px;font-size: 8px;color:#11a448;letter-spacing: -0.24px;"></div>
				<div style="position: absolute;float:left;text-align: center;width: 35px;top: 34px;font-size: 8px;letter-spacing: -0.24px;">Present</div>
				<div class="var_id Cutter_Number_of_Strokes_of_Center_Electrode_Cutting" style="position: absolute;top: 46px;float:left;text-align: center;width: 35px;font-size: 8px;color:#ffc52a;letter-spacing: -0.24px;"></div>
				<div id="main_chart2" style="width: 88px;height: 70px;background-color: #484848;position: relative;top: 3px;left: 37px;overflow: hidden;">
<!-- 					<div style="position: absolute;bottom: 30px;left: 1px;width: 99px;height: 11px;background-color: #11A448;"></div> -->
<!-- 					<div style="position: absolute;bottom: 9px;left: 1px;width: 40px;height: 11px;background-color: #FFC52A;"></div> -->
				</div>
			</div>
			<div style="position: absolute;top: 667px;left: 667px;width: 51px;height: 74px;" class="ctitle">
				<div>Cutter (L)<br>(Count)</div>
			</div>
			<div style="position: absolute;top: 667px;left: 716px;width: 129px;height: 74px;font-size: 12px;line-height: 26px;text-align: center;background-color: #595959;">
				<div style="position: absolute;float:left;text-align: center;width:35px;top: 1px;font-size: 8px;letter-spacing: -0.24px;">Set</div>
				<div class="var_id Cutter_Number_Setting_of_Strokes_of_Lower_Electrode_Cutting" style="position: absolute;top: 15px;float:left;text-align: center;width: 35px;font-size: 8px;color:#11a448;letter-spacing: -0.24px;"></div>
				<div style="position: absolute;float:left;text-align: center;width: 35px;top: 34px;font-size: 8px;letter-spacing: -0.24px;">Present</div>
				<div class="var_id Cutter_Number_of_Strokes_of_Lower_Electrode_Cutting" style="position: absolute;top: 46px;float:left;text-align: center;width: 35px;font-size: 8px;color:#ffc52a;letter-spacing: -0.24px;"></div>
				<div id="main_chart3" style="width: 88px;height: 70px;background-color: #484848;position: relative;top: 3px;left: 37px;overflow: hidden;">
<!-- 					<div style="position: absolute;bottom: 30px;left: 1px;width: 79px;height: 11px;background-color: #11A448;"></div> -->
<!-- 					<div style="position: absolute;bottom: 9px;left: 1px;width: 29px;height: 11px;background-color: #FFC52A;"></div> -->
				</div>
			</div>
			<div style="position: absolute;top: 746px;left: 467px;width: 378px;" class="ptitle">Lower EL</div>
			<div style="position: absolute;top: 770px;left: 467px;width: 378px;" >
				<table class="">
					<thead>
						<tr>
							<th colspan="2">Item</th>
							<th>SV</th>
							<th colspan="2">Item</th>
							<th>SV</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray" rowspan="3">Tension</td>
							<td class="gray">C/V</td>
							<td class="var_id Push_Pressure_of_Lower_Electrode_Conveyor"></td>
							<td class="gray" rowspan="2">Offset</td>
							<td class="gray">C/V Speed Ratio</td>
							<td class="var_id Rotate_Angular_Speed_Ratio_Offset_of_Lower_Electrode_Cutting"></td>
						</tr>
						<tr>
							<td class="gray">Cutter</td>
							<td class="var_id Blade_Push_Pressure_of_Lower_Electrode_Cutter"></td>
							<td class="gray">Cutting Position</td>
							<td class="var_id Position_Offset_of_Lower_Electrode_Cutting"></td>
						</tr>
						<tr>
							<td class="gray">Gripper</td>
							<td class="var_id Push_Pressure_of_Lower_Cutting_Gripper"></td>
							<td class="gray">Distance</td>
							<td class="gray">Cutter ~ Tab Sensor</td>
							<td class="var_id Distance_between_Tab_Sensor_and_Lower_Electrode_Blade"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 504px; left: 867px; width: 231px;" class="ptitle">Dancer Tension</div>
			<div style="position: absolute;top: 529px;left: 867px;width: 231px;" >
				<table class="lami_dancer_ten_tbl">
					<thead>
						<tr>
							<th colspan="2">Item</th>
							<th>SV</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray" rowspan="2">PET U/W</td>
							<td class="gray">Upper</td>
							<td class="var_id Upper_PET_Unwinder_Dancer_Tension"></td>
						</tr>
						<tr>
							<td class="gray">Lower</td>
							<td class="var_id Lower_PET_Unwinder_Dancer_Tension"></td>
						</tr>
						<tr>
							<td class="gray" rowspan="2">PET R/W</td>
							<td class="gray">Upper</td>
							<td class="var_id Upper_PET_Winder_Dancer_Tension"></td>
						</tr>
						<tr>
							<td class="gray">Lower</td>
							<td class="var_id Lower_PET_Winder_Dancer_Tension"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 504px; left: 1108px; width: 231px;" class="ptitle">Lami Roller</div>
			<div style="position: absolute;top: 529px;left: 1108px;width: 231px;" >
				<table class="">
					<thead>
						<tr>
							<th>Item</th>
							<th>SV</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray">U/L Tension</td>
							<td class="var_id Push_Pressure_of_Upper_Lower_Lamination_Roller"></td>
						</tr>
						<tr>
							<td class="gray">Position Gap</td>
							<td class="var_id Press_Gap_of_Upper_Lower_Lamination_Roller_in_Laminator"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 594px; left: 1108px; width: 231px;" class="ptitle">Dancer Roll</div>
			<div style="position: absolute;top: 615px;left: 1108px;width: 231px;" >
				<table class="">
					<thead>
						<tr>
							<th colspan="2">Item</th>
							<th>SV</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray" rowspan="2">Buffer</td>
							<td class="gray">Tension</td>
							<td class="var_id Tension_of_Dancer_Roller_Uncut_Cell_Dancer"></td>
						</tr>
						<tr>
							<td class="gray">Angle</td>
							<td class="var_id LamiRolrOut_Dancer_Target"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 673px; left: 873px; width: 462px;" class="ptitle">Lami Heater(Upper)</div>
			<div style="position: absolute;top: 698px;left: 873px;width: 462px;" >
				<table class="">
					<thead>
						<tr>
							<th>Temp</th>
							<th>1</th>
							<th>2</th>
							<th>3</th>
							<th>4</th>
							<th>5</th>
							<th>6</th>
							<th>7</th>
							<th>8</th>
							<th>9</th>
							<th>Sub</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray">SV</td>
							<td class="var_id Setting_Temperature_of_A_Heater_01_Upper_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_B_Heater_01_Upper_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_C_Heater_01_Upper_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_A_Heater_02_Upper_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_B_Heater_02_Upper_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_C_Heater_02_Upper_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_A_Heater_03_Upper_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_B_Heater_03_Upper_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_C_Heater_03_Upper_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_Upper_Sub_Heater"></td>
						</tr>
						<tr>
							<td class="gray">PV</td>
							<td class="var_id Current_Temperature_of_A_Heater_01_Upper_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_B_Heater_01_Upper_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_C_Heater_01_Upper_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_A_Heater_02_Upper_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_B_Heater_02_Upper_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_C_Heater_02_Upper_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_A_Heater_03_Upper_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_B_Heater_03_Upper_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_C_Heater_03_Upper_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_Upper_Sub_Heater"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 760px; left: 873px; width: 462px;" class="ptitle">Lami Heater(Lower)</div>
			<div style="position: absolute;top: 785px;left: 873px;width: 462px;" >
				<table class="">
					<thead>
						<tr>
							<th>Temp</th>
							<th>1</th>
							<th>2</th>
							<th>3</th>
							<th>4</th>
							<th>5</th>
							<th>6</th>
							<th>7</th>
							<th>8</th>
							<th>9</th>
							<th>Sub</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray">SV</td>
							<td class="var_id Setting_Temperature_of_A_Heater_01_Lower_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_B_Heater_01_Lower_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_C_Heater_01_Lower_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_A_Heater_02_Lower_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_B_Heater_02_Lower_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_C_Heater_02_Lower_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_A_Heater_03_Lower_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_B_Heater_03_Lower_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_C_Heater_03_Lower_Heating_Zone"></td>
							<td class="var_id Setting_Temperature_of_Lower_Sub_Heater"></td>
						</tr>
						<tr>
							<td class="gray">PV</td>
							<td class="var_id Current_Temperature_of_A_Heater_01_Lower_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_B_Heater_01_Lower_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_C_Heater_01_Lower_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_A_Heater_02_Lower_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_B_Heater_02_Lower_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_C_Heater_02_Lower_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_A_Heater_03_Lower_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_B_Heater_03_Lower_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_C_Heater_03_Lower_Heating_Zone"></td>
							<td class="var_id Current_Temperature_of_Lower_Sub_Heater"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 504px;left: 1361px;width: 283px;" class="ptitle">Sepa Sealer</div>
			<div style="position: absolute;top: 529px;left: 1361px;width: 283px;" >
				<table class="">
					<thead>
						<tr>
							<th colspan="2">Item</th>
							<th>SV</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray" rowspan="2">Tension (Front)</td>
							<td class="gray">Upper</td>
							<td class="var_id Push_Pressure_of_A_Upper_Sealing_Block_Heater_Separator_Sealer"></td>
<!-- 							<td class="var_id Push_Pressure_of_A_Upper_Sealing_Block_Heater_Separator_Sealer"></td> -->
						</tr>
						<tr>
							<td class="gray">Lower</td>
							<td class="var_id Push_Pressure_of_A_Lower_Sealing_Block_Heater_Separator_Sealer"></td>
						</tr>
						<tr>
							<td class="gray" rowspan="2">Tension (Rear)</td>
							<td class="gray">Upper</td>
							<td class="var_id Push_Pressure_of_B_Upper_Sealing_Block_Heater_Separator_Sealer"></td>
						</tr>
						<tr>
							<td class="gray">Lower</td>
							<td class="var_id Push_Pressure_of_B_Lower_Sealing_Block_Heater_Separator_Sealer"></td>
						</tr>
						<tr>
							<td class="gray" rowspan="2">Distance</td>
							<td class="gray">Tab to Sealing</td>
							<td class="var_id Distance_Sealing_Start_of_Separator_Sealing_Linear_from_Tab_Sensor"></td>
						</tr>
						<tr>
							<td class="gray">Stroke</td>
							<td class="var_id Stroke_Distance_of_Separator_Sealing_Linear"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 504px;left: 1669px;width: 215px;" class="ptitle">Cell Inspection</div>
			<div style="position: absolute;top: 529px;left: 1669px;width: 215px;" >
				<table class="cell_ins_tbl">
					<thead>
						<tr>
							<th colspan="2">Item</th>
							<th>SV</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray" rowspan="2">Tension</td>
							<td class="gray">Short C/V</td>
							<td class="var_id ShortChkCV_EPR"></td>
						</tr>
						<tr>
							<td class="gray">Vision C/V</td>
							<td class="var_id Vision_CV_EPR"></td>
						</tr>
						<tr>
							<td class="gray" rowspan="2">Stroke</td>
							<td class="gray">Short Checker</td>
							<td class="var_id ShortChkStroke"></td>
						</tr>
						<tr>
							<td class="gray">Vision Checker</td>
							<td class="var_id Vision1_ChkStroke"></td>
						</tr>
						<tr>
							<td class="gray" rowspan="2">Continue<br>NG Cnt</td>
							<td class="gray">Short</td>
							<td class="var_id Recipe_ShortChkContinueNG_Cnt"></td>
						</tr>
						<tr>
							<td class="gray">Vision</td>
							<td class="var_id Recipe_Vision1_ContunueNG_Cnt"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 667px;left: 1361px;width: 137px;" class="ptitle">Sepa Heater(F)</div>
			<div style="position: absolute;top: 697px;left: 1361px;width: 137px;" >
				<table class="">
					<thead>
						<tr>
							<th>Temp</th>
							<th>Upper</th>
							<th>Lower</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray">SV</td>
							<td class="var_id 1_Temperature_of_A_Upper_Sealing_Block_Heater_Separator_Sealer"></td>
							<td class="var_id 1_Temperature_of_A_Lower_Sealing_Block_Heater_Separator_Sealer"></td>
						</tr>
						<tr>
							<td class="gray">PV</td>
							<td class="var_id 1_Current_Temperature_of_A_Upper_Sealing_Block_Heater_Separator_Sealer"></td>
							<td class="var_id 1_Current_Temperature_of_A_Lower_Sealing_Block_Heater_Separator_Sealer"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 667px;left: 1505px;width: 137px;" class="ptitle">Sepa Heater(R)</div>
			<div style="position: absolute;top: 697px;left: 1505px;width: 137px;" >
				<table class="">
					<thead>
						<tr>
							<th>Temp</th>
							<th>Upper</th>
							<th>Lower</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray">SV</td>
							<td class="var_id 1_Temperature_of_B_Upper_Sealing_Block_Heater_Separator_Sealer"></td>
							<td class="var_id 1_Temperature_of_B_Lower_Sealing_Block_Heater_Separator_Sealer"></td>
						</tr>
						<tr>
							<td class="gray">PV</td>
							<td class="var_id 1_Current_Temperature_of_B_Upper_Sealing_Block_Heater_Separator_Sealer"></td>
							<td class="var_id 1_Current_Temperature_of_B_Lower_Sealing_Block_Heater_Separator_Sealer"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 758px;left: 1361px;width: 259px;" class="ptitle">Final Cutter</div>
			<div style="position: absolute;top: 783px;left: 1361px;width: 259px;" >
				<table class="final_cutter_tbl">
					<thead>
						<tr>
							<th colspan="2">Item</th>
							<th>SV</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray">Tension</td>
							<td class="gray">Cutter</td>
							<td class="var_id Blade_Push_Pressure_of_Cell_Final_Cutter"></td>
						</tr>
						<tr>
							<td class="gray">Offset</td>
							<td class="gray">Cutting Position</td>
							<td class="var_id Position_Offset_of_Final_Cutting"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position: absolute;top: 667px;left: 1647px;width: 49px;height: 87px;" class="ctitle">
				<div style="position: absolute;top: 25px;left: 6px;">Cutter<br>(Final)<br>Count</div>
			</div>
			<div style="position: absolute;top: 667px;left: 1694px;width: 184px;height: 85px;font-size: 12px;line-height: 26px;text-align: center;background-color: #595959;">
				<div style="position: absolute;top: 6px;left: 10px;font-size: 8px;letter-spacing: -0.24px;">Set</div>
				<div class="var_id Cutter_Number_Setting_of_Strokes_of_Final_Cutting" style="position: absolute;width: 35px;top: 18px;text-align: center;font-size: 8px;color:#11a448;letter-spacing: -0.24px;"></div>
				<div style="position: absolute;top: 38px;font-size: 8px;letter-spacing: -0.24px;">Present</div>
				<div class="var_id Cutter_Number_of_Strokes_of_Final_Cutting" style="position: absolute;top: 52px;width: 35px;text-align: center;font-size: 8px;color:#ffc52a;letter-spacing: -0.24px;"></div>
				<div id="main_chart4"  style="width: 138px;height: 73px;background-color: #484848;position: relative;top: 5px;left: 37px;overflow: hidden;">
<!-- 					<div style="position: absolute;bottom: 49px;left: 1px;width: 89px;height: 11px;background-color: #11A448;"></div> -->
<!-- 					<div style="position: absolute;bottom: 17px;left: 1px;width: 59px;height: 11px;background-color: #FFC52A;"></div> -->
				</div>
			</div>
			<div style="position: absolute;top: 757px;left: 1626px;width: 250px;" class="ptitle">Final C/V</div>
			<div style="position: absolute;top: 780px;left: 1626px;width: 250px;" >
				<table class="final_cv_tbl">
					<thead>
						<tr>
							<th colspan="2">Item</th>
							<th>SV</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gray">Tension</td>
							<td class="gray">C/V</td>
							<td class="var_id Push_Pressure_of_Final_Conveyor"></td>
						</tr>
						<tr>
							<td class="gray">Offset</td>
							<td class="gray">C/V Speed Ratio</td>
							<td class="var_id Rotate_Angular_Speed_Ratio_Offset_of_Final_Cutting"></td>
						</tr>
						<tr>
							<td class="gray">Distance</td>
							<td class="gray">Cutter ~ Tab Sensor</td>
							<td class="var_id Distance_between_Tab_Sensor_and_Final_Cutter"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>