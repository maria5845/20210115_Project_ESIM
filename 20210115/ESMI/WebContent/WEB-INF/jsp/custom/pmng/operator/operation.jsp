<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
.mg-a10{
	
}
.left_box_top .mg-a10:first-child{
	margin-bottom: 5px;
}
.left_box_top .mg-a10:last-child{
	height: calc(100% - 68px);
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
    height:100%;
    display: flex;
}
.top_wapper .left_box {
    height: calc(100% - 20px);
    margin: 10px;
    flex: 1;
    padding: 10px;
    box-sizing: border-box;
}
.top_wapper .left_box_top {
    height: calc(100% - 566px);
    border-radius: 15px;
    padding : 10px;
    background-color: #999999;
    flex: 1;
    margin-bottom: 10px;
    box-sizing: border-box;
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
    height: calc(100% - 28px);
    text-align: center;
    line-height: 35px;
    overflow: hidden;
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
	height: 14px;
}
.top_wapper .right_box {
    height: calc(100% - 20px);
    border-radius: 10px;
    margin: 10px;
    padding: 10px;
    margin-left: 0;
    padding-left: 0;
    flex: 2;
    width: 1000px;
}

.ctq_tbl_1{
    width: 240px;
    height: 250px;
    font-size: 11px !important;
    position: absolute;
	top: 180px;
    left: 65px;

}
.ctq_tbl_2{
    width: 213PX;
    height: 90px;
    font-size: 11px !important;
    position: absolute;
	top: 137px;
    left: 508px;

}
.ctq_tbl tr{
	height: 18px;
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
.top_wapper .left_box .ctq_tbl_2 tr{
	height: 23px;
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
.h-10 {
	height: 10px;
}
.title-off{
	background: dimgray;
}
.title-alarm{
	background: yellow !important;
}
.title-warn{
	background: #ff0000 !important;
}
.title-run{
	background: #11a448 !important;
}
.wrapper {
    padding: 10px 20px;
    height: calc(100% - 20px);
}
.cylinder_group {
	width: 100%;
	height: 340px;
    margin-bottom: 10px;
    border-radius: 15px;
    background: #333333;
    box-sizing: border-box;
    position: relative;
}
.result_group {
 	width: 100%;
    height: calc(65% - 380px);
    overflow-y: auto;
}
/* .main_img {
	width: 1380px;
    height: 238px;
    position: absolute;
    left: -200px;
    top: 78px;
} */

.main_img {
    width: 1274px;
    height: 229px;
    position: absolute;
    left: -223px;
    top: 83px;
}
.unwinder{
    width: calc(20% + 5px);
    height: calc(100%);
    border: 1px solid #5E5E5E;
    border-radius: 8px;
    margin-right: 3px;
}
/* .combiner{
	width: 30%;
    height: 100%;
    border: 1px solid #5E5E5E;
    border-radius: 15px 0 0 15px;
    position: absolute;
    top: 0;
    left: 0;
} */
.combiner{
	width: 24.0%;
    height: 100%;
    border: 1px solid #5E5E5E;
    border-radius: 15px 0 0 15px;
    position: absolute;
    top: 0;
    left: 0;
}
/* .laminator{
    width: 40%;
    height: 100%;
    border: 1px solid #5E5E5E;
    border-radius: 0;
    position: absolute;
    top: 0;
    left: 30%;
    border-left: 0;
    border-right: 0;
} */
.laminator{
    width: 40%;
    height: 100%;
    border: 1px solid #5E5E5E;
    border-radius: 0;
    position: absolute;
    top: 0;
    left: 21%;
    border-left: 0;
    border-right: 0;
}
/* .cutter{
   	width: 30%;
    height: 100%;
    border: 1px solid #5E5E5E;
    position: absolute;
    border-radius: 0 15px 15px 0;
    top: 0;
    right: 0;
} */
.cutter{
	width: 19%;
    height: 100%;
    border: 1px solid #5E5E5E;
    position: absolute;
    border-radius: 0 0 0 0;
    border-right: 0;
    top: 0;
    right: 233px;
}
.inspector{
    width: 22%;
    height: 100%;
    border: 1px solid #5E5E5E;
    position: absolute;
    border-radius: 0 15px 15px 0;
    top: 0;
    right: -2px;
}
.unwinder-title{
	display: inline-block;
    width: 152px;
    height: 24px;
    background-color: #1c1c1c;
    text-align: center;
    line-height: 1.5;
    position: relative;
    top: 10px;
    left: 10px;
}
.combiner-title{
	display: inline-block;
    width: 162px;
    height: 24px;
    background-color: #1c1c1c;
    text-align: center;
    line-height: 1.5;
    position: absolute;
    top: 10px;
    /* left: 180px; */
    left: 43px; 
}
.laminator-title{
	display: inline-block;
    width: 245px;
    height: 24px;
    background-color: #1c1c1c;
    text-align: center;
    line-height: 1.5;
    position: relative;
    top: 10px;
    left: 90px;
}
/* cutter-title{
	display: inline-block;
    width: 217px;
    height: 24px;
    background-color: #1c1c1c;
    text-align: center;
    line-height: 1.5;
    position: relative;
    top: 10px;
    left: 31px;
} */
.cutter-title{
	display: inline-block;
    width: 146px;
    height: 24px;
    background-color: #1c1c1c;
    text-align: center;
    line-height: 1.5;
    position: relative;
    top: 10px;
    left: 29px;
}
.inspector-title{
	display: inline-block;
    width: 146px;
    height: 24px;
    background-color: #1c1c1c;
    text-align: center;
    line-height: 1.5;
    position: relative;
    top: 10px;
    left: 44px;
}
.h-col {
	font-size: 16px !important;
	font-weight: bold !important;
}

.red{
	background-color: red !important;
	color : #fff !important;
	cursor: pointer;
}

canvas{
    position: absolute;
    left: 0px;
    top: 0px;
    width: 1084px;
    height: 255px;
    user-select: none;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    padding: 0px;
    margin: 0px;
    border-width: 0px;

}

.cont-body{
    height: 556px;
    border-radius: 15px;
    background-color: #333333;
    position: relative;
}

#common_setting_tbl{
	height: 100%;
}
#common_setting_tbl td{
	padding: 0;
	line-height: 0;
}

