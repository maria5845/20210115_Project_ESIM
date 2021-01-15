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
    height: calc(100% - 20px);
}
.cylinder_group {
	width: calc(100%);
    height: calc(40% - 50px);
    margin-bottom: 10px;
    background: #292929;
    padding: 5px;
}
.result_group {
    width: calc(100%);
    height: calc(65% - 7px);
    margin: 0px 4px 0px 4px;
    overflow: hidden;
    overflow-y: auto;
}
.main_img {
	width: 1822px;
	height: 238px;
	object-fit: contain;
	position: absolute;
    top: 60px;
    left: 50px;
    z-index: 1;
    background-size: 100% 100%;
    background-repeat: no-repeat;
    background-position: center;
    background-image: url(/resource/img/bts/cmi/lami/machine-image.png);
}
.unwinder{
    width: calc(20% + 5px);
    height: calc(100%);
    border: 1px solid #5E5E5E;
    border-radius: 8px;
    margin-right: 3px;
}
.combiner{
	width: calc(17% + 1px);
    height: calc(100%);
    border: 1px solid #5E5E5E;
    border-radius: 8px;
    margin-right: 3px;
}
.laminator{
    width: calc(28% + 1px);
    height: calc(100%);
    border: 1px solid #5E5E5E;
    border-radius: 8px;
    margin-right: 3px;
}
.cutter{
	width: calc(14% + 13px);
    height: calc(100%);
    border: 1px solid #5E5E5E;
    border-radius: 8px;
    margin-right: 3px;
}
.inspector{
	width: calc(17% + 33px);
    height: calc(100%);
    border: 1px solid #5E5E5E;
    border-radius: 8px;
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
    width: 131px;
    height: 24px;
    background-color: #1c1c1c;
    text-align: center;
    line-height: 1.5;
    position: relative;
    top: 10px;
    left: 180px;
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
.cutter-title{
	display: inline-block;
    width: 217px;
    height: 24px;
    background-color: #1c1c1c;
    text-align: center;
    line-height: 1.5;
    position: relative;
    top: 10px;
    left: 31px;
}
.inspector-title{
	display: inline-block;
    width: 258px;
    height: 24px;
    background-color: #1c1c1c;
    text-align: center;
    line-height: 1.5;
    position: relative;
    top: 10px;
    left: 45px;
}
.h-col {
	font-size: 16px !important;
	font-weight: bold !important;
}
#tbody tr:nth-child(odd) td {
	background: #232831;
	height: 30px;
}
#tbody tr:nth-child(even) td {
	background: #1E2229;
	height: 30px;
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
</style>

<div class="wrapper">
	<div class="cylinder_group">
		<span class="main_img"></span>
		<div class="unwinder fl">
			<span class="unwinder-title">Unwinder</span>
		</div>
		<div class="combiner fl">
			<span class="combiner-title">Combiner</span>
			<div style="position:relative; width:53px; z-index:99; left:98px; top:111px;">
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
			<div style="position:relative; width:53px; z-index:99; top:66px; left:185px;">
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
		<div class="laminator fl">
			<span class="laminator-title">Laminator</span>
			<div style="position:relative; width:53px; z-index:99; right:85px; top:20px;">
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
			<div style="position:relative; width:53px; z-index:99; top:65px; right:15px;">
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
			<div style="position:relative; width:53px; z-index:99; top:110px; right:85px;">
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
		<div class="cutter fl">
			<span class="cutter-title">Cell, Final Cutter</span>
			<div style="position:relative; width:26px; z-index:99; right:70px; top:90px;">
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
			<div style="position:relative; width:53px; z-index:99; top:120px; right:15px;">
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
			<div style="position:relative; width:53px; z-index:99; top:7px; left:145px;">
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
			<div style="position:relative; width:53px; z-index:99; left:285px; bottom:65px;">
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
		<div class="inspector fl">
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