.chart_title{
 	padding-top: 5px;

}
table.tb td {
    padding: 1px;
}
table.tb tbody td{
	font-size: 11px;
}
table.tb th {
    padding: 2px;
}
</style>
	<div class="top_wapper">
		<div class="left_box">
		<div class="left_box_top">
			<div class="mg-a10">
				<div class="ptitle">Equipment Operation Information</div>
				<div class="content">
					<div style="width: 33%;" class="fl">Lot ID: <span class="var_id_str Lot_ID"></span></div>
					<div style="width: 40%;" class="fl">Recipe ID: <span class="var_id_str Recipe_ID"></span></div>
					<div style="width: 23%;" class="fl">Cell Type: <span class="var_id Cell_Type"></span></div>
				</div>
			</div>
			<div class="mg-a10">
				<div class="ptitle">Common Setting</div>
				<div class="content">
					<table id="common_setting_tbl">
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
								<td class="gray">Lami. Roller Speed (mm/s)</td>
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
			<div class="cont-body">
			<table class="ctq_tbl_1">
				<thead>
					<tr>
						<th>항목</th>
						<th>Mean(F)</th>
						<th>NG Rate</th>
						<th>Mean(R)</th>
						<th>NG Rate</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>TSU</th>
						<td class="ctq_list_f ts_u_mean"></td>
						<td class="ctq_list_f ts_u_ng_rate"></td>
						<td class="ctq_list_r ts_u_mean"></td>
						<td class="ctq_list_r ts_u_ng_rate"></td>
					</tr>
					<tr>
						<th>A5U</th>
						<td class="ctq_list_f a5u_mean"></td>
						<td class="ctq_list_f a5u_ng_rate"></td>
						<td class="ctq_list_r a5u_mean"></td>    
						<td class="ctq_list_r a5u_ng_rate"></td> 
					</tr>
					<tr>
						<th>A1U</th>
						<td class="ctq_list_f a1u_mean"></td>
						<td class="ctq_list_f a1u_ng_rate"></td>
						<td class="ctq_list_r a1u_mean"></td>
						<td class="ctq_list_r a1u_ng_rate"></td>
					</tr>
					<tr>
						<th>A2U</th>
						<td class="ctq_list_f a2u_mean"></td>
						<td class="ctq_list_f a2u_ng_rate"></td>
						<td class="ctq_list_r a2u_mean"></td>   
						<td class="ctq_list_r a2u_ng_rate"></td>
					</tr>
					<tr>
						<th>A6U</th>
						<td class="ctq_list_f a6u_mean"></td>
						<td class="ctq_list_f a6u_ng_rate"></td>
						<td class="ctq_list_r a6u_mean"></td>   
						<td class="ctq_list_r a6u_ng_rate"></td>
					</tr>
					<tr>
						<th>A4U</th>
						<td class="ctq_list_f a4u_mean"></td>     
						<td class="ctq_list_f a4u_ng_rate"></td>  
						<td class="ctq_list_r a4u_mean"></td>     
						<td class="ctq_list_r a4u_ng_rate"></td>  
					</tr>
					<tr>
						<th>A3U</th>
						<td class="ctq_list_f a3u_mean"></td>     
						<td class="ctq_list_f a3u_ng_rate"></td>  
						<td class="ctq_list_r a3u_mean"></td>     
						<td class="ctq_list_r a3u_ng_rate"></td>  
					</tr>
				</tbody>
			</table>
			<table class="ctq_tbl_2" >
				<thead>
					<tr>
						<th>항목</th>
						<th>Mean(F)</th>
						<th>NG Rate</th>
						<th>Mean(R)</th>
						<th>NG Rate</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>TS</th>
						<td class="ctq_list_f ts_a_mean"></td>
						<td class="ctq_list_f ts_a_ng_rate"></td>
						<td class="ctq_list_r ts_a_mean"></td>
						<td class="ctq_list_r ts_a_ng_rate"></td>
					</tr>
					<tr>
						<th>SM1</th>
						<td class="ctq_list_f sm1_mean"></td>
						<td class="ctq_list_f sm1_ng_rate"></td>
						<td class="ctq_list_r sm1_mean"></td>
						<td class="ctq_list_r sm1_ng_rate"></td>
					</tr>
					<tr>
						<th>A5L</th>
						<td class="ctq_list_f a5l_mean"></td>
						<td class="ctq_list_f a5u_ng_rate"></td>
						<td class="ctq_list_r a5l_mean"></td>
						<td class="ctq_list_r a5u_ng_rate"></td>
					</tr>
					<tr>
						<th>TH_A</th>
						<td class="ctq_list_f th_a_mean"></td>
						<td class="ctq_list_f th_a_ng_rate"></td>
						<td class="ctq_list_r th_a_mean"></td>
						<td class="ctq_list_r th_a_ng_rate"></td>
					</tr>
					<tr>
						<th>TW_I</th>
						<td class="ctq_list_f tw_i_mean"></td>
						<td class="ctq_list_f tw_i_ng_rate"></td>
						<td class="ctq_list_r tw_i_mean"></td>
						<td class="ctq_list_r tw_i_ng_rate"></td>
					</tr>
					<tr>
						<th>SM2</th>
						<td class="ctq_list_f sm2_mean"></td>    
						<td class="ctq_list_f sm2_ng_rate"></td> 
						<td class="ctq_list_r sm2_mean"></td>    
						<td class="ctq_list_r sm2_ng_rate"></td> 
					</tr>
					<tr>
						<th>A1L</th>
						<td class="ctq_list_f a1l_mean"></td>     
						<td class="ctq_list_f a1u_ng_rate"></td>  
						<td class="ctq_list_r a1l_mean"></td>     
						<td class="ctq_list_r a1u_ng_rate"></td>  
					</tr>
					<tr>
						<th>A2L</th>
						<td class="ctq_list_f a2l_mean"></td>     
						<td class="ctq_list_f a2u_ng_rate"></td>  
						<td class="ctq_list_r a2l_mean"></td>     
						<td class="ctq_list_r a2u_ng_rate"></td>  
					</tr>
					<tr>
						<th>SM4</th>
						<td class="ctq_list_f sm4_mean"></td>    
						<td class="ctq_list_f sm4_ng_rate"></td> 
						<td class="ctq_list_r sm4_mean"></td>    
						<td class="ctq_list_r sm4_ng_rate"></td> 
					</tr>
					<tr>
						<th>A6L</th>
						<td class="ctq_list_f a6l_mean"></td>     
						<td class="ctq_list_f a6u_ng_rate"></td>  
						<td class="ctq_list_r a6l_mean"></td>     
						<td class="ctq_list_r a6u_ng_rate"></td>  
					</tr>
					<tr>
						<th>TW</th>
						<td class="ctq_list_f tw_mean"></td>
						<td class="ctq_list_f tw_ng_rate"></td>
						<td class="ctq_list_r tw_mean"></td>
						<td class="ctq_list_r tw_ng_rate"></td>
					</tr>
					<tr>
						<th>SM3</th>
						<td class="ctq_list_f sm3_mean"></td>    
						<td class="ctq_list_f sm3_ng_rate"></td> 
						<td class="ctq_list_r sm3_mean"></td>    
						<td class="ctq_list_r sm3_ng_rate"></td> 
					</tr>
					<tr>
						<th>A4L</th>
						<td class="ctq_list_f a4l_mean"></td>     
						<td class="ctq_list_f a4u_ng_rate"></td>  
						<td class="ctq_list_r a4l_mean"></td>     
						<td class="ctq_list_r a4u_ng_rate"></td>  
					</tr>
					<tr>
						<th>A3L</th>
						<td class="ctq_list_f a3l_mean"></td>     
						<td class="ctq_list_f a3u_ng_rate"></td>  
						<td class="ctq_list_r a3l_mean"></td>     
						<td class="ctq_list_r a3u_ng_rate"></td>  
					</tr>
				</tbody>
			</table>
				<div class="img_wrapper">
					<c:if test="${unit.cd_val eq 'A'}">
						<img alt="Vision image" src="${rootPath}/resource/img/bts/cmi/lami/p1_a.png">
                  		</c:if>				
					<c:if test="${unit.cd_val eq 'C'}">
						<img alt="Vision image" style="margin-top: 10px;"src="${rootPath}/resource/img/bts/cmi/lami/p2_c.png">
		 			</c:if>
				</div>
			</div>
		</div>
		<div class="right_box">
			<!-- 차트 1 -->
		<div class="text-center" style="width:100%; height: 35%; border-radius: 15px; background-color: #333333; margin-bottom: 10px;">
			<div class="fl chart_main"  style="width:100%; height:100%;">
				<div class="text-center main_chart_title chart_title" >
					<label class="left-btn" style="padding: 0 30px;"> <i class="fa fa-caret-left"></i></label> 
						<span class="main_title"></span> 
					<label class="right-btn"  style="padding: 0 30px;"> <i class="fa fa-caret-right"></i></label>
				</div>
				<div id="mainChart" class="unit_chart"></div>
			</div>
		</div>
	<div class="cylinder_group">
		<div style="overflow: hidden; width: 100%; height: 100%;position:relative;">
			<img class="main_img" src="${rootPath}/resource/img/bts/cmi/lami/machine-image.png">
		</div>
		<div class="combiner">
			<span class="combiner-title">Combiner</span>
			<div style="position:relative; width:53px; z-index:99; left:81px; top:169px;  /* left:98px; top:111px; */">
				<table class="tb" style="border-collapse: collapse;">
					<thead>
					    <tr>
							<th class="h-10">3</th>
							<th class="h-10">4</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="dvc_3_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_4_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_3_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_4_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_3_MinPlusMax" headers="value" style="display:none;"></td>
							<td id="dvc_4_MinPlusMax" headers="value" style="display:none;"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position:relative; width:53px; z-index:99;  top:135px; left:149px;/*  top:66px; left:185px; */">
				<table class="tb" style="border-collapse: collapse;">
					<thead>
					    <tr>
							<th class="h-10">7</th>
							<th class="h-10">8</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="dvc_7_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_8_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_7_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_8_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_7_MinPlusMax" headers="value" style="display:none;"></td>
							<td id="dvc_8_MinPlusMax" headers="value" style="display:none;"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="laminator">
			<span class="laminator-title">Laminator</span>
			<div style="position:relative; width:53px; z-index:99; right:27px; top:61px; /*right:85px; top:20px;*/">
				<table class="tb" style="border-collapse: collapse;">
					<thead>
					    <tr>
							<th class="h-10">1</th>
							<th class="h-10">2</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="dvc_1_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_2_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_1_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_2_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_1_MinPlusMax" headers="value" style="display:none;"></td>
							<td id="dvc_2_MinPlusMax" headers="value" style="display:none;"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position:relative; width:53px; z-index:99; /* top:65px; right:15px; */ top:110px; right:-9px;">
				<table class="tb" style="border-collapse: collapse;">
					<thead>
					    <tr>
							<th class="h-10">&nbsp;9&nbsp;</th>
							<th class="h-10">10</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="dvc_9_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_10_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_9_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_10_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_9_MinPlusMax" headers="value" style="display:none;"></td>
							<td id="dvc_10_MinPlusMax" headers="value" style="display:none;"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position:relative; width:53px; z-index:99; /* top:110px; right:85px; */ top:155px; right:30px;">
				<table class="tb" style="border-collapse: collapse;">
					<thead>
					    <tr>
							<th class="h-10">5</th>
							<th class="h-10">6</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="dvc_5_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_6_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_5_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_6_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_5_MinPlusMax" headers="value" style="display:none;"></td>
							<td id="dvc_6_MinPlusMax" headers="value" style="display:none;"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="cutter">
			<span class="cutter-title">Cell, Final Cutter</span>
			<div style="position:relative; width:26px; z-index:99; right:52px; top:124px;">
				<table class="tb" style="border-collapse: collapse;">
					<thead>
					    <tr>
							<th class="h-10">11</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="dvc_11_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_11_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_11_MinPlusMax" headers="value" style="display:none;"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position:relative; width:53px; z-index:99; /* top:120px; right:15px;  */top:161px; right:15px;">
				<table class="tb" style="border-collapse: collapse;">
					<thead>
					    <tr>
							<th class="h-10">12</th>
							<th class="h-10">13</th>
							<th class="h-10">14</th>
							<th class="h-10">15</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="dvc_12_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_13_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_14_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_15_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_12_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_13_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_14_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_15_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_12_MinPlusMax" headers="value" style="display:none;"></td>
							<td id="dvc_13_MinPlusMax" headers="value" style="display:none;"></td>
							<td id="dvc_14_MinPlusMax" headers="value" style="display:none;"></td>
							<td id="dvc_15_MinPlusMax" headers="value" style="display:none;"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position:relative; width:53px; z-index:99; /* top:7px; left:145px; */ top:52px; left:104px;">
				<table class="tb" style="border-collapse: collapse;">
					<thead>
					    <tr>
							<th class="h-10">16</th>
							<th class="h-10">17</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="dvc_16_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_16_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_16_MinPlusMax" headers="value" style="display:none;"></td>
							<td id="dvc_17_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_17_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_17_MinPlusMax" headers="value" style="display:none;"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="position:relative;width:53px;z-index:99;/* left: 227px;bottom: 108px; */ left: 197px;bottom: 9px;">
				<table class="tb" style="border-collapse: collapse;">
					<thead>
					    <tr>
							<th class="h-10">18</th>
							<th class="h-10">19</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="dvc_18_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_19_" headers="title" class="h-10 title-off"></td>
							<td id="dvc_18_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_19_Rms" headers="value" style="display:none;"></td>
							<td id="dvc_18_MinPlusMax" headers="value" style="display:none;"></td>
							<td id="dvc_19_MinPlusMax" headers="value" style="display:none;"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="inspector">
			<span class="inspector-title">Cell, Inspector</span>
		</div>
		</div>
		<div class="result_group">
		<table class="tb" style="border-collapse: collapse; height: calc(100%);">
			<colgroup>
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
				<col width="100">
			</colgroup>
			<thead>
			    <tr>
					<th style="height:30px;" class="h-col">Count</th>
					<th style="height:30px;" class="h-col">Week</th>
					<th style="height:30px;" class="h-col">CYL1</th>
					<th style="height:30px;" class="h-col">CYL2</th>
					<th style="height:30px;" class="h-col">CYL3</th>
					<th style="height:30px;" class="h-col">CYL4</th>
					<th style="height:30px;" class="h-col">CYL5</th>
					<th style="height:30px;" class="h-col">CYL6</th>
					<th style="height:30px;" class="h-col">CYL7</th>
					<th style="height:30px;" class="h-col">CYL8</th>
					<th style="height:30px;" class="h-col">CYL9</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<tr>
					<td colspan="11" style="height:481px;"></td>
				</tr>
			</tbody>
		</table>
		</div>
	</div>
</div>